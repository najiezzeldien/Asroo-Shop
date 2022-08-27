import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        text: text,
        fontsize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        underLine: TextDecoration.none,
      ),
    );
  }
}
