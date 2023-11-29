import 'package:flutter/material.dart';
import 'package:flutter_application_8/ui/presentation/widgets/buttons/sign_in_btn.dart';
import 'package:flutter_application_8/ui/presentation/widgets/buttons/sign_up_btn.dart';
import 'package:flutter_application_8/ui/presentation/widgets/text_data.dart';

class ContainerForm extends StatefulWidget {
  const ContainerForm({super.key});

  @override
  State<ContainerForm> createState() => _ContainerFormState();
}

class _ContainerFormState extends State<ContainerForm> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 428,
        height: 525,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 23),
          child: Column(
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 139,
              ),
              TextData(controller: controller, hintText: "Phone"),
              const SizedBox(
                height: 102,
              ),
              SignInBtn(onPressed: (){},),
              const SizedBox(
                height: 50,
              ),
              SignUpBtn(onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
