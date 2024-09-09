import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterModel {
  final String email;
  final String password;
  final String namaUser;
  final String noHp;
  final String alamat;

  RegisterModel({
    required this.email,
    required this.password,
    required this.namaUser,
    required this.noHp,
    required this.alamat,
  });

  Future<bool> register() async {
    const String apiUrl = 'https://carwash.diatakasir.com/api/user'; // URL API

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Form-data
        },
        body: {
          'email': email,
          'password': password,
          'nama_user': namaUser,
          'no_hp': noHp,
          'alamat': alamat,
        },
      );

      // Log status code dan body untuk debugging
      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Check if the response is successful
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        // Periksa apakah respons berisi data yang diharapkan
        if (responseData['email'] == email &&
            responseData['nama_user'] == namaUser &&
            responseData['no_hp'] == noHp &&
            responseData['alamat'] == alamat) {
          return true;
        } else {
          print('Failed to register: Data mismatch');
          return false;
        }
      } else {
        print('Failed to register: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}
