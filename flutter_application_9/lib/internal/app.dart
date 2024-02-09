import 'package:flutter/material.dart';
import 'package:flutter_application_9/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 165, 101, 6),
          elevation: 0.5
        )
      ),
      debugShowCheckedModeBanner: false, 
    );
  }
}