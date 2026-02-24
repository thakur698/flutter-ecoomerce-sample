import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/models/model.dart';
import 'package:flutter_ecommerce_sample/models/cart.dart';

class Cartprovider extends ChangeNotifier {
  final List<Cartmodel> _items = [];

  // expose cart items
  List<Cartmodel> get items => _items;

  // badge count
  int get itemCount => _items.length;

  // TOTAL BILL
  double get totalprice {
    double total = 0;

    for (var item in _items) {
      total += item.totalprice;
    }

    return total;
  }

  // ADD TO CART
  void addToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      // product already exists → increase quantity
      _items[index].quantity++;
    } else {
      // first time add
      _items.add(Cartmodel(product: product));
    }

    notifyListeners();
  }

  // REMOVE PRODUCT COMPLETELY
  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  // DECREASE QUANTITY
  void decreaseQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
    }

    notifyListeners();
  }
}
