import 'package:flutter/material.dart';
import 'package:flutter_application_3/reg_page.dart';

class ButtonReg extends StatefulWidget {
  const ButtonReg({super.key});

  @override
  State<ButtonReg> createState() => _ButtonRegState();
}

class _ButtonRegState extends State<ButtonReg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) => const RegPage());
            Navigator.push(context, route);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              fixedSize: Size(343, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
              side: const BorderSide(
                width: 2,
                color: Colors.white,
              )),
          child: Text(
            "Регистрация",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            textAlign: TextAlign.center,
          )),
    );
  }
}
