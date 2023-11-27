import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class GetSms extends StatelessWidget {
  final String? errorText;
  final TextEditingController controller;
  const GetSms({super.key, required this.errorText, required this.controller});

  void clear() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: controller,
            style: AppFonts.s18w600.copyWith(color: AppColors.fontColor),
            obscureText: true,
            maxLength: 4,
            obscuringCharacter: "*",
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                counterText: '',
                prefix: const Text("Код"),
                prefixStyle: AppFonts.s18w600,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.circleAvatar,
                    child: IconButton(
                        onPressed: clear,
                        icon: const Icon(
                          Icons.close,
                          size: 25,
                          color: Color(0xff333333),
                        )),
                  ),
                ),
                errorText: errorText,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textField)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.fontColor))),
          ),
        ],
      ),
    );
  }
}
