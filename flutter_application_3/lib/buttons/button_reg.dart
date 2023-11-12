import 'package:flutter/material.dart';
import 'package:flutter_application_3/reg_page.dart';

class ButtonReg extends StatefulWidget {
  final String text;
  final Color color;
  const ButtonReg(
      {super.key, required this.text, this.color = Colors.transparent});

  @override
  State<ButtonReg> createState() => _ButtonRegState();
}

class _ButtonRegState extends State<ButtonReg> {
  _ButtonRegState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            final route =
                MaterialPageRoute(builder: (context) => const RegPage());
            Navigator.push(context, route);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              fixedSize: Size(390, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
              side: const BorderSide(
                width: 2,
                color: Colors.white,
              )),
          child: Text(
            widget.text,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: widget.color == Colors.white
                    ? Color(0xff8C4AE2)
                    : Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}
