import 'package:flutter/material.dart';

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
      icon: widget.icon
    );
  }
}
