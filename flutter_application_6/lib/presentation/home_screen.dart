import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/create_profile_screen.dart';
import 'package:flutter_application_6/presentation/login_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/settings_btn.dart';
import 'package:flutter_application_6/presentation/widgets/button/welcome_btn.dart';
import 'package:flutter_application_6/presentation/widgets/welcome_row/welcome_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void onPressed(){}

  void navigator(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Settingbtn(onPressed: onPressed),
          ],
        title: Text(
          "Профиль",
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Зачем нужен профиль?", style: AppFonts.s22w500,),
            SizedBox(
              height: 15.h,
            ),
            const WelcomeRow(),
            SizedBox(
              height: 20.h,
            ),
            WelcomeBtn(btnText: "Войти", onpressed: navigator)
            ],
        ),
      ),
    );
  }
}
