import 'package:bekart/customs/customhome.dart';
import 'package:bekart/j.dart';
import 'package:bekart/shop.dart';
import 'package:flutter/material.dart';

class Finalhome extends StatefulWidget {
  const Finalhome({super.key});

  @override
  State<Finalhome> createState() => _UserhomedetailsState();
}

class _UserhomedetailsState extends State<Finalhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
        ),
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Bekart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Jprofile(),
                      ));
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Text('J'),
                    ),
                  )
                ],
              ),
              Text(
                'order your Favouirite Sweets.........',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Angadipuram',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(Icons.mic, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'search items',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 480,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(''), fit: BoxFit.cover)),
                      ),
                      Row(
                        children: [
                          Text(
                            'cakeland',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Spacer(),
                          Text(
                            '4',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.star),
                        ],
                      ),
                      Text(
                        'cookies',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
