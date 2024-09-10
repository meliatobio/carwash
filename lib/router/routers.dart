import 'package:carwash/view/auth/login.dart';
import 'package:carwash/view/auth/register.dart';
import 'package:carwash/view/dashboard/dashboard.dart';
import 'package:get/get.dart';

class Routers {
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';

  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
    ),
  ];
}
