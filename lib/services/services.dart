import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_ecommerce_sample/models/model.dart';

class ProductServices {
  Future<List<Product>> fetchproduct() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromjson(e)).toList();
    } else {
      throw Exception('failed to load data ');
    }
  }
}
