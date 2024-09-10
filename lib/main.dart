import 'package:carwash/api/preferences.dart';
import 'package:carwash/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await Get.putAsync(() => Preferences().init());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routers.login,
    getPages: Routers.routes,
  ));
}
