import 'package:bekart/model/usermodel%20copy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Yourprofile extends StatefulWidget {
  const Yourprofile({super.key});

  @override
  State<Yourprofile> createState() => _YourprofileState();
}

class _YourprofileState extends State<Yourprofile> {
  TextEditingController profilenamecontroler = TextEditingController();
  TextEditingController addresscontroler = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final CollectionReference profilecollection =
      FirebaseFirestore.instance.collection('profile');

  String generateUniqueprofileid() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> addEventsfirebase() async {
    String uniqueid = generateUniqueprofileid();
    profileModel profilemodal1 = profileModel(
      name: profilenamecontroler.text,
      address: addresscontroler.text,
      phone: int.parse(phonecontroller.text),
    );
    try {
      await profilecollection.doc(uniqueid).set(profilemodal1.toJson());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('profile added successfully')));
      profilenamecontroler.clear();
      addresscontroler.clear();

      phonecontroller.clear();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('profile adding failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Events'),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formkey,
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "name is required";
                      } else {
                        return null;
                      }
                    },
                    controller: profilenamecontroler,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "address name is required";
                      } else {
                        return null;
                      }
                    },
                    controller: addresscontroler,
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
                      if (value == null || value.isEmpty) {
                        return "phone is is required";
                      } else {
                        return null;
                      }
                    },
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Container(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        onPressed: addEventsfirebase,
                        child: Text('Submit'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        )),
                  ),
                ]))));
  }
}
