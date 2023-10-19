import 'package:get/get.dart';
import 'package:mobile_assessment/ui/views/home/home_screen.dart';
import 'package:mobile_assessment/ui/views/home/home_screen_binding.dart';
import 'package:mobile_assessment/ui/views/home/splash/splash_binding.dart';
import 'package:mobile_assessment/ui/views/home/splash/splash_screen.dart';

class AppRoutes {

  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeScreenBinding(),
      ],
    ),
  ];
}
