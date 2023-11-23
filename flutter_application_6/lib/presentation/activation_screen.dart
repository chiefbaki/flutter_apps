import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/leading_btn.dart';
import 'package:flutter_application_6/presentation/widgets/button/welcome_btn.dart';
import 'package:flutter_application_6/presentation/widgets/text_field/get_sms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingBtn(icon: Icon(Icons.arrow_back_ios, size: 24.h, color: AppColors.arrowColor.withOpacity(0.75),), onpressed: (){},),
        title: Text(
          "Подтверждение номера",
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 40, right: 40),
        child: Center(
          child: Column(
            children: [
              Text("Введите код из смс", style: AppFonts.s22w500.copyWith(color: AppColors.fontColor),),
              SizedBox(
                height: 150.h,
              ),
              GetSms(),
              WelcomeBtn(btnText: "Далее", onpressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
