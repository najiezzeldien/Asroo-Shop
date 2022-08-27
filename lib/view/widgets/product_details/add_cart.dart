import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/cart_controller.dart';
import 'package:naji_shop/model/product_models.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({
    Key? key,
    required this.price,
    required this.productModel,
  }) : super(key: key);
  final double price;
  final ProductModel productModel;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "Price",
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.grey,
                underLine: TextDecoration.none,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  controller.addProductToCart(productModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
