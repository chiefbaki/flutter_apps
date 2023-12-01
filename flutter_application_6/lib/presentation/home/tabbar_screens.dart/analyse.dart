import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalyseScreen extends StatefulWidget {
  final Widget? btn;
  final String text;
  final String imgDoc;
  const AnalyseScreen({super.key, this.btn, required this.imgDoc, required this.text});

  @override
  State<AnalyseScreen> createState() => _AnalyseScreenState();
}

class _AnalyseScreenState extends State<AnalyseScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Image.asset(widget.imgDoc, height: 105, width: 105,),
          SizedBox(
            height: 22.h,
          ),
          Text(widget.text, textAlign: TextAlign.center, style: AppFonts.s15w500.copyWith(color: AppColors.docLabelColor),),
          SizedBox(
            height: 31.h,
          ),
          widget.btn ?? const Icon(Icons.abc, color: Colors.white,)
        ],
      ),
    );
  }
}