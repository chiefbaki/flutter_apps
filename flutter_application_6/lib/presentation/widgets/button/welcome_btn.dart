import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class WelcomeBtn extends StatefulWidget {
  final String btnText;
  final Function() onpressed;
  const WelcomeBtn({super.key, required this.btnText, required this.onpressed});

  @override
  State<WelcomeBtn> createState() => _WelcomeBtnState();
}

class _WelcomeBtnState extends State<WelcomeBtn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 296,
          height: 54,
          child: ElevatedButton(
            onPressed: widget.onpressed,
            child: Text(
              widget.btnText,
              style: AppFonts.s18w600,
            ),
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.btnColor),
          )),
    );
  }
}
