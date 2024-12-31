import 'package:bekart/buynow.dart';
import 'package:bekart/payment.dart';
import 'package:bekart/productdetals.dart';
import 'package:flutter/material.dart';

class Deliveryaddress extends StatefulWidget {
  const Deliveryaddress({super.key});

  @override
  State<Deliveryaddress> createState() => _DeliveryaddressState();
}

class _DeliveryaddressState extends State<Deliveryaddress> {
  TextEditingController landmarkController = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text('delivery address'),
      ),
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.0),
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
                    return "address  required";
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
                  if (value == null || value.isEmpty) {
                    return "number is  required";
                  } else {
                    return null;
                  }
                },
                controller: phonecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  hintText: 'phonenumber',
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
                    return "landmark is  required";
                  } else {
                    return null;
                  }
                },
                controller: landmarkController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'landmark',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Payment(),
                            ));
                          }
                        },
                        child: Text('submit'),
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
      ),
    );
  }
}
