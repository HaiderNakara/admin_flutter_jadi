import 'dart:convert';
import 'dart:io';

import 'package:admin/model/category.dart';

class Product {
  final String id;
  final List<String> productimage;
  final String productname;
  final String specialprice;
  final String discountAvailable;
  final String productinfo;
  final String notes;
  final Category category_id;
  final String createdAt;
  final String updatedAt;
  Product({
    required this.id,
    required this.productimage,
    required this.productname,
    required this.specialprice,
    required this.discountAvailable,
    required this.productinfo,
    required this.notes,
    required this.category_id,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'productimage': productimage,
      'productname': productname,
      'specialprice': specialprice,
      'discountAvailable': discountAvailable,
      'productinfo': productinfo,
      'notes': notes,
      'category_id': category_id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      productimage: map['productimage'],
      productname: map['productname'],
      specialprice: map['specialprice'],
      discountAvailable: map['discountAvailable'],
      productinfo: map['productinfo'],
      notes: map['notes'],
      category_id: map['category_id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
