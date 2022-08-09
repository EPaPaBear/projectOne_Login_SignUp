import 'package:test/presentation/dashboard_phone_screen/dashboard_phone_screen.dart';
import 'package:test/presentation/dashboard_phone_screen/binding/dashboard_phone_binding.dart';
import 'package:test/presentation/login_phone_screen/login_phone_screen.dart';
import 'package:test/presentation/login_phone_screen/binding/login_phone_binding.dart';
import 'package:test/presentation/register_phone_screen/register_phone_screen.dart';
import 'package:test/presentation/register_phone_screen/binding/register_phone_binding.dart';
import 'package:test/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:test/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String dashboardPhoneScreen = '/dashboard_phone_screen';

  static String loginPhoneScreen = '/login_phone_screen';

  static String registerPhoneScreen = '/register_phone_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: dashboardPhoneScreen,
      page: () => DashboardPhoneScreen(),
      bindings: [
        DashboardPhoneBinding(),
      ],
    ),
    GetPage(
      name: loginPhoneScreen,
      page: () => LoginPhoneScreen(),
      bindings: [
        LoginPhoneBinding(),
      ],
    ),
    GetPage(
      name: registerPhoneScreen,
      page: () => RegisterPhoneScreen(),
      bindings: [
        RegisterPhoneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginPhoneScreen(),
      bindings: [
        LoginPhoneBinding(),
      ],
    )
  ];
}
