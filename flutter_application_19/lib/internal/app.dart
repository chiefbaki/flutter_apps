import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/consts/app_colors.dart';
import 'package:flutter_application_19/presentation/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor
      ),
      home: const MainScreen(),
    );
  }
}