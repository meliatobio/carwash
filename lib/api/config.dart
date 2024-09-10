import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Api {
  final box = GetStorage();
  final url = 'https://carwash.diatakasir.com/api';

// API login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await http.post(
      Uri.parse('$url/login'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        "email": email,
        "password": password,
      },
    );
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception("koneksi gagal");
    }
  }

// API register
  Future<Map<String, dynamic>> registerUser(String password, String nama,
      String email, String telpon, String alamat) async {
    final response = await http.post(
      Uri.parse('$url/register'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'nama_user': nama,
        'no_hp': telpon,
        'email': email,
        'password': password,
        'alamat': alamat,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal Mendaftar User');
    }
  }

// API untuk mendapatkan data kategori layanan
  Future<List> fetchLayanan() async {
    final response = await http.get(Uri.parse('$url/KategoriLayanan'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      // return data.map((json) => Layanan.fromJson(json)).toList();
      return data;
    } else {
      throw Exception('Failed to load layanan');
    }
  }

// API untuk mendapatkan daftar harga
  Future<List> fetchDaftarHarga() async {
    final result = await http.get('$url/DaftarHarga' as Uri);
    if (result.statusCode == 200) {
      var dataHarga = jsonDecode(result.body);
      return dataHarga;
    } else {
      return [];
    }
  }

// API untuk mendapatkan jenis kendaraan

  Future<List> fetchJenisKendaraan() async {
    final response = await http.get(Uri.parse('$url/JenisKendaraan'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // return data.map((json) => JenisKendaraan.fromJson(json)).toList();
      return data;
    } else {
      throw Exception('Failed to load jenis kendaraan');
    }
  }

// API untuk mendapatkan ukuran kendaraan
  Future<List> fetchSizeKendaraan() async {
    final result = await http.get('$url/SizeKendaraan' as Uri);
    if (result.statusCode == 200) {
      var dataSize = jsonDecode(result.body);
      return dataSize;
    } else {
      return [];
    }
  }
}
