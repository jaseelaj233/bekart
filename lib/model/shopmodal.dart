class Shopmodal {
  final String name;
  final String ownwnername;
  final String details;

  final licencepic;
  final int phone;

  final String email;
  final String Password;

  Shopmodal({
    required this.name,
    required this.ownwnername,
    required this.details,
    required this.licencepic,
    required this.phone,
    required this.email,
    required this.Password,
  });
  factory Shopmodal.fromJson(Map<String, dynamic> json) {
    return Shopmodal(
      name: json['name'],
      ownwnername: json['ownername'],
      details: json['details'],
      licencepic: json['licence'],
      phone: json['phone'],
      email: json['email'],
      Password: json['password'],
    );
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ownername': ownwnername,
      'details': details,
      'licencepic': licencepic,
      'phone': phone,
      'email': email,
      'password': Password,
    };
  }
}
