class Shopaddmodal {
  final String productname;
  final String price;
  final String quantity;
  final String shopname;
  final String rating;

  final details;
  final String productimage;

  Shopaddmodal({
    required this.productname,
    required this.price,
    required this.details,
    required this.quantity,
    required this.productimage,
    required this.shopname,
    required this.rating,
  });
  factory Shopaddmodal.fromJson(Map<String, dynamic> json) {
    return Shopaddmodal(
        productname: json['productname'],
        price: json['price'],
        details: json['details'],
        quantity: json['quantity'],
        productimage: json['productimgae'],
        shopname: json['shopname'],
        rating: json['rating']);
  }

  get docs => null;
  Map<String, dynamic> toJson() {
    return {
      'productname': productname,
      'price': price,
      'details': details,
      'quantity': quantity,
      'productimage': productimage,
      'shopname': shopname,
      'rating': rating,
    };
  }
}
