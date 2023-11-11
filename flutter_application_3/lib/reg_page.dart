import 'package:flutter/material.dart';
import 'buttons/button_reg.dart';

class RegPage extends StatelessWidget {
  const RegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff8C4AE2), Color(0xff743BD1)])),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color(0xff8C4AE2),
            ),
            elevation: 0,
            leading: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(69), color: Colors.white),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
                style: IconButton.styleFrom(
                    foregroundColor: Color(0xff8C4AE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(69))),
              ),
            ),
            title: Text(
              "Регистрация",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.justify,
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                UnderText(text: "Фамилия"),
                TextData(labelText: "Иванов"),
                SizedBox(
                  height: 13,
                ),
                UnderText(text: "Имя"),
                TextData(labelText: "Иван"),
                SizedBox(
                  height: 13,
                ),
                UnderText(text: "Номер телефона"),
                TextData(labelText: "+996 500 000 000"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextData extends StatelessWidget {
  final String labelText;
  const TextData({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: labelText,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ))),
          )
        ],
      ),
    );
  }
}

class UnderText extends StatelessWidget {
  final String text;
  const UnderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        textAlign: TextAlign.left,
      ),
    );
  }
}
