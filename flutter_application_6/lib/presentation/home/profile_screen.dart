import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/home/tabbar_screens.dart/analyse.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/button/add_doc.dart';
import 'package:flutter_application_6/presentation/widgets/button/settings_btn.dart';
import 'package:flutter_application_6/presentation/widgets/shared_prefs.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
                  backgroundImage:
                      imagePath != null ? FileImage(File(imagePath!)) : null,
                  radius: 50.r,
                  backgroundColor: AppColors.circleAvatarProfile,
                  child: imagePath != null
                      ? null
                      : Text(SharedPref.prefs.getString("name")![0] +
                          SharedPref.prefs.getString("surname")![0]),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16.r,
                      child: InkWell(
                          onTap: () {
                            openDialog();
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
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: DefaultTabController(
                  initialIndex: 1,
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: AppColors.tabbarLabelColor,
                        tabs: [
                          Tab(
                            text: "Анализы",
                            icon: SvgPicture.asset(AppImg.eyedropper),
                          ),
                          Tab(
                            text: "Диагнозы",
                            icon: SvgPicture.asset(AppImg.collection),
                          ),
                          Tab(
                            text: "Рекомендации",
                            icon: SvgPicture.asset(AppImg.details),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(children: [
                          AnalyseScreen(btn: AddDoc(), imgDoc: AppImg.doc1, text: "У вас пока нет добавленных результатов\nанализов",),
                          AnalyseScreen(btn: AddDoc(),  imgDoc: AppImg.doc2, text: "У вас пока нет добавленных диагнозов",),
                          AnalyseScreen(imgDoc: AppImg.doc3, text: "У вас пока нет добавленных диагнозов",),
                        ]),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  String getNumber() {
    String number = SharedPref.prefs.getString("phoneNumber") ?? "";
    return "+996 ${number.substring(0, 3)} ${number.substring(3, 5)} ${number.substring(5, 7)} ${number.substring(7, 9)}";
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog.adaptive(
              content: SizedBox(
                height: 100,
                width: 20,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          pickImg(source: ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Camera",
                          style: AppFonts.s15w400
                              .copyWith(color: AppColors.fontColor),
                        )),
                    TextButton(
                        onPressed: () {
                          pickImg(source: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Gallery",
                          style: AppFonts.s15w400
                              .copyWith(color: AppColors.fontColor),
                        )),
                  ],
                ),
              ),
            ));
  }


  Future<void> pickImg({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        imagePath = image.path;
        openDialog();
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
