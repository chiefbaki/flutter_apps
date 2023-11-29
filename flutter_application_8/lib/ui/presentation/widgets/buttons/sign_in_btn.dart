import 'package:flutter/material.dart';

class SignInBtn extends StatefulWidget {
  final Function() onPressed;
  const SignInBtn({super.key, required this.onPressed});

  @override
  State<SignInBtn> createState() => _SignInBtnState();
}

class _SignInBtnState extends State<SignInBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: Text("Sign in"),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Colors.white.withOpacity(0.3),
          elevation: 0),
    );
  }
}
