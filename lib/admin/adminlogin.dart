// import 'dart:developer';

// import 'package:bekart/admin/adminhome.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// final String adminemail = "arun@gmail.com";
// final String adminpassword = "123456";

// class Adminlogin extends StatefulWidget {
//   const Adminlogin({super.key});

//   @override
//   State<Adminlogin> createState() => _AdminloginState();
// }

// class _AdminloginState extends State<Adminlogin> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formkey,
//         child: Stack(children: [
//           const Positioned.fill(
//               child: Image(
//             image: AssetImage(
//                 'assets/free-photo-of-a-tray-of-desserts-with-different-flavors-and-toppings.jpeg'),
//             fit: BoxFit.cover,
//           )),
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(50.0),
//                 child: ListView(
//                   children: [
//                     Text(
//                       'Hello!',
//                       style: TextStyle(
//                         fontSize: 32.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'Welcome Back Admin!',
//                       style: TextStyle(
//                         fontSize: 24.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Center(
//                       child: Text(
//                         'LOGIN',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 80,
//                     ),
//                     TextFormField(
//                       controller: email,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "email is required";
//                         }
//                       },
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color.fromARGB(255, 191, 154, 94),
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(13),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 40.0),
//                     TextFormField(
//                       controller: password,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'password is requred';
//                         }
//                       },
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color.fromARGB(255, 191, 154, 94),
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 40.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 150,
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 if (email.text == "arun@gmail.com" &&
//                                     password.text == "123456") {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => Adminhome(),
//                                   ));
//                                 } else {
//                                   SnackBar(
//                                       content:
//                                           'email and pASSWORD IS INCOORECT');
//                                 }
//                                 //
//                               },
//                               child: Text('Login'),
//                               style: ButtonStyle(
//                                 backgroundColor: WidgetStatePropertyAll(
//                                   Colors.black,
//                                 ),
//                                 foregroundColor:
//                                     WidgetStatePropertyAll(Colors.white),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:bekart/admin/adminhome.dart';
import 'package:flutter/material.dart';

final String adminemail = "arun@gmail.com";
final String adminpassword = "123456";

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  TextEditingController email = TextEditingController(text: "arun@gmail.com");
  TextEditingController password = TextEditingController(text: "123456");

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage(
                  'assets/free-photo-of-a-tray-of-desserts-with-different-flavors-and-toppings.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
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
                      'Welcome Back Admin!',
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
                          return "Email is required";
                        }
                        return null;
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
                          return 'Password is required';
                        }
                        return null;
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
                              if (formkey.currentState?.validate() ?? false) {
                                if (email.text == adminemail &&
                                    password.text == adminpassword) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Adminhome(),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Email or Password is incorrect'),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text('Login'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
