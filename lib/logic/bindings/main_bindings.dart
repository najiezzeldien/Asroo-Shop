import 'package:get/instance_manager.dart';
import 'package:naji_shop/logic/controllers/main_controller.dart';
import 'package:naji_shop/logic/controllers/payment_controller.dart';
import 'package:naji_shop/logic/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(
      PaymentController(),
      permanent: true,
    );
  }
}
