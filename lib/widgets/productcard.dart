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
          margin: EdgeInsets.symmetric(vertical: 13, horizontal: 11),
          child: Column(
            children: [
              SizedBox(
                height: 155,
                child: Hero(
                  tag: product.image,
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Rs ${product.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
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