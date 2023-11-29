import 'package:flutter/material.dart';

class SignUpBtn extends StatefulWidget {
  final Function() onPressed;
  const SignUpBtn({super.key, required this.onPressed});

  @override
  State<SignUpBtn> createState() => _SignUpBtnState();
}

class _SignUpBtnState extends State<SignUpBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Are you a new user?",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        TextButton(
            onPressed: widget.onPressed,
            child: Text("Sign up",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff02FFF0))))
      ],
    );
  }
}
