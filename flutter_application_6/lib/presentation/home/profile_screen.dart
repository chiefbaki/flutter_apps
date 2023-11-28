import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/settings_btn.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Мой профиль",
          style: AppFonts.s34w700.copyWith(color: AppColors.fontColor),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Settingbtn(onPressed: () {}),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
                  radius: 50.r,
                  backgroundColor: AppColors.circleAvatarProfile,
                  child:  imagePath != null ? null : Text(SharedPref.prefs.getString("name")![0] +
                      SharedPref.prefs.getString("surname")![0]),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16.r,
                      child: InkWell(
                          onTap: () {
                            
                            pickImg(source: ImageSource.gallery);
                          },
                          child: Icon(
                            Icons.camera_enhance_sharp,
                            color: Colors.white,
                            size: 15.h,
                          )),
                    ))
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "${SharedPref.prefs.getString('name')} ${SharedPref.prefs.getString('surname')!}",
              style: AppFonts.s22w500,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              getNumber(),
              //getNumber(),
              style: AppFonts.s18w400,
            ),
          ],
        ),
      ),
    );
  }

  String getNumber() {
    String number = SharedPref.prefs.getString("phoneNumber") ?? "";
    return "+996 ${number.substring(0, 3)} ${number.substring(3, 5)} ${number.substring(5, 7)} ${number.substring(7, 9)}";
  }

  Future<void> pickImg({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: source);
      if(image != null){
        imagePath = image.path;
        setState(() {
          
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
