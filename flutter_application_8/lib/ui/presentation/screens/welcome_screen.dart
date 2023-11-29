import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/ui/presentation/screens/activation_screen.dart';
import 'package:flutter_application_8/ui/presentation/theme/app_colors.dart';
import 'package:flutter_application_8/ui/presentation/widgets/circles.dart';
import 'package:flutter_application_8/ui/presentation/widgets/container_form.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController controller = TextEditingController();

  void navigator() {
    if ((controller.text.toString().isNotEmpty) &&
        (controller.text.toString().length == 13) &&
        (controller.text.toString().startsWith("+996"))) {
      int code = Random().nextInt(8999) + 1000;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(code.toString())));
      setState(() {});
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivationScreen(code: code)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.bgColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(left: 0, top: 100, child: circleFirst()),
            Positioned(
              right: 0,
              top: 570,
              child: circleSecond(),
            ),
            Positioned(
                top: 191,
                bottom: 191,
                child: Stack(
                  children: [
                    ContainerForm(
                      textFieldText: "Phone",
                      onPressed: navigator,
                      controller: controller,
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
