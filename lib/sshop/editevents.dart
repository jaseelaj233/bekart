import 'package:bekart/sshop/addevents.dart';
import 'package:flutter/material.dart';

class Editevents extends StatefulWidget {
  const Editevents({super.key});

  @override
  State<Editevents> createState() => _EditeventsState();
}

class _EditeventsState extends State<Editevents> {
  TextEditingController eventsnamecontroler = TextEditingController();
  TextEditingController shopnameController = TextEditingController();

  TextEditingController imagecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit shop events'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "events nameis  required";
                } else {
                  return null;
                }
              },
              controller: eventsnamecontroler,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: ' events Name',
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
                  return "shop name required";
                } else {
                  return null;
                }
              },
              controller: shopnameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'shop name',
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
                  child: Text('upload events img')),
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
                      builder: (context) => Addevents(),
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
