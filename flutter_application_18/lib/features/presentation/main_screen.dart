import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/features/presentation/cubits/geolocation_cubit/geolocation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Set<Marker> _markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
            mapType: MapType.terrain,
            onMapCreated: (controller) => _controller.complete(controller),
            markers: _markers,
            onTap: (argument) {
              BlocProvider.of<GeolocationCubit>(context)
                  .getLocation(latLng: argument);
              _markers.add(Marker(
                  markerId: MarkerId(Random().nextInt(1000).toString()),
                  position: argument));
              setState(() {});
            },
            initialCameraPosition: const CameraPosition(
                target: LatLng(42.8746, 74.5698), zoom: 17)),
        // Positioned(
        //   child: Center(
        //     child: BlocBuilder<GeolocationCubit, GeolocationState>(
        //         builder: (context, state) {
        //       if (state is GeolocationLoading) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else if (state is GeolocationSuccess) {
        //         return Container(
        //           width: 364,
        //           height: 100,
        //           decoration: BoxDecoration(
        //               color: AppColors.contColor,
        //               borderRadius: BorderRadius.circular(8)),
        //           child: Text(
        //               state.model.results?.first.formattedAddress.toString() ??
        //                   ""),
        //         );
        //       } else if (state is GeolocationError) {
        //         debugPrint(state.error.toUpperCase());
        //       }
        //       return const SizedBox();
        //     }),
        //   ),
        // )
      ],
    ));
  }
}
