import 'package:flutter/material.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_svg/svg.dart';

class Settingbtn extends StatefulWidget {
  final Function() onPressed;
  const Settingbtn({super.key, required this.onPressed});

  @override
  State<Settingbtn> createState() => _SettingbtnState();
}

class _SettingbtnState extends State<Settingbtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: SvgPicture.asset(AppSvg.settings),
    );
  }
}
