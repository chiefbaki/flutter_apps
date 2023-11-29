import 'package:flutter/material.dart';

class TextData extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const TextData({super.key, required this.controller, required this.hintText});

  @override
  State<TextData> createState() => _TextDataState();
}

class _TextDataState extends State<TextData> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)))),
    );
  }
}
