import 'package:get/get.dart';
import 'package:naji_shop/view/screens/category_screen.dart';
import 'package:naji_shop/view/screens/favorites_screen.dart';
import 'package:naji_shop/view/screens/home_screen.dart';
import 'package:naji_shop/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoritesScreen(),
    const SettingScreen(),
  ].obs;
  final title = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Settings',
  ];
}
