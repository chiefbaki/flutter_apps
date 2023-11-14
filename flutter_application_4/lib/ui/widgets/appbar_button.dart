import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/theme/app_colors.dart';
import 'package:flutter_application_4/ui/theme/app_fonts.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({super.key});

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text("Generate",
            style: AppFonts.s16w500.copyWith(color: AppColors.blue)));
  }
}
