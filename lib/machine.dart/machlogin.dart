import 'dart:developer';

import 'package:bekart/machine.dart/machbottom.dart';
import 'package:bekart/machine.dart/machhome.dart';
import 'package:bekart/machine.dart/machregi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Machlogin extends StatefulWidget {
  const Machlogin({super.key});

  @override
  State<Machlogin> createState() => _MachloginState();
}

class _MachloginState extends State<Machlogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 70, 70),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "username is required";
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 191, 154, 94),
                hintText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: password,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return "password is atleast  6 characters or numbers";
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 191, 154, 94),
                  hintText: 'password',
                  border: OutlineInputBorder()),
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
                                    email: email.text, password: password.text)
                                .then((onvalue) {
                              log(FirebaseAuth.instance.currentUser!.uid);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Machbottom(),
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
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
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
                          builder: (context) => Machregi(),
                        ));
                      },
                      child: Text('signup'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.black,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
