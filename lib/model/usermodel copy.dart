class profileModel {
  final String name;
  final String address;

  final int phone;

  profileModel({
    required this.name,
    required this.address,
    required this.phone,
  });
  factory profileModel.fromJson(Map<String, dynamic> json) {
    return profileModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
    };
  }
}
