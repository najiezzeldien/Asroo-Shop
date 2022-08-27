import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/routes/routes.dart';
import 'package:naji_shop/utils/theme.dart';

import 'package:naji_shop/view/widgets/text_utils.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        text: 'wellcome',
                        fontsize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Naji',
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                          text: 'Shop',
                          fontsize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        )),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      text: 'Get start',
                      fontsize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't have an Account?",
                        fontsize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.singUpScreen);
                        },
                        child: TextUtils(
                          text: "Sing up",
                          color: Colors.white,
                          fontsize: 18,
                          fontWeight: FontWeight.normal,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
