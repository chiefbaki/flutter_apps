import 'package:flutter/material.dart';
import 'package:flutter_application_7/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}