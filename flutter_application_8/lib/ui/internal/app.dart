import 'package:flutter/material.dart';
import 'package:flutter_application_8/ui/presentation/screens/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 926),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
      )
    );
  }
}