import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naji_shop/language/localiztion.dart';
import 'package:naji_shop/logic/controllers/theme_controller.dart';
import 'package:naji_shop/routes/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'package:naji_shop/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>("lang").toString()),
      //fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      translations: LocaliztionApp(),
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.wellcome,
      getPages: AppRoutes.routes,
    );
  }
}
