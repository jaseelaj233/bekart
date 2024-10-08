import 'dart:developer';

import 'package:bekart/sshop/shophome.dart';
import 'package:bekart/sshop/shopregister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Shopl extends StatefulWidget {
  const Shopl({super.key});

  @override
  State<Shopl> createState() => _ShoplState();
}

class _ShoplState extends State<Shopl> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(children: [
          const Positioned.fill(
              child: Image(
            image: AssetImage('assets/istockphoto-1208006477-612x612.jpg'),
            fit: BoxFit.cover,
          )),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: ListView(
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email is required";
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 191, 154, 94),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is requred';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 191, 154, 94),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  try {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: email.text,
                                            password: password.text)
                                        .then((onvalue) {
                                      log(FirebaseAuth
                                          .instance.currentUser!.uid);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Shophome(),
                                      ));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    log('error is on $e');
                                  }
                                }
                              },
                              child: Text('Login'),
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
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 150,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Shopregister(),
                                ));
                              },
                              child: Text('signup'),
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
          )
        ]),
      ),
    );
  }
}
