import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatelessWidget {
  SharedPref({super.key, required this.child}) {
    initPrefs();
  }

  final Widget child;
  static late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}