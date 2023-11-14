import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_application_4/ui/theme/app_fonts.dart';
import 'package:flutter_application_4/ui/widgets/appbar_button.dart';
import 'package:flutter_application_4/ui/widgets/button.dart';
import 'package:flutter_application_4/ui/widgets/field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarButton(),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 148.h,
                  width: 148.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xffC7CDC9), Color(0xff222419)]),
                    shape: BoxShape.circle 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                        radius: 74.r, child: Image.asset("assets/images/logo.png")),
                  ),
                ),
                SizedBox(
                  height: 65.h,
                ),
                DataField(title: "Name", keyboardType: TextInputType.name,),
                DataField(title: "Username"),
                DataField(title: "Phone number", keyboardType: TextInputType.phone, hintText: '+996 ',),
                DataField(title: "Email", keyboardType: TextInputType.emailAddress,),
                SizedBox(
                  height: 110.h,
                ),
                Button()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


