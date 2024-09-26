class UsersModel {
  final String name;
  final String address;

  final int phone;
  final String email;
  final String Password;

  UsersModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.Password,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
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
