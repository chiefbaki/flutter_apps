import 'package:flutter/material.dart';
import 'package:flutter_application_14/firebase_services/firebase_service.dart';
import 'package:flutter_application_14/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_14/presentation/login_cubit/login_cubit.dart';
import 'package:flutter_application_14/presentation/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FireBaseServices(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
                repository: RepositoryProvider.of<FireBaseServices>(context)),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
                repository: RepositoryProvider.of<FireBaseServices>(context)),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
