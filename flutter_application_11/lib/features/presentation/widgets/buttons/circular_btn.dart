import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';

class CircularButton extends StatelessWidget {
  final Icon icon;
  const CircularButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Обработка нажатия кнопки
        print('Button tapped');
      },
      child: Container(
        width: 28.0,
        height: 28.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.addRemoveBtnColor, // Цвет круглой кнопки
        ),
        child: Center(child: icon),
      ),
    );
  }
}