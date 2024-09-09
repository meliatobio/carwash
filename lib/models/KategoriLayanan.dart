class Layanan {
  final String idKategori;
  final String namaKategori;
  final String gambarKategori;
  final String deskripsi;

  Layanan({
    required this.idKategori,
    required this.namaKategori,
    required this.gambarKategori,
    required this.deskripsi,
  });

  // Factory method untuk parsing dari JSON
  factory Layanan.fromJson(Map<String, dynamic> json) {
    return Layanan(
      idKategori: json['id_kategori'],
      namaKategori: json['nama_kategori'],
      gambarKategori: json['gambar_kategori'],
      deskripsi: json['deskripsi'],
    );
  }

  // Method untuk mengubah ke format JSON
  Map<String, dynamic> toJson() {
    return {
      'id_kategori': idKategori,
      'nama_kategori': namaKategori,
      'gambar_kategori': gambarKategori,
      'deskripsi': deskripsi,
    };
  }
}
