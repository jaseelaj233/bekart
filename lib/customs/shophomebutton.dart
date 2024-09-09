import 'package:flutter/material.dart';

class Shophomebutton extends StatelessWidget {
  const Shophomebutton({
    super.key,
    required this.buttonText,
    required this.pageName,
  });
  final String buttonText;
  final Widget pageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => pageName,
          ));
        },
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Color.fromARGB(255, 191, 154, 94))),
      ),
    );
  }
}
