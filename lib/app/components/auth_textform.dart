import 'package:flutter/material.dart';
import 'package:perpustakaan/app/core/values/colors.dart';

class AuthTextForm extends StatelessWidget {
  const AuthTextForm({
    Key? key,
    required this.label,
    this.controller,
    this.icon,
    this.obscure = false,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? obscure;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: orangeColor),
      cursorColor: orangeColor,
      obscureText: obscure!,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: orangeColor),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: orangeColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: orangeColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: orangeColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: creamColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: creamColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(color: creamColor),
        suffixIcon: icon,
        suffixIconColor: orangeColor,
      ),
    );
  }
}
