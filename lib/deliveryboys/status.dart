import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
          title: Text(
            'delivery address',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(' orde delivered'),
                  Container(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        onPressed: () {
                          // if (formkey.currentState!.validate()) ;
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => Addevents(),
                          // ));
                        },
                        child: Text('ok'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.black,
                          ),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
