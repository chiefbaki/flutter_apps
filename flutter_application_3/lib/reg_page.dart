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
                TextData(labelText: "Введите фамилию"),
                SizedBox(
                  height: 13,
                ),
                UnderText(text: "Имя"),
                TextData(labelText: "Введите имя"),
                SizedBox(
                  height: 13,
                ),
                UnderText(text: "Номер телефона"),
                TextData(
                  labelText: "Введите номер",
                  textType: TextInputType.phone,
                ),
                SizedBox(
                  height: 13,
                ),
                UnderText(text: "Пароль"),
                TextData(
                  labelText: "Введите пароль",
                  obscureTextPass: true,
                  icon: Icon(Icons.visibility),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonReg(text: "Зарегистрироваться", color: Colors.white,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class TextData extends StatelessWidget {
//   final String labelText;
//   final bool obscureTextPass;
//   final TextInputType textType;
//   final Icon? icon;
//   const TextData(
//       {super.key,
//       required this.labelText,
//       this.obscureTextPass = false,
//       this.textType = TextInputType.text, 
//       this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             obscureText: obscureTextPass,
//             keyboardType: textType,
//             decoration: InputDecoration(
//                 hintText: labelText,
//                 disabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white
//                   )
//                 ),
//                 suffixIcon: icon,
//                 suffixIconColor: Colors.white,
//                 hintStyle: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Colors.white),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(
//                       width: 1,
//                     ))),
//           )
//         ],
//       ),
//     );
//   }
// }


class TextData extends StatefulWidget {
  final String labelText;
  final bool obscureTextPass;
  final TextInputType textType;
  final Icon? icon;
  const TextData({super.key, required this.labelText,
      this.obscureTextPass = false,
      this.textType = TextInputType.text, 
      this.icon});

  @override
  State<TextData> createState() => _TextDataState();
}

class _TextDataState extends State<TextData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            obscureText: widget.obscureTextPass,
            keyboardType: widget.textType,
            decoration: InputDecoration(
              focusColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.white,
                )
              ),
                hintText: widget.labelText,
                suffixIcon: widget.icon,
                suffixIconColor: Colors.white,
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
    );;
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
