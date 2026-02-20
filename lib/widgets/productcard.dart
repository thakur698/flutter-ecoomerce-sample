import 'package:flutter/material.dart';
import '../models/model.dart';

class Productcard extends StatelessWidget {
  final Product product;
  const Productcard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product-detail', arguments: product);
        },
        child: Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 11),
          child: Column(
            children: [
              SizedBox(
                height: 140,
                child: Hero(
                  tag: product.image,
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Rs ${product.price}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*ListTile(
        leading: Image.network(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('RS, ${product.price}'),
        onTap: () {
          Navigator.pushNamed(context, '/product-detail', arguments: product);
        },
      ),
      */