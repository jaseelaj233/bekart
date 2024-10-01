import 'package:flutter/material.dart';

import '../../model/shopaddmodal.dart';

class CartModel extends ChangeNotifier{
  final List<Shopaddmodal> _cartitems =[];

  List<Shopaddmodal> get CartItems => _cartitems;

  void addToCart(Shopaddmodal product){
    _cartitems.add(product);

    notifyListeners();// This will update any widget that listens to this model
  }
  void removeFromCart(Shopaddmodal producttt){
    _cartitems.remove(producttt);// Notify listeners about removal
    notifyListeners();
  }

  double get totalPrice => _cartitems.fold(0.0, (total,current)=> total +double.parse(current.price));

  bool iaInCart(Shopaddmodal product){
    return _cartitems.contains(product);
  }


}