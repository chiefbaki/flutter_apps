import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  const MessageTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 14),
      maxLines: 5,
      decoration: InputDecoration(
        
          hintText: hintText,
          labelText: "$labelText*",
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
