class AddressModel {
  final String name;
  final String address;

  final int phone;

  final String landmark;

  AddressModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.landmark,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      landmark: json['landmark'],
    );
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'landmark': landmark
    };
  }
}
