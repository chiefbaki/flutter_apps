import 'package:flutter/material.dart';
import 'package:flutter_application_17/core/network_settings/network_settings.dart';
import 'package:flutter_application_17/domain/repository/quiz_repository.dart';
import 'package:flutter_application_17/presentation/bloc/quiz_bloc.dart';
import 'package:flutter_application_17/presentation/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DioSettings()),
        RepositoryProvider(
            create: (context) => QuizRepository(
                dio: RepositoryProvider.of<DioSettings>(context).dio))
      ],
      child: BlocProvider(
        create: (context) => QuizBloc(
            repository: RepositoryProvider.of<QuizRepository>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
