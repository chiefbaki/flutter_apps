import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/activation_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/leading_btn.dart';
import 'package:flutter_application_6/presentation/widgets/button/welcome_btn.dart';
import 'package:flutter_application_6/presentation/widgets/text_field/get_num.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingBtn(icon: Icon(Icons.close, color: AppColors.fontColor.withOpacity(0.54), size: 24.w,), onpressed: (){}),
        title: Text(
          "Вход",
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Войти", style: AppFonts.s34w700,),
              SizedBox(
                height: 50.h,
              ),
              GetNum(),
              // SizedBox(
              //   height: 108.h,
              // ),
              Spacer(),
              WelcomeBtn(btnText: "Далее", onpressed: navigator)
            ],
          ),
        ),
      ),
    );
  }

  void navigator(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ActivePage()));
  }
}
