import 'package:flutter/material.dart';

class Customviewregister extends StatelessWidget {
  const Customviewregister({
    super.key,
    required this.shopName,
    required this.ownerName,
    required this.details,
    required this.mobileNum,
    required this.email,
    required this.licenceimg,
  });
  final String shopName;
  final String ownerName;
  final String details;

  final String mobileNum;
  final String email;
  final String licenceimg;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            shopName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(ownerName),
          Text(details),
          Text(mobileNum),
          Text(email),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(licenceimg), fit: BoxFit.cover)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Buynow(),
                      // ));
                    },
                    child: Text('Accept'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.black,
                      ),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    )),
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                height: 30,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Addtocart(),
                      // ));
                    },
                    child: Text('reject'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.black,
                      ),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    )),
              ),
            ],
          )
        ]));
  }
}
