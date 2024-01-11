import 'package:flutter/material.dart';
import 'package:flutter_application_12/presentation/bloc/calc_bloc.dart';
import 'package:flutter_application_12/presentation/bloc/calc_event.dart';
import 'package:flutter_application_12/presentation/bloc/calc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CalcBloc, CalcState>(builder: (context, state) {
                if (state is CalcLoading) {
                  return const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  );
                } else if (state is CalcSuccess) {
                  return Text("${state.result}",
                      style:
                          const TextStyle(fontSize: 50, color: Colors.white));
                } else if (state is CalcError) {
                  return Text(state.errorText, style: const TextStyle(fontSize: 30, color: Colors.white),);
                }
                return const SizedBox();
              }),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 2))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller2,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 2))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CalcBloc>(context).add(AdditionEvent(
                            a: controller1.text, b: controller2.text));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.add)),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CalcBloc>(context).add(
                            SubstractionEvent(
                                a: controller1.text, b: controller2.text));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Icon(Icons.remove))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
