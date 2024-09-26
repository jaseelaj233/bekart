class Placementmodal {
  final String name;
  final String address;

  final int phone;
  final String email;
  final String Password;

  Placementmodal({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.Password,
  });
  factory Placementmodal.fromJson(Map<String, dynamic> json) {
    return Placementmodal(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      Password: json['password'],
    );
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'password': Password,
    };
  }
}
