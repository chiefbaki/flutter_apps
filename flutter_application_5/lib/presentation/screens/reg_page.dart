import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/theme/app_fonts.dart';
import 'package:flutter_application_5/presentation/widgets/button.dart';
import 'package:flutter_application_5/presentation/widgets/text_button.dart';
import 'package:flutter_application_5/presentation/widgets/text_field.dart';
import 'package:flutter_application_5/presentation/widgets/transparent_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final String _googleLogo = "assets/images/google_logo.png";

  final String _facebookLogo = "assets/images/facebook_logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: TextButtonSign(),
              ),
              SizedBox(height: 100.h),
              const TextFieldLogin(
                helpText: "Email or phone",
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldReg(
                helpText: "password",
                passwordVisible: true,
                underText: "Forget password?",
              ),
              const TextButtonForget(),
              SizedBox(
                height: 30.h,
              ),
              const Button(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "or".toUpperCase(),
                style: AppFonts.s16w300.copyWith(fontFamily: "Inter"),
              ),
              SizedBox(
                height: 10.h,
              ),
              TransparentButton(
                textButton: "Continue with Google".padRight(20),
                icon: _googleLogo,
              ),
              SizedBox(
                height: 15.h,
              ),
              TransparentButton(
                textButton: "Continue with Facebook",
                icon: _facebookLogo,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButtonReg(),
                  SizedBox(
                    width: 30.w,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
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
