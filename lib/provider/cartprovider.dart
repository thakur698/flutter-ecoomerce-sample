import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/models/model.dart';

class Cartprovider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;
  int get itemCount => _items.length;

  double get totalprice {
    double total = 0;
    for (var product in _items) {
      total += product.price;
    }
    return total;
  }

  void addtocart(Product product) {
    items.add(product);
    notifyListeners();
  }

  void removefromcart(Product product) {
    items.remove(product);
    notifyListeners();
  }
}
