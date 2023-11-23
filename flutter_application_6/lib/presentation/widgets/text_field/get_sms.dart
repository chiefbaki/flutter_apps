import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetSms extends StatefulWidget {
  const GetSms({super.key});

  @override
  State<GetSms> createState() => _GetSmsState();
}

class _GetSmsState extends State<GetSms> {

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              TextField(
                controller: controller,
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefix: Text("Код  "),
                  prefixStyle: AppFonts.s18w600,
                  suffixIcon: CircleAvatar(
                    radius: 14.5.r,
                    backgroundColor: AppColors.arrowColor,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.close, size: 15, color: Color(0xff333333),)),
                  
                  ),
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