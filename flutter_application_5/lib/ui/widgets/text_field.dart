import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/theme/app_colors.dart';
import 'package:flutter_application_5/ui/theme/app_fonts.dart';

class TextFieldReg extends StatefulWidget {
  final String helpText;
  final String underText;
  bool passwordVisible;
  TextFieldReg(
      {super.key,
      required this.helpText,
      this.passwordVisible = true,
      this.underText = ''});

  @override
  State<TextFieldReg> createState() => _TextFieldRegState();
}

class _TextFieldRegState extends State<TextFieldReg> {
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.helpText.toUpperCase(),
          style: AppFonts.s16w400.copyWith(color: AppColors.buttonLogInColor),
          textAlign: TextAlign.start,
        ),
        TextField(
            controller: password,
            style: AppFonts.s16w400.copyWith(color: AppColors.obscureTextColor),
            obscureText: widget.passwordVisible
                ? widget.passwordVisible = true
                : widget.passwordVisible = false,
            obscuringCharacter: "●",
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                helperText: widget.underText,
                helperStyle: AppFonts.s11w400.copyWith(color: Colors.black),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.passwordVisible = !widget.passwordVisible;
                      });
                    },
                    icon: Icon(widget.passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textFieldColor)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textFieldColor)))),
      ],
    ));
  }
}

class TextFieldLogin extends StatefulWidget {
  final String helpText;
  final String underText;
  TextFieldLogin({super.key, required this.helpText, this.underText = ''});

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  final TextEditingController login = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.helpText.toUpperCase(),
          style: AppFonts.s16w400.copyWith(color: AppColors.buttonLogInColor),
          textAlign: TextAlign.start,
        ),
        TextField(
            controller: login,
            style: AppFonts.s16w400.copyWith(color: AppColors.obscureTextColor, fontFamily: "Roboto"),
            decoration: InputDecoration(
                helperText: widget.underText,
                helperStyle: AppFonts.s11w400.copyWith(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textFieldColor)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textFieldColor)))),
      ],
    ));
  }
}
