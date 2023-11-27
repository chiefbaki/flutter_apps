import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class InputData extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const InputData({super.key, required this.controller, required this.hintText});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText:widget.hintText,
          hintStyle: AppFonts.s17w400,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textField))),
    );
  }
}
