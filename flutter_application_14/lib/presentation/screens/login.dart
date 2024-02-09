import 'package:flutter/material.dart';
import 'package:flutter_application_14/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_application_14/presentation/login_cubit/login_state.dart';
import 'package:flutter_application_14/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }


  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is LoginSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }else if(state is LoginError){
          print(state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          )),
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<LoginCubit>(context).makeLogin(
                          email: emailController.text,
                          password: passController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
