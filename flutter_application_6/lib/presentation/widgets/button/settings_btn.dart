import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settingbtn extends StatefulWidget {
  final Function() onPressed;
  const Settingbtn({super.key, required this.onPressed});

  @override
  State<Settingbtn> createState() => _SettingbtnState();
}

class _SettingbtnState extends State<Settingbtn> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.settings,
        size: 24.w,
      ),
      color: Colors.black.withOpacity(0.75),
    );
  }
}
