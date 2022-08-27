import 'package:flutter/material.dart';
import 'package:naji_shop/logic/controllers/auth_controller.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? const Icon(
                            Icons.done,
                            size: 30,
                            color: pinkClr,
                          )
                        : Image.asset('assets/images/check.png')
                    : Container(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                  text: 'I accept ',
                  fontsize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                  text: 'terms & conditions',
                  fontsize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
