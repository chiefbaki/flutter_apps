import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/resources.dart';

class AddDoc extends StatefulWidget {
  const AddDoc({super.key,});

  @override
  State<AddDoc> createState() => _AddDocState();
}

class _AddDocState extends State<AddDoc> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pickFile,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImg.bookAdd),
              SizedBox(
                width: 8.w,
              ),
              const Text(
                "Добавить документ",
                style: AppFonts.s15w500,
              )
            ],
          ),
        ));
  }
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
    } else {
      debugPrint("error");
    }
  }
  
}
