import 'package:flutter/material.dart';
import 'package:pingo_news/src/theme/colors.dart';

import '../label/label.dart';

class BrandTextField extends StatelessWidget {
  final String? hintText, errorString;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const BrandTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.errorString,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return errorString ?? Strings.requiredField;
            }
            return null;
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColor.white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColor.transparent, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColor.transparent, width: 0.0),
        ),
        hintText: hintText,
      ),
    );
  }
}
