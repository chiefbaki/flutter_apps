import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final String initialText;
  const DataField(
      {super.key,
      required this.title,
      required this.initialText,
      this.keyboardType = TextInputType.text,
      this.hintText = '',});

  @override
  State<DataField> createState() => _DataFieldState();
}

class _DataFieldState extends State<DataField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 70.h,
          child: TextFormField(
            keyboardType: widget.keyboardType,
            initialValue: widget.initialText,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                hintText: widget.hintText,
                filled: true,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.underBorderColor))),
          ),
        ),
        Positioned(
            top: 5,
            left: 15,
            child: SizedBox(
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.grey),
              ),
            ))
      ],
    );
  }
}
