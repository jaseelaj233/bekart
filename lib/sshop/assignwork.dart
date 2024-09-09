import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Assignwork extends StatefulWidget {
  const Assignwork({super.key});

  @override
  State<Assignwork> createState() => _AssignworkState();
}

class _AssignworkState extends State<Assignwork> {
  String dropdownvalue = 'Item1';
  var items = [
    'rahul',
    'anadh',
    'raju',
  ];

  List<Map<String, dynamic>> shopproducts = [
    {
      "name": "Cookies",
      "img": 'assets/cookie.jpeg',
      "price": "200",
    },
    {
      "name": "donet",
      "img": 'assets/donetrose.jpeg',
      "price": "200",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'Assign work',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                shopproducts[index]['name'],
                              ),
                              Spacer(),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            shopproducts[index]['img']))),
                              ),
                            ],
                          ),
                          Text(
                            shopproducts[index]['price'],
                          ),
                          // DropdownButton(
                          //   value: dropdownvalue,

                          //   // Down Arrow Icon
                          //   icon: const Icon(Icons.keyboard_arrow_down),
                          //   items: items.map((String items) {
                          //     return DropdownMenuItem(
                          //       value: items,
                          //       child: Text(items),
                          //     );
                          //   }).toList(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownvalue = newValue!;
                          //     });
                          //   },
                          // )
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
                                child: Text('assign work'),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.black,
                                  ),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: shopproducts.length),
            )
          ],
        ),
      ),
    );
  }
}
