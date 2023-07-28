import 'package:flutter/material.dart';
import 'package:perpustakaan/app/core/values/colors.dart';

class BaseTextArea extends StatelessWidget {
  const BaseTextArea({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.maxLines,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: greenColor),
      cursorColor: greenColor,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: greenColor),
        hintStyle: const TextStyle(color: greenColor),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
