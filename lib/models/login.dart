import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginModel {
  final String apiUrl = 'https://carwash.diatakasir.com/api/login';

  Future<bool> login(String email, String password) async {
    try {
      // Lakukan permintaan GET untuk mengambil semua data pengguna
      final getUsersResponse = await http.get(Uri.parse(apiUrl));

      if (getUsersResponse.statusCode == 200) {
        final List<dynamic> usersData = json.decode(getUsersResponse.body);

        // Cek apakah email dan password cocok dengan data yang ada di API
        final matchedUser = usersData.firstWhere(
          (user) => user['email'] == email && user['password'] == password,
          orElse: () => null,
        );

        if (matchedUser != null) {
          print('Login berhasil untuk user: ${matchedUser['nama_user']}');
          return true;
        } else {
          print('Login gagal: Email atau password salah');
          return false;
        }
      } else {
        throw Exception(
            'Gagal mengambil data pengguna, status code: ${getUsersResponse.statusCode}');
      }
    } catch (e) {
      print('Exception selama login: $e');
      return false;
    }
  }
}
