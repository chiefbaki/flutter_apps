import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';

class LeadingBtn extends StatefulWidget {
  final Icon icon;
  final Function() onpressed;
  const LeadingBtn({super.key, required this.icon, required this.onpressed});

  @override
  State<LeadingBtn> createState() => _LeadingBtnState();
}

class _LeadingBtnState extends State<LeadingBtn> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: widget.icon,
      color: AppColors.fontColor.withOpacity(0.54),
    );
  }
}
