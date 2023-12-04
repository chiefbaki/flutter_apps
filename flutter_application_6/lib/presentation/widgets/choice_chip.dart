import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class Choice extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Function(bool) onSelected;
  const Choice(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: ChoiceChip(
        showCheckmark: false,
        onSelected: onSelected,
        backgroundColor: Colors.white,
        selectedColor: AppColors.btnColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Colors.black)),
        label: Text(
          name,
          style: isSelected
              ? AppFonts.s15w400.copyWith(color: Colors.white)
              : AppFonts.s15w400.copyWith(color: Colors.black),
        ),
        disabledColor: AppColors.circleAvatar,
        selected: isSelected,
      ),
    );
  }
}
