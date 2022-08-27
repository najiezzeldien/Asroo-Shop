import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) {
        return TextField(
          controller: controller.searchTextController,
          cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            controller.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: Get.isDarkMode ? Colors.black : Colors.white,
            focusColor: Colors.red,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: controller.searchTextController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.clearSeachFromList();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  )
                : null,
            hintText: "Search by name or price",
            hintStyle: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
