import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/payment/delivery_continer_widget.dart';
import 'package:naji_shop/view/widgets/payment/paymet_method_widget.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Payment"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: "Shipping to",
                  fontsize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const DeliveryContainerWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  text: "Payment method",
                  fontsize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PaymentMethodWidget(),
                const SizedBox(
                  height: 30,
                ),
                TextUtils(
                  text: "Total: 200\$",
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      child: Text(
                        "Pay Now",
                        style: TextStyle(
                          fontSize: 22,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
