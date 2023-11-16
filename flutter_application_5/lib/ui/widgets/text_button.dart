import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/theme/app_colors.dart';
import 'package:flutter_application_5/ui/theme/app_fonts.dart';

class TextButtonSign extends StatefulWidget {
  const TextButtonSign({super.key});

  @override
  State<TextButtonSign> createState() => _TextButtonSignState();
}

class _TextButtonSignState extends State<TextButtonSign> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Sign in",
          style: AppFonts.s48w400
              .copyWith(color: Colors.black, fontFamily: "Imprima"),
        ));
  }
}

class TextButtonReg extends StatefulWidget {
  const TextButtonReg({
    super.key,
  });

  @override
  State<TextButtonReg> createState() => _TextButtonRegState();
}

class _TextButtonRegState extends State<TextButtonReg> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Don't Have an account?",
          style: AppFonts.s15w300
              .copyWith(color: Colors.black, fontFamily: "Inter"),
        ));
  }
}

class TextButtonForget extends StatefulWidget {
  const TextButtonForget({super.key});

  @override
  State<TextButtonForget> createState() => _TextButtonForgetState();
}

class _TextButtonForgetState extends State<TextButtonForget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Forget password?",
              style: AppFonts.s11w400.copyWith(color: Colors.black),
            )),
      ],
    );
    ;
  }
}

class TextButtonSignUp extends StatefulWidget {
  const TextButtonSignUp({super.key});

  @override
  State<TextButtonSignUp> createState() => _TextButtonSignUpState();
}

class _TextButtonSignUpState extends State<TextButtonSignUp> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "sign up".toUpperCase(),
          style: AppFonts.s13w700
              .copyWith(color: AppColors.signInColor, fontFamily: "Inter"),
        ));
  }
}
