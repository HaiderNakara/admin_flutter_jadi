import 'package:admin/User/user_screen.dart';
import 'package:admin/addScreen/Add_Screen.dart';
import 'package:admin/blogs/blogs.dart';
import 'package:admin/detail_page/detail_page.dart';
import 'package:admin/products/products.dart';
import 'package:flutter/widgets.dart';

//We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  ProductScreen.routeName: (context) => ProductScreen(),
  UserScreen.routeName: (context) => UserScreen(),
  BlogScreen.routeName: (context) => BlogScreen(),
  AddScreen.routeName: (context) => AddScreen(),
  DetailPage.routeName: (context) => DetailPage(),
};
