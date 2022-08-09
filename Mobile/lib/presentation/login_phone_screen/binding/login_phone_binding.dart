import '../controller/login_phone_controller.dart';
import 'package:get/get.dart';

class LoginPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPhoneController());
  }
}
