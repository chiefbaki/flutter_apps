import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBackPage extends StatelessWidget {
  final String feedbackImg;
  final String feedbackName;
  final String feedbackDate;
  final String feedbackText;
  const FeedBackPage(
      {super.key,
      required this.feedbackImg,
      required this.feedbackName,
      required this.feedbackDate,
      required this.feedbackText});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FeedbackRow(
                  feedbackName: feedbackName,
                  feedbackText: feedbackText,
                  feedbackImg: feedbackImg,
                  feedbackDate: feedbackDate,
                ),
                const SizedBox(
                  height: 24,
                ),
                FeedbackRow(
                  feedbackName: feedbackName,
                  feedbackText: feedbackText,
                  feedbackImg: feedbackImg,
                  feedbackDate: feedbackDate,
                ),
                const SizedBox(
                  height: 24,
                ),
                FeedbackRow(
                  feedbackName: feedbackName,
                  feedbackText: feedbackText,
                  feedbackImg: feedbackImg,
                  feedbackDate: feedbackDate,
                ),
              ],
            )),
      ),
    );
  }
}

class FeedbackRow extends StatelessWidget {
  final String feedbackName;
  final String feedbackText;
  final String feedbackImg;
  final String feedbackDate;
  const FeedbackRow(
      {super.key,
      required this.feedbackName,
      required this.feedbackText,
      required this.feedbackImg,
      required this.feedbackDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          child: Image.asset(feedbackImg),
        ),
        const SizedBox(
          width: 13,
        ),
        SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feedbackName,
                textAlign: TextAlign.start,
                style: AppFonts.s18w600,
              ),
              Text(
                feedbackText,
                style: AppFonts.s15w400,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(feedbackDate, style: AppFonts.s13w400.copyWith(color: AppColors.docLabelColor),)
            ],
          ),
        )
      ],
    );
  }
}
