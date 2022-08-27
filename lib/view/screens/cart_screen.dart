import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/cart_controller.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/cart/cart_product_card.dart';
import 'package:naji_shop/view/widgets/cart/cart_total.dart';
import 'package:naji_shop/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          actions: [
            IconButton(
              onPressed: () {
                controller.cleanAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            quantity:
                                controller.productsMap.values.toList()[index],
                            productModel:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
