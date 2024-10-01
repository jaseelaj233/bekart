class Shopaddmodal {
  final String productname;
  final String price;
  final String details;
  final String quantity;
  final String shopname;
  final String productimage;
  final String category;
  final String rating;

  Shopaddmodal({
    required this.productname,
    required this.price,
    required this.details,
    required this.quantity,
    required this.shopname,
    required this.productimage,
    required this.category,
    required this.rating,
  });

  factory Shopaddmodal.fromJson(Map<String, dynamic> json) {
    return Shopaddmodal(
      productname: json['productname'] ?? '',
      price: json['price'] ?? '',
      details: json['details'] ?? '',
      quantity: json['quantity'] ?? '',
      shopname: json['shopname'] ?? '',
      productimage: json['productimage'] ?? '',
      category: json['category'] ?? '',
      rating: json['rating'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productname': productname,
      'price': price,
      'details': details,
      'quantity': quantity,
      'shopname': shopname,
      'productimage': productimage,
      'category': category,
      'rating': rating,
    };
  }
}
