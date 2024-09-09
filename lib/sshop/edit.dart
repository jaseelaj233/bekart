import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController productcontrooler = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TextEditingController imagecontroller = TextEditingController();

  TextEditingController detailscontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit details'),
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
              controller: productcontrooler,
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
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => Addproduct(),
                    // ));
                  },
                  child: Text('edit'),
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
