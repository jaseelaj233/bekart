import 'dart:developer';

import 'package:bekart/machine.dart/machbottom.dart';
import 'package:bekart/machine.dart/machhome.dart';
import 'package:bekart/machine.dart/machmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Machregi extends StatefulWidget {
  const Machregi({super.key});

  @override
  State<Machregi> createState() => _MachregiState();
}

class _MachregiState extends State<Machregi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'REGISTER NOW',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "nameis  required";
                    } else {
                      return null;
                    }
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Name',
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
                      return "address is  required";
                    } else {
                      return null;
                    }
                  },
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'address',
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
                  controller: phonecontroller,
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
                                Machmodel machmodel1 = Machmodel(
                                    name: namecontroller.text,
                                    address: addresscontroller.text,
                                    phone: int.parse(phonecontroller.text),
                                    email: emailController.text,
                                    Password: passwordController.text);
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  String id = value.user!.uid;
                                  FirebaseFirestore.instance
                                      .collection("machinetest")
                                      .doc(id)
                                      .set(machmodel1.toJson())
                                      .then((onValue) => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => Machbottom(),
                                          )));
                                });
                              } on FirebaseAuthException catch (e) {
                                log("Error is on $e");
                              }
                            }
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
