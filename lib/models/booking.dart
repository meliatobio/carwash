import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';

class BookingModel {
  final String idBooking;
  final String idUser;
  final String idJenis;
  final String idSize;
  final String idPaket;
  final String noPlat;
  final String tglBooking;
  final String jamBooking;
  final int total;
  final int dp;
  final int sisa;
  final String bukti;
  final String status;

  BookingModel({
    required this.idBooking,
    required this.idUser,
    required this.idJenis,
    required this.idSize,
    required this.idPaket,
    required this.noPlat,
    required this.tglBooking,
    required this.jamBooking,
    required this.total,
    required this.dp,
    required this.sisa,
    required this.bukti,
    required this.status,
  });

  Future<bool> submitBooking() async {
    // Implementasi untuk mengirim data booking ke server
    return true; // Ubah dengan kondisi yang sesuai dari respons server
  }
}

// Model untuk data layanan
// class Layanan {
//   final String idKategori;
//   final String namaKategori;

//   Layanan({required this.idKategori, required this.namaKategori});

//   factory Layanan.fromJson(Map<String, dynamic> json) {
//     return Layanan(
//       idKategori: json['id_kategori'],
//       namaKategori: json['nama_kategori'],
//     );
//   }

//   get harga => null;

//   static Future<List<Layanan>> fetchLayanan() async {
//     final response = await http.get(
//       Uri.parse('https://carwash.diatakasir.com/api/KategoriLayanan'),
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Layanan.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load layanan');
//     }
//   }
// }

// Model untuk data Jenis Kendaraan
// class JenisKendaraan {
//   final String idJenis;
//   final String jenis;

//   JenisKendaraan({required this.idJenis, required this.jenis});

//   factory JenisKendaraan.fromJson(Map<String, dynamic> json) {
//     return JenisKendaraan(
//       idJenis: json['id_jenis'],
//       jenis: json['jenis'],
//     );
//   }

//   static Future<List<JenisKendaraan>> fetchJenisKendaraan() async {
//     final response = await http.get(
//       Uri.parse('https://carwash.diatakasir.com/api/JenisKendaraan'),
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => JenisKendaraan.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load jenis kendaraan');
//     }
//   }
// }

class SizeKendaraan {
  final String idSize;
  final String size;

  SizeKendaraan({required this.idSize, required this.size});

  factory SizeKendaraan.fromJson(Map<String, dynamic> json) {
    return SizeKendaraan(
      idSize: json['id_size'],
      size: json['size'],
    );
  }

  get harga => null;

  static Future<List<SizeKendaraan>> fetchSizeKendaraan() async {
    final response = await http.get(
      Uri.parse('https://carwash.diatakasir.com/api/SizeKendaraan'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SizeKendaraan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load size kendaraan');
    }
  }
}
