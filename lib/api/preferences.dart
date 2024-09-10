import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends GetxService {
  late SharedPreferences _prefs;

  Future<Preferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String? getPassword() => _prefs.getString('password');
  String? getNama() => _prefs.getString('nama');
  String? getId() => _prefs.getString('id');
  String? getEmail() => _prefs.getString('email');

  Future<bool> setPassword(String password) =>
      _prefs.setString('password', password);
  Future<bool> setNama(String nama) => _prefs.setString('nama', nama);
  Future<bool> setId(String id) => _prefs.setString('id', id);
  Future<bool> setEmail(String email) => _prefs.setString('email', email);
}
