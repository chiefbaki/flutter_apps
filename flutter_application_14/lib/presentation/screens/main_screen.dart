import 'package:flutter/material.dart';
import 'package:flutter_application_14/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_14/presentation/auth_cubit/auth_state.dart';
import 'package:flutter_application_14/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is AuthSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
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
                      BlocProvider.of<AuthCubit>(context).createAccount(
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
                        "Register",
                        style: TextStyle(fontSize: 30),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
