import 'package:flutter/material.dart';
import 'package:flutter_application_18/core/config/network_settings/dio_settings.dart';
import 'package:flutter_application_18/features/map_screen/domain/geolocation/geolocation_impl.dart';
import 'package:flutter_application_18/features/map_screen/domain/geolocation/geolocation_usecase.dart';
import 'package:flutter_application_18/features/presentation/cubits/geolocation_cubit/geolocation_cubit.dart';
import 'package:flutter_application_18/features/presentation/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
         RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GeoLocationUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => GeoLocationImpl(
              useCase: RepositoryProvider.of<GeoLocationUseCase>(context)),
        ),
      ],
      child: BlocProvider(
        create: (context) => GeolocationCubit(
            repository: RepositoryProvider.of<GeoLocationImpl>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
