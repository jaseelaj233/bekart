import 'package:flutter/material.dart';

import '../../model/shopaddmodal.dart';

class CartModel extends ChangeNotifier {
  final List<Shopaddmodal> cartitems = [];

  void addToCart(Shopaddmodal product) {
    cartitems.add(product);

    notifyListeners(); // This will update any widget that listens to this model
  }

  void removeFromCart(Shopaddmodal producttt) {
    cartitems.remove(producttt); // Notify listeners about removal
    notifyListeners();
  }

  double get totalPrice => cartitems.fold(
      0.0, (total, current) => total + double.parse(current.price));

  bool iaInCart(Shopaddmodal product) {
    return cartitems.contains(product);
  }
}
