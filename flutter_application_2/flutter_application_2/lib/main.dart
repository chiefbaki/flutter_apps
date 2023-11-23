import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color(0xffF9F9F9),
      home: Scaffold(
        body: Center(
          child: Container(
            child: ColumnButton(),
          ),
        ),
      ),
    );
  }
}

class ColumnButton extends StatelessWidget {
  const ColumnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxContainer(text: "Current Weight", icon: Icons.calculate, text2: "---kgs"),
        SizedBox(height: 20),
        BoxContainer(text: "Target Weight", icon: Icons.calculate, text2: "---kgs"),
        SizedBox(height: 20),
        BoxContainer(text: "Height", icon: Icons.rule, text2: "---cms"),
      ],
    );
  }
}

class BoxContainer extends StatelessWidget {
  
  final String text;
  final String text2;
  final IconData icon;

  const BoxContainer({super.key, required this.text, required this.icon, required this.text2});


  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 315,
      // height: 48,
      width: MediaQuery.of(context).size.width * 0.84,
      //height: MediaQuery.of(context).size.width * 0.059,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 12, color: Colors.grey, offset: Offset(0, 5)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            ),
            const Spacer(),
            Text(
              text2,
              style: TextStyle(
                  color: Color(0xff898A8D),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
