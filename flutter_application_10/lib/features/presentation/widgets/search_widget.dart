import 'package:flutter/material.dart';
import 'package:flutter_application_10/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_10/features/presentation/theme/app_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key,});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: SizedBox(
        width: 400,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldColor,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.fieldTextColor,
              ),
              hintText: "Search Malls or Branch",
              hintStyle: AppFonts.s13w400.copyWith(
                color: AppColors.fieldTextColor,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.fieldColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.fieldColor),
                  borderRadius: BorderRadius.circular(25))),
        ),
      ),
    );
  }
}
