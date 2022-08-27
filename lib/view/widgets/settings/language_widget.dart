import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/settings_controller.dart';
import 'package:naji_shop/utils/my_string.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: languageSettings,
                    ),
                    child: const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextUtils(
                    text: "Language".tr,
                    fontsize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: Text(
                        english,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: ene,
                    ),
                    DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: Text(
                        arabic,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: ara,
                    ),
                    DropdownMenuItem(
                      // ignore: sort_child_properties_last
                      child: Text(
                        france,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: frf,
                    ),
                  ],
                  value: controller.langLocal,
                  onChanged: (value) {
                    controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
