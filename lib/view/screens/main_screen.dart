import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/cart_controller.dart';
import 'package:naji_shop/logic/controllers/main_controller.dart';
import 'package:naji_shop/routes/routes.dart';
import 'package:naji_shop/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(controller.title[controller.currentIndex.value].tr),
            centerTitle: true,
            leading: Container(),
            elevation: 0,
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(
                    top: 0,
                    end: 3,
                  ),
                  animationDuration: const Duration(
                    milliseconds: 300,
                  ),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.cartScreen,
                      );
                    },
                    icon: Image.asset(
                      "assets/images/shop.png",
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            // ignore: invalid_use_of_protected_member
            children: controller.tabs.value,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
        );
      }),
    );
  }
}
