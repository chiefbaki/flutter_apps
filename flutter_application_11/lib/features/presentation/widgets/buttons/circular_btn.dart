import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';


class CircularButton extends StatefulWidget {
  final Icon icon;
  final Function onTapped;
  const CircularButton({super.key, required this.icon, required this.onTapped});

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTapped;
        setState(() {
          
        });
        print('Button tapped');
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.addRemoveBtnColor, // Цвет круглой кнопки
        ),
        child: Center(child: widget.icon),
      ),
    );
  }
}