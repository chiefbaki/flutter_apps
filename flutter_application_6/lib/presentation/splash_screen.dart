import 'package:flutter/material.dart';
import 'package:flutter_application_6/core/app_consts.dart';
import 'package:flutter_application_6/presentation/auth/home_screen.dart';
import 'package:flutter_application_6/presentation/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    routing();
    super.initState();
  }

  void routing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogined = prefs.getBool(AppConsts.isLogined) ?? false;
   // await Future.delayed(const Duration(seconds: 2));
    if (isLogined){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }else{
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("TEXT"),
    );
  }
}