import 'package:flutter_ecommerce_sample/models/model.dart';

class Cartmodel {
  final Product product;
  int quantity;
  Cartmodel({required this.product, this.quantity = 1});
  double get totalprice {
    return product.price * quantity;
  }
}
