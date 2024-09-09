import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
  const Customtextform(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.validator,
      this.obste});
  final String hinttext;
  final TextEditingController controller;
  final String Function(String?) validator;
  final bool? obste;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obste!,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
