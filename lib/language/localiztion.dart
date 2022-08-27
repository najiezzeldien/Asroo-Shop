import 'package:get/route_manager.dart';
import 'package:naji_shop/language/ar.dart';
import 'package:naji_shop/language/en.dart';
import 'package:naji_shop/language/fr.dart';
import 'package:naji_shop/utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
