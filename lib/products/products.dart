import 'package:admin/User/user_screen.dart';
import 'package:admin/addScreen/Add_Screen.dart';
import 'package:admin/blogs/blogs.dart';
import 'package:admin/detail_page/detail_page.dart';
import 'package:admin/model/category.dart';
import 'package:admin/model/products.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = "/ProductScreen";

  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text("User"),
                onTap: () {
                  Navigator.pushNamed(context, UserScreen.routeName);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, BlogScreen.routeName);
                },
                title: Text("Blogs"),
              ),
              ListTile(
                title: Text("Orders"),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/ecommerce-edbcb.appspot.com/o/tryImage%2Fcat.gif?alt=media&token=7b447e46-de4c-4d60-94c3-42a210275059",
            ),
            onTap: () {
              Navigator.pushNamed(context, DetailPage.routeName);
            },
            title: const Text(
              "Title",
            ),
          );
        },
        itemCount: 25,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddScreen.routeName,
              arguments: Product(
                category_id: Category(
                    categoryname: "", createdAt: "", id: "", updatedAt: ""),
                createdAt: "",
                discountAvailable: "",
                id: "",
                notes: "",
                productimage: [],
                productinfo: "",
                productname: "",
                specialprice: "",
                updatedAt: "",
              ));
        },
      ),
    );
  }
}
