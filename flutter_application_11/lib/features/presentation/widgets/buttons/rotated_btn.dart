import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';

class RotatedBtn extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const RotatedBtn({super.key, required this.onPressed, required this.text});

  @override
  State<RotatedBtn> createState() => _RotatedBtnState();
}

class _RotatedBtnState extends State<RotatedBtn> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: TextButton(
          onPressed: () {
            widget.onPressed();
            isSelected = !isSelected;
            setState(() {});
          },
          child: Text(
            widget.text,
            style: AppFonts.s16w700.copyWith(
              color: isSelected ? Colors.black : Colors.grey,
            ),
          )),
    );
  }
}
