class Profile {
  String name;
  String phone;
  String address;
  String email;

  Profile({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['nama_user'], // Mapping sesuai dengan API
      phone: json['no_hp'],
      address: json['alamat'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_user': name,
      'no_hp': phone,
      'alamat': address,
      'email': email,
    };
  }
}
