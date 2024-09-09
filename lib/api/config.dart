import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carwash/models/JenisKendaraan.dart';
import 'package:carwash/models/KategoriLayanan.dart';

class Api {
  final url = 'https://carwash.diatakasir.com/api';

// API untuk mendapatkan data kategori layanan
  Future<List<Layanan>> fetchLayanan() async {
    final response = await http.get(Uri.parse('$url/KategoriLayanan'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Layanan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load layanan');
    }
  }

// API untuk mendapatkan daftar harga
  Future<List<dynamic>> fetchDaftarHarga() async {
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
      return data.map((json) => JenisKendaraan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jenis kendaraan');
    }
  }

// API untuk mendapatkan ukuran kendaraan
  Future<List<dynamic>> fetchSizeKendaraan() async {
    final result = await http.get('$url/SizeKendaraan' as Uri);
    if (result.statusCode == 200) {
      var dataSize = jsonDecode(result.body);
      return dataSize;
    } else {
      return [];
    }
  }
}
