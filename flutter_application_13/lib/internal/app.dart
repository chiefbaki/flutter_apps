import 'package:flutter/material.dart';
import 'package:flutter_application_13/presentation/bloc/anim_bloc.dart';
import 'package:flutter_application_13/presentation/screens/main_screen.dart';
import 'package:flutter_application_13/repository/animation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AnimationRepository(),
      child: BlocProvider(
        create: (context) => AnimBloc(repository: RepositoryProvider.of<AnimationRepository>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
