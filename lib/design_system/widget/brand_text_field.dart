import 'package:flutter/material.dart';

class BrandTextField extends StatelessWidget {
  final String? hintText;
  const BrandTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          // borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        hintText: hintText,
      ),
    );
  }
}
