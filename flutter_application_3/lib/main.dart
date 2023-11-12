import 'package:flutter/material.dart';
import 'buttons/button_reg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff8C4AE2), Color(0xff743BD1)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    width: 150,
                    height: 135,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Добро пожаловать!",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Приветствуем вас на площадке аренды строительной техники",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  ButtonReg(text: "Регистрация",),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      "У меня уже есть аккаунт",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Магазин автозапчастей",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39.07),
                      ),
                      side: BorderSide(
                        width: 1.56,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
