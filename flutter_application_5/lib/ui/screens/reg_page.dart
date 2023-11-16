import 'package:flutter/material.dart';
import 'package:flutter_application_5/ui/theme/app_fonts.dart';
import 'package:flutter_application_5/ui/widgets/button.dart';
import 'package:flutter_application_5/ui/widgets/text_button.dart';
import 'package:flutter_application_5/ui/widgets/text_field.dart';
import 'package:flutter_application_5/ui/widgets/transparent_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegPage extends StatelessWidget {
  String _googleLogo = "assets/images/google_logo.png";
  String _facebookLogo = "assets/images/facebook_logo.png";
  RegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 210),
                child: TextButtonSign(),
              ),
              SizedBox(height: 100.h),
              TextFieldLogin(helpText: "Email or phone",),
              SizedBox(
                height: 20.h,
              ),
              TextFieldReg(helpText: "password", passwordVisible: true, underText: "Forget password?",),
              TextButtonForget(),
              SizedBox(
                height: 30.h,
              ),
              Button(),
              SizedBox(
                height: 10.h,
              ),
              Text("or".toUpperCase(), style: AppFonts.s16w300.copyWith(fontFamily: "Inter"),),
              SizedBox(
                height: 10.h,
              ),
              TransparentButton(textButton: "Continue with Google".padRight(20), icon: _googleLogo,),
              SizedBox(
                height: 15.h,
              ),
              TransparentButton(textButton: "Continue with Facebook", icon: _facebookLogo,),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonReg(text: "Don't Have an account", style: AppFonts.s15w300.copyWith(color: Colors.black, fontFamily: "Inter"),),
                  SizedBox(
                    width: 30.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextButtonSignUp(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
