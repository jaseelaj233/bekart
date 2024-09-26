class Formmodal {
  final String name;
  final String age;
  final int phone;
  final String course;

  Formmodal({
    required this.name,
    required this.age,
    required this.phone,
    required this.course,
  });
  factory Formmodal.fromJson(Map<String, dynamic> json) {
    return Formmodal(
      name: json['name'],
      age: json['age'],
      phone: json['phone'],
      course: json['course'],
    );
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'phone': phone,
      'cource': course,
    };
  }
}
