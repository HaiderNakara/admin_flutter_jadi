import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  static String routeName = "/BlogScreen";

  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/ecommerce-edbcb.appspot.com/o/tryImage%2Fcat.gif?alt=media&token=7b447e46-de4c-4d60-94c3-42a210275059",
            ),
            onTap: () {},
            title: const Text(
              "Title",
            ),
          );
        },
        itemCount: 25,
      ),
    );
  }
}
