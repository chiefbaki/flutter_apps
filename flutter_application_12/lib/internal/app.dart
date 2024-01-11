import 'package:flutter/material.dart';
import 'package:flutter_application_12/presentation/bloc/calc_bloc.dart';
import 'package:flutter_application_12/presentation/screens/home_screen.dart';
import 'package:flutter_application_12/repository/calc_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CalcRepository(),
      child: BlocProvider(
        create: (context) => CalcBloc(repository: RepositoryProvider.of<CalcRepository>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
