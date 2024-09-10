import 'package:carwash/api/config.dart';
import 'package:carwash/api/preferences.dart';
import 'package:carwash/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var hiddenPass = true.obs;
  var isAuth = false;
  var isLoading = false.obs;

  var isEmail = false.obs;
  var isTelpon = false.obs;
  var isPassword = false.obs;
  var isAlamat = false.obs;

  final api = Api();
  final Preferences _prefsService = Get.find();

  late TextEditingController nama;
  late TextEditingController email;
  late TextEditingController telpon;
  late TextEditingController password;
  late TextEditingController alamat;

  @override
  void onInit() async {
    super.onInit();
    nama = TextEditingController();
    email = TextEditingController();
    telpon = TextEditingController();
    password = TextEditingController();
    alamat = TextEditingController();

    var usern = _prefsService.getEmail() ?? "";

    if (usern != "") {
      login(
        _prefsService.getEmail().toString(),
        _prefsService.getPassword().toString(),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();

    nama.clear();
    email.clear();
    telpon.clear();
    password.clear();
    alamat.clear();
  }

  void login(String email, String password) async {
    if (email.isEmpty) {
      isEmail.toggle();
      Get.snackbar("error", "Username kosong");
    }

    if (password.isEmpty) {
      isPassword.toggle();
      Get.snackbar("error", "Password kosong");
    }

    final data = await api.login(email, password);
    print(data);
    if (data['status'] == 'Login Berhasil') {
      isAuth = true;
      // await _saveUserData(data['user']);

      Get.offNamed(Routers.dashboard);
      Get.snackbar("informasi", data['status']);
    } else {
      Get.snackbar("informasi", "Pastikan Data Benar");
    }
  }

  void register(
    String nama,
    String email,
    String password,
    String telpon,
    String alamat,
  ) async {
    if (email.isEmpty) {
      isEmail.toggle();
      Get.snackbar("error", "Email kosong");
    }

    if (telpon.isEmpty) {
      isTelpon.toggle();
      Get.snackbar("error", "No Telpon kosong");
    }

    if (password.isEmpty) {
      isPassword.toggle();
      Get.snackbar("error", "Password kosong");
    }

    if (alamat.isEmpty) {
      isAlamat.toggle();
      Get.snackbar("error", "Alamat kosong");
    }

    final data = await api.registerUser(password, nama, email, telpon, alamat);

    if (data['status'] == 'success') {
      Get.offNamed(Routers.login);

      Get.snackbar("informasi", data['message']);
    } else {
      Get.snackbar("informasi", "Pastikan Data Benar");
    }
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Apakah Anda yakin ingin keluar?',
      textConfirm: 'Yes',
      textCancel: 'No',
      confirmTextColor: Colors.white,
      onConfirm: () {
        _prefsService.setEmail("");
        _prefsService.setPassword("");
        _prefsService.setId("");
        Get.back();
        Get.offNamed(Routers.login);
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    await _prefsService.setEmail(userData['email']);
    await _prefsService.setPassword(userData['password']);
    await _prefsService.setId(userData['id']);
    await _prefsService.setNama(userData['nama']);
  }
}
