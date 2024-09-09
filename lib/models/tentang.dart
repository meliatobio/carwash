import 'dart:convert';
import 'package:http/http.dart' as http;

class Tentang {
  final String idAbout;
  final String jamKerja;
  final String noHp;
  final String alamat;
  final String deskripsi;
  final String foto;

  Tentang({
    required this.idAbout,
    required this.jamKerja,
    required this.noHp,
    required this.alamat,
    required this.deskripsi,
    required this.foto,
  });

  factory Tentang.fromJson(Map<String, dynamic> json) {
    return Tentang(
      idAbout: json['id_about'],
      jamKerja: json['jam_kerja'],
      noHp: json['no_hp'],
      alamat: json['alamat'],
      deskripsi: json['deskripsi'],
      foto: json['foto'],
    );
  }

  static Future<Tentang> fetchTentang() async {
    final response =
        await http.get(Uri.parse('https://carwash.diatakasir.com/api/about'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return Tentang.fromJson(
          data[0]); // Asumsikan data yang diambil adalah yang pertama di array
    } else {
      throw Exception('Failed to load Tentang data');
    }
  }
}
