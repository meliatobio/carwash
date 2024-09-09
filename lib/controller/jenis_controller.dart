import 'dart:convert';

// import 'package:carwash/models/JenisKendaraan.dart'; // Ensure this path is correct
import 'package:carwash/api/config.dart';
import 'package:carwash/models/JenisKendaraan.dart';
import 'package:get/get.dart'; // Ensure this path is correct

class JenisKendaraanController extends GetxController {
  List jenisKendaraanList = <JenisKendaraan>[].obs;

  final _api = Api();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getJenisKendaraan();
  }

  void getJenisKendaraan() async {
    final data = await _api.fetchJenisKendaraan();
  }
}
