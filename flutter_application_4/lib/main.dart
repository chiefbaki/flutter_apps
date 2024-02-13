import 'package:flutter/material.dart';
import 'package:flutter_application_4/presentation/screens/home_page.dart';
import 'package:flutter_application_4/presentation/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColor,
            appBarTheme: const AppBarTheme(
              color: AppColors.bgColor,
            )),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
