import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  

  const EmailTextField({
    super.key, required this.labelText, required this.hintText, required this.controller, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
