import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_application_4/ui/theme/app_fonts.dart';

class AppBarButton extends StatelessWidget {
  final Function() onPressed;
  const AppBarButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text("Generate",
            style: AppFonts.s16w500.copyWith(color: AppColors.blue)));
  }
}
