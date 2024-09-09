import 'package:bekart/sshop/addproduct.dart';
import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  TextEditingController productcontroler = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController imagecontroller = TextEditingController();

  TextEditingController detailscontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add shop  products'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
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
            Container(
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 100,
                        width: 400,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.photo))
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text('upload product img')),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 150,
              child: TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) ;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addproduct(),
                    ));
                  },
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
    );
  }
}
