class KategoriHarga {
  String? idHarga;
  String? idJenis;
  String? idSize;
  String? idPaket;
  String? harga;
  String? jenis;
  String? size;
  String? idKategori;
  String? namaPaket;
  String? gambarPaket;
  String? deskripsi;

  KategoriHarga(
      {this.idHarga,
      this.idJenis,
      this.idSize,
      this.idPaket,
      this.harga,
      this.jenis,
      this.size,
      this.idKategori,
      this.namaPaket,
      this.gambarPaket,
      this.deskripsi});

  KategoriHarga.fromJson(Map<String, dynamic> json) {
    idHarga = json['id_harga'];
    idJenis = json['id_jenis'];
    idSize = json['id_size'];
    idPaket = json['id_paket'];
    harga = json['harga'];
    jenis = json['jenis'];
    size = json['size'];
    idKategori = json['id_kategori'];
    namaPaket = json['nama_paket'];
    gambarPaket = json['gambar_paket'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_harga'] = idHarga;
    data['id_jenis'] = idJenis;
    data['id_size'] = idSize;
    data['id_paket'] = idPaket;
    data['harga'] = harga;
    data['jenis'] = jenis;
    data['size'] = size;
    data['id_kategori'] = idKategori;
    data['nama_paket'] = namaPaket;
    data['gambar_paket'] = gambarPaket;
    data['deskripsi'] = deskripsi;
    return data;
  }
}
