import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static String routeName = "/UserScreen";

  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(
              "User ",
            ),
          );
        },
        itemCount: 25,
      ),
    );
  }
}
