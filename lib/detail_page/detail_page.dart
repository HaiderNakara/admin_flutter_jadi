import 'package:admin/addScreen/Add_Screen.dart';
import 'package:admin/model/category.dart';
import 'package:admin/model/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map?;
    Product product = arg?["product"] ??
        Product(
            id: "",
            productimage: [
              "https://firebasestorage.googleapis.com/v0/b/ecommerce-edbcb.appspot.com/o/tryImage%2Fcat.gif?alt=media&token=7b447e46-de4c-4d60-94c3-42a210275059",
              "https://firebasestorage.googleapis.com/v0/b/ecommerce-edbcb.appspot.com/o/tryImage%2Fcat.gif?alt=media&token=7b447e46-de4c-4d60-94c3-42a210275059",
              "https://firebasestorage.googleapis.com/v0/b/ecommerce-edbcb.appspot.com/o/tryImage%2Fcat.gif?alt=media&token=7b447e46-de4c-4d60-94c3-42a210275059",
            ],
            productname: "Cute Cat",
            specialprice: "1999",
            discountAvailable: "2000",
            productinfo:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            notes:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            category_id: Category(
                categoryname: "Medical",
                createdAt: "13",
                id: "sd",
                updatedAt: "sda"),
            createdAt: "dasd",
            updatedAt: "updatedAt");
    List<Widget> images = product.productimage.map((i) {
      return Image.network(
        i,
        height: 100,
        width: double.infinity,
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure you want to ?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // db.deleteProduct(product.id!).whenComplete(() {
                        //   var count = 0;
                        //   Navigator.popUntil(context, (route) {
                        //     return count++ == 2;
                        //   });
                        // });
                      },
                      child: const Text("Delete"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddScreen.routeName,
                arguments: product,
              );
            },
            icon: Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1,
                  initialPage: 0,
                  //enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: images,
              ),
              Row(
                children: [
                  Text(
                    product.productname,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Text(
                product.productinfo,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                product.specialprice.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                product.category_id.categoryname,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
