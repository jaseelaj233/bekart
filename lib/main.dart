import 'package:bekart/addtocart.dart';
import 'package:bekart/admin/adminhome.dart';
import 'package:bekart/admin/adminlogin.dart';
import 'package:bekart/admin/viewapprating.dart';
import 'package:bekart/admin/viewdeliveryboys.dart';
import 'package:bekart/admin/viewshopproducts.dart';
import 'package:bekart/admin/viewshopratings.dart';
import 'package:bekart/admin/viewshopregister.dart';
import 'package:bekart/deliveryaddress.dart';
import 'package:bekart/deliveryboys/deliveryhome.dart';
import 'package:bekart/deliveryboys/pickuporder.dart';

import 'package:bekart/events.dart';
import 'package:bekart/examp.dart';
import 'package:bekart/favouirt.dart';
import 'package:bekart/home.dart';
import 'package:bekart/j.dart';
import 'package:bekart/login.dart';
import 'package:bekart/ob1.dart';
import 'package:bekart/ob2.dart';
import 'package:bekart/ob3.dart';
import 'package:bekart/ooo.dart';

import 'package:bekart/orderss.dart';
import 'package:bekart/profile.dart';
import 'package:bekart/rateus.dart';
import 'package:bekart/register.dart';
import 'package:bekart/shop.dart';
import 'package:bekart/sshop/adddeliveryboys.dart';
import 'package:bekart/sshop/addproduct.dart';
import 'package:bekart/sshop/assignwork.dart';
import 'package:bekart/sshop/shophome.dart';
import 'package:bekart/sshop/shoplogin.dart';
import 'package:bekart/userhomedetails.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Deliveryhome(),
    );
  }
}
