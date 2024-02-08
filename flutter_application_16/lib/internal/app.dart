import 'package:flutter/material.dart';
import 'package:flutter_application_16/%C2%A0core/network/dio_settings.dart';
import 'package:flutter_application_16/domain/repository/email_repository.dart';
import 'package:flutter_application_16/presentation/bloc/email_bloc.dart';
import 'package:flutter_application_16/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => EmailRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => EmailBloc(
            repository: RepositoryProvider.of<EmailRepository>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
