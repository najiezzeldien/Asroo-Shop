import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textType,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  final String textType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontsize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textType,
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
