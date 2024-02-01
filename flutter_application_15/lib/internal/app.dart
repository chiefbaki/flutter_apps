import 'package:flutter/material.dart';
import 'package:flutter_application_15/core/settings/dio_settings.dart';
import 'package:flutter_application_15/cubit/search_cubit/search_cubit.dart';
import 'package:flutter_application_15/presentation/screens/main_screen.dart';
import 'package:flutter_application_15/repositories/search_repository/search_repository.dart';
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
          create: (context) =>
              SearchRepository(RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => SearchCubit(
            repository: RepositoryProvider.of<SearchRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
