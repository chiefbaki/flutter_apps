import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/home/home_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/leading_btn.dart';
import 'package:flutter_application_6/presentation/widgets/button/welcome_btn.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs.dart';
import 'package:flutter_application_6/presentation/widgets/text_field/input_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSurname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingBtn(icon: const Icon(Icons.close,), onpressed: (){
          Navigator.pop(context);
        }),
        title: Text(
          "Создание профиля",
          style: AppFonts.s17w600.copyWith(color: AppColors.fontColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 31, right: 31, top: 34),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Имя", style: AppFonts.s15w400,),
              InputData(controller: controllerName, hintText: "Введите ваше имя",),
              SizedBox(
                height: 34.h,
              ),
              const Text("Фамилия", style: AppFonts.s15w400,),
              InputData(controller: controllerSurname, hintText: "Введите вашу фамилию",),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: WelcomeBtn(btnText: "Далее", onpressed: () async{
                  final SharedPreferences prefs = SharedPref.prefs;
                  await prefs.setString(AppConsts.name, controllerName.text);
                  await prefs.setString(AppConsts.surname, controllerSurname.text);
                  await prefs.setBool(AppConsts.isLogined, true);
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
