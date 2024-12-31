// import 'package:bekart/deliveryaddress.dart';
// import 'package:bekart/payment.dart';
// import 'package:flutter/material.dart';

// class Buynow extends StatefulWidget {
//   const Buynow({super.key});

//   @override
//   State<Buynow> createState() => _BuynowState();
// }

// class _BuynowState extends State<Buynow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 191, 154, 94),
//         ),
//         backgroundColor: Color.fromARGB(255, 191, 154, 94),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             Container(
//               height: 50,
//               width: 200,
//               child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //   builder: (context) => DeliveryAddressPage(),
//                     // ));
//                   },
//                   child: Text('add or change address'),
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStatePropertyAll(
//                       Colors.black,
//                     ),
//                     foregroundColor: WidgetStatePropertyAll(Colors.white),
//                   )),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               height: 200,
//               width: 500,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20), color: Colors.white),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'cookies',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(),
//                         Container(
//                           height: 100,
//                           width: 100,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: DecorationImage(
//                                   image: AssetImage('assets/cookie.jpeg'),
//                                   fit: BoxFit.cover)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     '200',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   Text('cooie with choclate'),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 30,
//                   width: 50,
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text('+'),
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStatePropertyAll(
//                           Colors.black,
//                         ),
//                         foregroundColor: WidgetStatePropertyAll(Colors.white),
//                       )),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   height: 30,
//                   width: 50,
//                   child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text('-'),
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStatePropertyAll(
//                           Colors.black,
//                         ),
//                         foregroundColor: WidgetStatePropertyAll(Colors.white),
//                       )),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Container(
//               height: 30,
//               width: 150,
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Payment(),
//                     ));
//                   },
//                   child: Text('continue'),
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStatePropertyAll(
//                       Colors.black,
//                     ),
//                     foregroundColor: WidgetStatePropertyAll(Colors.white),
//                   )),
//             ),
//           ]),
//         ));
//   }
// }
