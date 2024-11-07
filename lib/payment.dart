import 'package:bekart/buynow.dart';
import 'package:bekart/home.dart';
import 'package:bekart/ooo.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedRole = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //     Text(
      //       'cash on delivery',
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //     Image(
      //         height: 100,
      //         width: 100,
      //         image: AssetImage(
      //             'assets/WhatsApp Image 2024-07-01 at 9.26.12 PM.jpeg')),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Image(
      //         height: 100,
      //         width: 100,
      //         image: AssetImage('assets/download (1).png')),
      //     Image(
      //         height: 100,
      //         width: 100,
      //         image: AssetImage('assets/download (2).png')),
      //     Spacer(),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: 50,
      //           width: 150,
      //           child: ElevatedButton(
      //               onPressed: () {
      //                 Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => Obj(),
      //                 ));
      //               },
      //               child: Text('proceed to pay'),
      //               style: ButtonStyle(
      //                 backgroundColor: WidgetStatePropertyAll(
      //                   Colors.black,
      //                 ),
      //                 foregroundColor: WidgetStatePropertyAll(Colors.white),
      //               )),
      //         ),
      //       ],
      //     ),
      //   ]),
      // ));
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'PAYMENTS',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 50),

              // Groom selection
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'G PAY';
                  });
                },
                child: Column(
                  children: [
                    const Text(
                      'G PAY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/WhatsApp Image 2024-07-01 at 9.26.12 PM.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: selectedRole == 'G PAY'
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bride selection
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'PAYTM';
                  });
                },
                child: Column(
                  children: [
                    const Text(
                      'PAYTM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/download (1).png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: selectedRole == 'PAYTM'
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Continue button
              Container(
                height: 50,
                width: 160,
                child: TextButton(
                  onPressed: selectedRole.isNotEmpty
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        }
                      : null, // Disable button if no role is selected
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        selectedRole.isNotEmpty ? Colors.pink : Colors.grey),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
