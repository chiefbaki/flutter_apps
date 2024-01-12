import 'package:flutter/material.dart';
import 'package:flutter_application_13/presentation/bloc/anim_bloc.dart';
import 'package:flutter_application_13/presentation/bloc/anim_event.dart';
import 'package:flutter_application_13/presentation/bloc/anim_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AnimBloc, AnimState>(builder: (context, state) {
              if (state is AnimSuccess) {
                return AnimatedContainer(
                  height: state.widthHeight[0],
                  width: state.widthHeight[1],
                  decoration: BoxDecoration(
                      borderRadius: state.boxRadius,
                      color: state.boxColor),
                  duration: const Duration(seconds: 1),
                );
              }else if(state is AnimError){
                return Text(state.errorText, style: const TextStyle(fontSize: 40, color: Colors.black),);
              }
              return const SizedBox();
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AnimBloc>(context).add(RandomEvent());
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
