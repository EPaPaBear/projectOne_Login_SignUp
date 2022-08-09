import '../controller/register_phone_controller.dart';
import 'package:get/get.dart';

class RegisterPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPhoneController());
  }
}
