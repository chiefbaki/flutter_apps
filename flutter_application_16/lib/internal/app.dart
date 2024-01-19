import 'package:flutter/material.dart';
import 'package:flutter_application_16/data/network/network_settings.dart';
import 'package:flutter_application_16/presentation/bloc/quiz_bloc.dart';
import 'package:flutter_application_16/presentation/screens/home_screen.dart';
import 'package:flutter_application_16/repository/quiz_repository/get_quiz_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context){
          return DioSettings();
        }),

        RepositoryProvider(create: (context){
          return GetQuizRepository();
        })
      ],
      child: BlocProvider(
        create: (context) {
          return QuizBloc(repository: RepositoryProvider.of<GetQuizRepository>(context));
        },
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
  }
}