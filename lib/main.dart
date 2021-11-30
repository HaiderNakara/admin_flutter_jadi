import 'package:admin/products/products.dart';
import 'package:admin/routs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: ProductScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
