import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:naji_shop/logic/controllers/auth_controller.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.defaultDialog(
                title: "Log Out From App",
                titleStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                middleText: "Are you sure you need to log out",
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
                  Get.back();
                },
                onConfirm: () {
                  controller.singOutFromApp();
                },
                buttonColor: Get.isDarkMode ? pinkClr : mainColor,
              );
            },
            splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
            borderRadius: BorderRadius.circular(12),
            customBorder: const StadiumBorder(),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: logOutSettings,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtils(
                  text: "Log Out".tr,
                  fontsize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
