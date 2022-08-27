import 'package:flutter/material.dart';
import 'package:naji_shop/logic/controllers/cart_controller.dart';
import 'package:naji_shop/logic/controllers/category_controller.dart';
import 'package:naji_shop/logic/controllers/product_controller.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/screens/product_details_screen.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({
    Key? key,
    required this.catogeryTitle,
  }) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final catogoryController = Get.find<CategoryController>();
  final String catogeryTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(
            catogeryTitle,
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (catogoryController.isAllcategory.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: catogoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return buildCardItem(
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(
                        productModel: catogoryController.categoryList[index],
                      ),
                    );
                  },
                  id: catogoryController.categoryList[index].id,
                  image: catogoryController.categoryList[index].image,
                  price: catogoryController.categoryList[index].price,
                  rate: catogoryController.categoryList[index].rating.rate,
                  productModel: catogoryController.categoryList[index],
                );
              },
            );
          }
        }),
      ),
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
