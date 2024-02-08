import 'package:flutter/material.dart';
import 'package:flutter_application_16/presentation/bloc/email_bloc.dart';
import 'package:flutter_application_16/presentation/bloc/email_event.dart';
import 'package:flutter_application_16/presentation/bloc/email_state.dart';
import 'package:flutter_application_16/presentation/widgets/custom_btn.dart';
import 'package:flutter_application_16/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_16/presentation/widgets/email_text_field.dart';
import 'package:flutter_application_16/presentation/widgets/message_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController toName = TextEditingController();
    final TextEditingController fromName = TextEditingController();
    final TextEditingController message = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 11.5),
          child: Column(
            children: [
              const Text(
                "Contact",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                  width: 290,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam duis vitae curabitur amet, fermentum lorem. ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                      hintText: "Name",
                      labelText: "First name",
                      controller: fromName),
                  CustomTextField(
                      hintText: "Last name",
                      labelText: "Last name",
                      controller: fromName),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              EmailTextField(
                  labelText: "Email",
                  hintText: "your@gmail.com",
                  controller: TextEditingController(),
                  icon: Icons.message),
                  const SizedBox(
                    height: 35,
                  ),
                MessageTextField(
                hintText: "Your message",
                labelText: "Message",
                controller: message,
                
              ),
              const SizedBox(
                height: 35,
              ),
              BlocListener<EmailBloc, EmailState>(
                listener: (context, state) {
                  print("work");
                  if (state is EmailStateSuccess) {
                    print("success");
                  }else if(state is EmailStateError){
                    print(state.error);
                  }
                },
                child: CustomBtn(onPressed: () {
                  BlocProvider.of<EmailBloc>(context).add(EmailSendMessageEvent(toName: toName.text, fromName: fromName.text, message: message.text));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
