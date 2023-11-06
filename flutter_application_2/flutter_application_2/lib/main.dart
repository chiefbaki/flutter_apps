import 'package:flutter/material.dart';

void main() => runApp(const HomeApp());

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What’s your strength\nlevel?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                      text: "Very Low",
                    ),
                    Button(
                      text: "Low",
                    ),
                    Button(
                      text: "Medium",
                      color: Color(0xff5EE0B1),
                    ),
                    Button(
                      text: "High",
                    ),
                    Button(
                      text: "Very High",
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "This means you can do 16+ push ups, 3+\npull ups, 3+ single leg squats, and a 1+\nminute plank.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xff898A8D)),
            ),
            SizedBox(
              height: 35,
            ),
            Text("...and you have",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Cards(
                    textTitle: "Beginner", period: "0-6",
                    color: Color(0xff5EE0B1),
                  ),
                  Cards(textTitle: "Intermediate", period: "6-18",),
                  Cards(
                    textTitle: "Advanced", period: "18+",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "strength training experience in the last 5 years.",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: Color(0xff898A8D)),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  const Button({super.key, required this.text, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 15, color: Color(0xffD3D3D3), offset: Offset(0, 4)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          minimumSize: MaterialStateProperty.all(
              Size(50, 20)), // Здесь можно указать нужные размеры
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final Color color;
  final String textTitle, period;
  const Cards(
      {super.key, required this.textTitle, required this.period, this.color = const Color(0xfffff)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 108,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 15, color: Color(0xffD3D3D3), offset: Offset(0, 4)),
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 3.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: "Poppins"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Text(
                period,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: "Poppins"),
              ),
            ),
            Text(
              "months",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
            )
          ],
        ),
      ),
    );
  }
}
