import 'package:flutter/material.dart';
import 'package:flutter_application_8/ui/presentation/theme/app_colors.dart';
import 'package:flutter_application_8/ui/presentation/widgets/circles.dart';
import 'package:flutter_application_8/ui/presentation/widgets/container_form.dart';

class ActivationScreen extends StatefulWidget {
  final int code;
  const ActivationScreen({super.key, required this.code});

  @override
  State<ActivationScreen> createState() => _ActivationScreen();
}

class _ActivationScreen extends State<ActivationScreen> {
  final TextEditingController controller = TextEditingController();

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
                      textFieldText: "Code",
                      onPressed: checkCode,
                      controller: controller,
                    )
                  ],
                ))
          ],
        )),
      ),
    );
  }

  void checkCode() {
    final RegExp numericRegex = RegExp(r'^[0-9]+$');
    if ((controller.text.toString().length == 4) &&
        (numericRegex.hasMatch(controller.text.toString())) &&
        (controller.text.toString()) == widget.code.toString()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("True ${widget.code.toString()}")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Wrong")));
    }
  }
}
