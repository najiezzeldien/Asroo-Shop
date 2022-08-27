import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var favoritesList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
  // Search var
  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    storage.read<List>("isFavoriteList");
    List? storedShopings = GetStorage().read<List>('isFavoriteList');

    if (storedShopings != null) {
      favoritesList =
          storedShopings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getAllProducts();
  }

  void getAllProducts() async {
    var products = await ProductServices.getAllProduct();
    try {
      isLoading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Logic for favorites screen
  void manageFavorites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((product) => product.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove('isFavoriteList');
    } else {
      favoritesList.add(
        productList.firstWhere(
          (product) => product.id == productId,
        ),
      );
      await storage.write("isFavoriteList", favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((product) => product.id == productId);
  }

  // Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where(
      (product) {
        var searchTitle = product.title.toLowerCase();
        var searchPrice = product.price.toString().toLowerCase();
        return searchTitle.contains(searchName) ||
            searchPrice.toString().contains(searchName);
      },
    ).toList();
    update();
  }

  void clearSeachFromList() {
    searchTextController.clear();
    addSearchToList("");
  }
}
