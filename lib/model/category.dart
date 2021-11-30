import 'dart:convert';

class Category {
  final String id;
  final String categoryname;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.categoryname,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryname': categoryname,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      categoryname: map['categoryname'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
