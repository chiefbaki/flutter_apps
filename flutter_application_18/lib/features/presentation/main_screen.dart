import 'dart:async';
import 'dart:math';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/core/utils/theme/app_colors.dart';
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

  final TextEditingController controller = TextEditingController();
  int _tabSelectedIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    final OnSelected selected = ((index, instance) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Select $index, toggle ${instance.labels[index]}')));
    });

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
            },
            initialCameraPosition: const CameraPosition(
                target: LatLng(42.8746, 74.5698), zoom: 17)),
        BlocListener<GeolocationCubit, GeolocationState>(
          listener: (context, state) {
            if (state is GeolocationLoading) {
              debugPrint("LOADING");
            } else if (state is GeolocationSuccess) {
              debugPrint("SUCCESS");
              controller.text =
                  state.model?.results?.first.formattedAddress ?? "";
              setState(() {});
            } else if (state is GeolocationError) {
              debugPrint(state.error.toUpperCase());
            }
          },
          child: Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
                child: Column(
              children: [
                Container(
                    width: 364,
                    height: MediaQuery.of(context).size.height * 0.170,
                    decoration: BoxDecoration(
                        color: AppColors.contColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: controller,
                            style: const TextStyle(color: AppColors.white),
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColors.grey,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.yellow))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FkToggle(
                              width: 120,
                              height: 50,
                              labels: const ['Transport', 'Delivery'],
                              selectedColor: AppColors.yellow,
                              backgroundColor: AppColors.grey,
                              onSelected: selected),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(233, 54),
                        backgroundColor: AppColors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text(
                      "Create order",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ))
              ],
            )),
          ),
        )
      ],
    ));
  }
}
