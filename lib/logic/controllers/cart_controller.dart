import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/routes/routes.dart';
import 'package:naji_shop/utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;
  void addProductToCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
      productsMap.entries
          .map(
            (product) => product.key.price * product.value,
          )
          .toList();
    } else {
      productsMap[productModel] = 1;
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void cleanAllProducts() {
    Get.defaultDialog(
      title: "Clean All Products ",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Are you sure you need to clean all products from cart",
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: "No",
      cancelTextColor: Colors.white,
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal => productsMap.entries
      .map(
        (product) => product.key.price * product.value,
      )
      .toList();
  get total => productsMap.entries
      .map(
        (product) => product.key.price * product.value,
      )
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries.map((e) => e.value).toList().reduce(
            (value, element) => value + element,
          );
    }
  }
}
