import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void isDarkTheme(){
    isDark = !isDark;
  }

  Color changeTheme(){
    return isDark ? AppColors.darkThemeColor : AppColors.lightThemeColor;
  }

  Color changeThemeBtn(){
    return isDark ? const Color.fromRGBO(131, 131, 131, 0.20) : const Color(0xffE6E6E6);
  }


  Future<void> saveTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", isDark);
  }

}