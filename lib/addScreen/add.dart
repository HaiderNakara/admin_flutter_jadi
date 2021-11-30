import 'dart:async';
import 'dart:io';

import 'package:admin/model/products.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  final Product product;
  const Add({required this.product});
  @override
  _AddState createState() => _AddState(product);
}

class _AddState extends State<Add> {
  final ImagePicker _picker = ImagePicker();
  final Product product;
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController discription = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController tag = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double val = 0;
  List images = [];
  List imageLink = [];
  _AddState(this.product);
  Future<void> getImages() async {
    List<XFile>? image = [];
    image = (await (_picker.pickMultiImage()));

    if (image != null) {
      setState(() {
        images = image!;
        print(images);
      });
    }
  }

  Future<void> getMoreImages(int count) async {
    List? image = [];
    image = await (_picker.pickMultiImage());

    setState(() {
      if (image != null) {
        images.addAll(image);
      }
    });
  }

  removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  bool uploading = false;

  @override
  void dispose() {
    title.dispose();
    price.dispose();
    discount.dispose();
    discription.dispose();
    category.dispose();
    quantity.dispose();
    tag.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    images = product.productimage;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: uploading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    images.isEmpty
                        ? TextButton(
                            onPressed: () {
                              getImages();
                            },
                            child: Text("Pick Image"),
                          )
                        : Container(
                            height: 250,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ...List.generate(
                                    images.length,
                                    (index) {
                                      return Stack(
                                        children: [
                                          images[index] is String
                                              ? Image.network(
                                                  images[index],
                                                  height: 250,
                                                  width: 250,
                                                )
                                              : Image.file(
                                                  File(images[index].path),
                                                  height: 250,
                                                  width: 250,
                                                ),
                                          Positioned(
                                            child: IconButton(
                                              icon: Icon(Icons.remove_circle),
                                              onPressed: () {
                                                removeImage(index);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  if (images.length < 4)
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        getMoreImages(4 - images.length);
                                      },
                                    )
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 3,
                      controller: title,
                      validated: "Enter a valid Address",
                      label: "Tilte",
                      hint: "Enter Tile",
                      maxLines: 1,
                      type: TextInputType.name,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 1,
                      controller: price,
                      validated: "Enter a valid Address",
                      label: "price",
                      hint: "Enter price",
                      maxLines: 1,
                      type: TextInputType.number,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 1,
                      controller: discount,
                      validated: "Enter a valid Address",
                      label: "discount",
                      hint: "discount",
                      maxLines: 1,
                      type: TextInputType.number,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 5,
                      controller: discription,
                      validated: "Enter a valid Address",
                      label: "discription",
                      hint: "Enter discription",
                      maxLines: 3,
                      type: TextInputType.multiline,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 0,
                      controller: quantity,
                      validated: "Enter a valid Address",
                      label: "quantity",
                      hint: "Enter quantity",
                      maxLines: 1,
                      type: TextInputType.number,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 1,
                      controller: category,
                      validated: "Enter a category",
                      label: "category",
                      hint: "Enter category",
                      maxLines: 1,
                      type: TextInputType.name,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    buildFormField(
                      length: 1,
                      controller: tag,
                      validated: "Enter a tag",
                      label: "tag",
                      hint: "Enter tag",
                      maxLines: 1,
                      type: TextInputType.name,
                      //initial: widget.profile.address1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        Navigator.pop(context);
                        //   if (_formKey.currentState!.validate()) {
                        //     if (images.length != 0) {
                        //       setState(() {
                        //         uploading = true;
                        //       });
                        //       try {} catch (e) {
                        //         ScaffoldMessenger.of(context).showSnackBar(
                        //           SnackBar(
                        //             content: Text("Failed try again later"),
                        //           ),
                        //         );
                        //       }
                        //     }
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: Text("Upload Images"),
                        //       ),
                        //     );
                        //   }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildFormField(
      {required String? validated,
      required String label,
      required String hint,
      required int maxLines,
      required TextInputType type,
      required TextEditingController controller,
      required int length}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) => value!.length > length ? null : validated,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLines: maxLines,
    );
  }
}
