import 'dart:io';

import 'package:bekart/model/shopaddmodal.dart';
import 'package:bekart/sshop/addproduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  TextEditingController shopcontroler = TextEditingController();

  TextEditingController productcontroler = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController detailscontroller = TextEditingController();
  TextEditingController quantycontroller = TextEditingController();
  TextEditingController ratingcontroller = TextEditingController();

  String _category = "";
  String imageURL = '';
  bool isUploading = false;
  final formkey = GlobalKey<FormState>();
  final CollectionReference productcollection =
      FirebaseFirestore.instance.collection('products');
  String generateUniqueProductid() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> addproducttofirebase() async {
    String uniqueid = generateUniqueProductid();
    id:
    uniqueid;
    Shopaddmodal shopaddmodal1 = Shopaddmodal(
        productname: productcontroler.text,
        price: priceController.text,
        details: detailscontroller.text,
        quantity: quantycontroller.text,
        shopname: shopcontroler.text,
        productimage: imageURL,
        category: _category,
        rating: ratingcontroller.text);

    try {
      await productcollection.doc(uniqueid).set(shopaddmodal1.toJson());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('product added successfully')));
      productcontroler.clear();
      priceController.clear();
      quantycontroller.clear();
      detailscontroller.clear();
      shopcontroler.clear();
      ratingcontroller.clear();
      setState(() {
        imageURL = '';
        _category = '';
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('product added failed:$e')));
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add shop  products'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              DropdownButtonFormField(
                  value: _category.isNotEmpty ? _category : null,
                  items: [
                    'planet cafe',
                    'cakeland',
                    'bake o clock',
                    'kr backery',
                    'nila backes'
                  ]
                      .map(
                          (category) => DropdownMenuItem(child: Text(category)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _category = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plz select a category";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'category')),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "shop nameis  required";
                  } else {
                    return null;
                  }
                },
                controller: shopcontroler,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: ' shop Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "product nameis  required";
                  } else {
                    return null;
                  }
                },
                controller: productcontroler,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: ' product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "price  required";
                  } else {
                    return null;
                  }
                },
                controller: priceController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " plz enter details";
                  } else {
                    return null;
                  }
                },
                controller: detailscontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " plz enter quantity";
                  } else {
                    return null;
                  }
                },
                controller: quantycontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return " plz enter rating";
                  } else {
                    return null;
                  }
                },
                controller: ratingcontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'rating',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () async {
                    User? user = FirebaseAuth.instance.currentUser;

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (file == null) return;
                    String uniquefilename =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    setState(() {
                      isUploading = true;
                    });
                    try {
                      Reference referencedirupload = FirebaseStorage.instance
                          .ref()
                          .child('productimage/$user.uid}');
                      Reference referenceimageupload =
                          referencedirupload.child('$uniquefilename.jpg');
                      await referenceimageupload.putFile(File(file.path));
                      imageURL = await referenceimageupload.getDownloadURL();
                      setState(() {
                        isUploading = false;
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('error uploading image failed:$e')));
                    }
                    ;
                  },
                  child: Text('upload product img')),
              if (isUploading) CircularProgressIndicator(),
              if (!isUploading)
                imageURL.isNotEmpty
                    ? Container(
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.fitHeight,
                        ),
                        height: 200,
                        width: 200,
                      )
                    : Icon(
                        Icons.broken_image,
                        size: 150,
                        color: Colors.purple,
                      ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 50,
                width: 150,
                child: TextButton(
                    onPressed: addproducttofirebase,
                    child: Text('subimt'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.black,
                      ),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
