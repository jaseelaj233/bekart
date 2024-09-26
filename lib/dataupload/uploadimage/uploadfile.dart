import 'package:flutter/material.dart';

class Uploadfile extends StatefulWidget {
  const Uploadfile({super.key});

  @override
  State<Uploadfile> createState() => _UploadfileState();
}

class _UploadfileState extends State<Uploadfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploadfile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField(items:[], onChanged: onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
