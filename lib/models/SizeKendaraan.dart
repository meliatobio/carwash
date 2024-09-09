class SizeKendaraan {
  String? idSize;
  String? size;

  SizeKendaraan({this.idSize, this.size});

  SizeKendaraan.fromJson(Map<String, dynamic> json) {
    idSize = json['id_size'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_size'] = this.idSize;
    data['size'] = this.size;
    return data;
  }
}
