import '../controller/dashboard_phone_controller.dart';
import 'package:get/get.dart';

class DashboardPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardPhoneController());
  }
}
