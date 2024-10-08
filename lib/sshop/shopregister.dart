import 'dart:developer';

import 'package:bekart/model/shopmodal.dart';
import 'package:bekart/sshop/shophome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Shopregister extends StatefulWidget {
  const Shopregister({super.key});

  @override
  State<Shopregister> createState() => _ShopregisterState();
}

class _ShopregisterState extends State<Shopregister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  TextEditingController shopnamecontroller = TextEditingController();
  TextEditingController licencecontrooler = TextEditingController();

  TextEditingController ownercontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Hello!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'REGISTER NOW',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "shopnameis  required";
                    } else {
                      return null;
                    }
                  },
                  controller: shopnamecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'shopName',
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
                      return "ownername is  required";
                    } else {
                      return null;
                    }
                  },
                  controller: ownercontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ownername',
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
                      return "details is  required";
                    } else {
                      return null;
                    }
                  },
                  controller: detailsController,
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
                      return "licence is  required";
                    } else {
                      return null;
                    }
                  },
                  controller: licencecontrooler,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'licence pic',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return "10 digit phonemuber requred";
                    } else {
                      return null;
                    }
                  },
                  controller: phonenumbercontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'mobilenumber',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    RegExp reg = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    if (value == null || value.isEmpty) {
                      return "email required";
                    } else if (!reg.hasMatch(value)) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "password is atleast  6 characters or numbers";
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              try {
                                Shopmodal shop1 = Shopmodal(
                                    name: shopnamecontroller.text,
                                    ownwnername: ownercontroller.text,
                                    details: detailsController.text,
                                    licencepic: licencecontrooler.text,
                                    phone:
                                        int.parse(phonenumbercontroller.text),
                                    email: emailController.text,
                                    Password: passwordController.text);
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  String id = value.user!.uid;
                                  FirebaseFirestore.instance
                                      .collection("shops")
                                      .doc(id)
                                      .set(shop1.toJson())
                                      .then((onValue) => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => Shophome(),
                                          )));
                                });
                              } on FirebaseAuthException catch (e) {
                                log("Error is on $e");
                              }
                            }
                            //
                          },
                          child: Text('Register'),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
