import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/provider/cartprovider.dart';
import 'package:flutter_ecommerce_sample/screens/cartscreen.dart';
import 'package:flutter_ecommerce_sample/screens/detailedsc.dart';
import 'package:flutter_ecommerce_sample/screens/home.dart';
import 'package:flutter_ecommerce_sample/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/product-detail': (context) => ProductDetail(),
        '/cartscreen': (context) => Cartscreen(),
      },
    );
  }
}
