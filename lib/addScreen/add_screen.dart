// ignore: file_names
import 'package:admin/model/category.dart';
import 'package:admin/model/products.dart';
import 'package:flutter/material.dart';

import 'add.dart';

class AddScreen extends StatelessWidget {
  static String routeName = "/Add_screen";
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product?;

    return Scaffold(
      appBar: AppBar(),
      body: (product?.productname != "" && product?.productname != null)
          ? Add(
              product: product!,
            )
          : Add(
              product: Product(
              category_id: Category(
                  id: "", categoryname: "", createdAt: "", updatedAt: ""),
              createdAt: "",
              discountAvailable: "",
              id: "",
              notes: "",
              productimage: [],
              productinfo: "",
              productname: "",
              specialprice: "",
              updatedAt: "",
            )),
    );
  }
}
