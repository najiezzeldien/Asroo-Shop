// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naji_shop/logic/controllers/cart_controller.dart';
import 'package:naji_shop/logic/controllers/product_controller.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/screens/product_details_screen.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: controller.searchList.isEmpty &&
                    controller.searchTextController.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset("assets/images/search_empty_dark.png")
                    : Image.asset("assets/images/search_empry_light.png")
                : GridView.builder(
                    itemCount: controller.searchList.isEmpty
                        ? controller.productList.length
                        : controller.searchList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 6.0,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      if (controller.searchList.isNotEmpty) {
                        return buildCardItem(
                          onTap: () {
                            Get.to(
                              () => ProductDetailsScreen(
                                productModel: controller.searchList[index],
                              ),
                            );
                          },
                          id: controller.searchList[index].id,
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productModel: controller.searchList[index],
                        );
                      } else {
                        return buildCardItem(
                          onTap: () {
                            Get.to(
                              () => ProductDetailsScreen(
                                productModel: controller.productList[index],
                              ),
                            );
                          },
                          id: controller.productList[index].id,
                          image: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rate: controller.productList[index].rating.rate,
                          productModel: controller.productList[index],
                        );
                      }
                    },
                  ),
          );
        }
      },
    );
  }

  Widget buildCardItem({
    required int id,
    required String image,
    required double price,
    required double rate,
    required ProductModel productModel,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavorites(id);
                        },
                        icon: controller.isFavorites(id)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModel);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextUtils(
                      text: "\$ $price",
                      fontsize: 14,
                      underLine: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextUtils(
                              text: "$rate",
                              fontsize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
