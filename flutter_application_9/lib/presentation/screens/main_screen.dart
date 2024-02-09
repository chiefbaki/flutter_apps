import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter_application_9/route/app_route.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              AutoRouter.of(context).push(const BottomNavBarRoute());
            }, child: const Text("Main", style: TextStyle(fontSize: 30),))
          ],
        ),
      ),
    );
  }
}