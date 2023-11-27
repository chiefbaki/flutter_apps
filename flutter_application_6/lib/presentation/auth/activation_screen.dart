import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/auth/create_profile_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/leading_btn.dart';
import 'package:flutter_application_6/presentation/widgets/button/welcome_btn.dart';
import 'package:flutter_application_6/presentation/widgets/text_field/get_sms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivePage extends StatefulWidget {
  int checkCode;

  ActivePage({super.key, required this.checkCode});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingBtn(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.h,
            color: AppColors.arrowColor.withOpacity(0.75),
          ),
          onpressed: () {},
        ),
        title: Text(
          "Подтверждение номера",
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 40, right: 40),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                Text(
                  "Введите код из смс",
                  style: AppFonts.s22w500.copyWith(color: AppColors.fontColor),
                ),
                SizedBox(
                  height: 150.h,
                ),
                GetSms(
                  controller: controller,
                  errorText: errorText,
                ),
                TextButton(
                    onPressed: () {
                      widget.checkCode = Random().nextInt(8999) + 1000;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(widget.checkCode.toString())));
                    },
                    child: Text(
                      "Получить код повторно",
                      style: AppFonts.s15w400.copyWith(
                          color: AppColors.arrowColor,
                          decoration: TextDecoration.underline),
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: WelcomeBtn(
                      btnText: "Далее",
                      onpressed: (){
                        if (controller.text == widget.checkCode.toString()) {
                          print("success");
                          errorText = null;
                          setState(() {});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePage()));
                        } else {
                          errorText = "Неверный код";
                          print(errorText);
                          setState(() {});
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
