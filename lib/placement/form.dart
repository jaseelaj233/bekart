import 'dart:developer';

import 'package:bekart/placement/formmodal.dart';
import 'package:bekart/placement/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  TextEditingController courseController = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController agecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('formpage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/donetrose.jpeg'),
                  ),
                ],
              ),
              SizedBox(height: 40),
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
                    return "age is  required";
                  } else {
                    return null;
                  }
                },
                controller: agecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'age',
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
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "course is required";
                  } else {
                    return null;
                  }
                },
                controller: courseController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'course',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          print('ffccf');
                          if (formKey.currentState!.validate()) {
                            try {
                              print('hhhhhh');
                              Formmodal formmodal1 = Formmodal(
                                name: namecontroller.text,
                                age: agecontroller.text,
                                phone: int.parse(phonecontroller.text),
                                course: courseController.text,
                              );
                              FirebaseFirestore.instance
                                  .collection("form")
                                  .add(formmodal1.toJson());

                              //       .then((value) {
                              //     String id = value.user!.uid;
                              //     FirebaseFirestore.instance
                              //         .collection("form")
                              //         .doc(id)
                              //         .set(formmodal1.toJson())
                              //         .then((onValue) => Navigator.of(context)
                              //                 .push(MaterialPageRoute(
                              //               builder: (context) =>
                              //                   Viewpage(),
                              //             )));
                              //   });
                            } on FirebaseAuthException catch (e) {
                              print('hhgvvvv');
                              log("Error is on $e");
                            }
                          }
                        },
                        child: Text('save'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 168, 64, 64),
                          ),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
