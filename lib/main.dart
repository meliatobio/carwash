import 'package:carwash/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routers.login,
    getPages: Routers.routes,
  ));
}
