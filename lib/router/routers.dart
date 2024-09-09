import 'package:carwash/screens/login.dart';
import 'package:get/get.dart';

class Routers {
  static const login = '/login';

  static final routes = [
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
  ];
}
