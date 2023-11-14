import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  const DataField(
      {super.key, required this.title, this.keyboardType = TextInputType.text, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70.h,
          child: TextField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.underBorderColor))),
          ),
        ),
        Positioned(
            top: 5,
            left: 15,
            child: Container(
              child: Text(
                title,
                style: TextStyle(color: Colors.grey),
              ),
            ))
      ],
    );
  }
}
