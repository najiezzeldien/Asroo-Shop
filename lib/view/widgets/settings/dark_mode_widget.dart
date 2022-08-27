import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:naji_shop/logic/controllers/settings_controller.dart';
import 'package:naji_shop/logic/controllers/theme_controller.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          const SizedBox(
            width: 20,
          ),
          Switch(
            value: controller.switchValue.value,
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: Get.isDarkMode ? "Light Mode".tr : "Dark Mode".tr,
            fontsize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
