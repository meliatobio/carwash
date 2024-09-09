//import 'dart:convert';

class JenisKendaraan {
  final String idJenis;
  final String jenis;

  JenisKendaraan({required this.idJenis, required this.jenis});

  factory JenisKendaraan.fromJson(Map<String, dynamic> json) {
    return JenisKendaraan(
      idJenis: json['id_jenis'],
      jenis: json['jenis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_jenis': idJenis,
      'jenis': jenis,
    };
  }
}
