import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/provider/cartprovider.dart';
import 'package:provider/provider.dart';
import '../models/model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final cart = Provider.of<Cartprovider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 290,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Hero(
              tag: product.image,
              child: Image.network(product.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "₹ ${product.price}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: Chip(label: Text(product.category)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: Text(
              product.description,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Add to cart ')));
          cart.addtocart(product);
        },
        label: Text("Add to Cart"),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}
