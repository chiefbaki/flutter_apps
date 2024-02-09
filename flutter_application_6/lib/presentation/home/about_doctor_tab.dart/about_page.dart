import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatelessWidget {
  final String about;
  const About({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: SingleChildScrollView(child: SizedBox(width: 370, height: 455.h, child: Text(about, style: AppFonts.s18w400.copyWith(height: 1.3),))),
      ),
    );
  }
}