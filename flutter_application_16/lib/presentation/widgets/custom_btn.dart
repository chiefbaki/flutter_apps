import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Function() onPressed;
  const CustomBtn({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE12828),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: Text(
            "Send",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ));
  }
}
