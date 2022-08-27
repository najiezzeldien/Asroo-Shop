import 'package:get/get.dart';
import 'package:naji_shop/logic/bindings/auth_binding.dart';
import 'package:naji_shop/logic/bindings/main_bindings.dart';
import 'package:naji_shop/logic/bindings/product_binding.dart';

import 'package:naji_shop/view/screens/auth/forgot_password_screen.dart';
import 'package:naji_shop/view/screens/auth/login_screen.dart';
import 'package:naji_shop/view/screens/auth/singup_screen.dart';
import 'package:naji_shop/view/screens/cart_screen.dart';
import 'package:naji_shop/view/screens/main_screen.dart';
import 'package:naji_shop/view/screens/payment_screen.dart';
import 'package:naji_shop/view/screens/wellcome_screen.dart';

class AppRoutes {
  // initialRoute
  static const wellcome = Routes.wellcomeScreen;
  static const mainScreen = Routes.mainScreen;

  // getPages
  static final routes = [
    GetPage(
      name: Routes.wellcomeScreen,
      page: () => const WellcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.singUpScreen,
      page: () => SingUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => const PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const wellcomeScreen = "/wellcomeScreen";
  static const loginScreen = "/loginScreen";
  static const singUpScreen = "/singUpScreen";
  static const forgotPasswordScreen = "/forgotPasswordScreen";
  static const mainScreen = "/mainScreen";
  static const cartScreen = "/cartScreen";
  static const paymentScreen = "/paymentScreen";
}
