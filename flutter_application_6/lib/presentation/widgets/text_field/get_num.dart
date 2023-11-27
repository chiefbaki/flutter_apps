import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';

class GetNum extends StatefulWidget {
  final TextEditingController controller;
  const GetNum({super.key, required this.controller});

  @override
  State<GetNum> createState() => _GetNumState();
}

class _GetNumState extends State<GetNum> {


  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Номер телефона", style: AppFonts.s15w400,),
              TextField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                maxLength: 9,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: "0 ___ __ __ __",
                  hintStyle: AppFonts.s17w700,
                  helperText: "На указанный вами номер придет\nоднократное СМС-сообщение с кодом\nподтверждения.",
                  helperStyle: AppFonts.s15w400,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textField)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.fontColor)
                  )
                ),
              ),
          ],
        ),
      ),
    );
  }
}