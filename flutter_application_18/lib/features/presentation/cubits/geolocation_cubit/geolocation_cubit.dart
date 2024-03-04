import 'package:flutter/material.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/geolocation_rep.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/location_address_model.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit({required this.repository}) : super(GeolocationInitial());

  Future<void> getLocation({required LatLng latLng}) async {
    emit(GeolocationLoading());
    try {
      final LocationModel model =
          await repository.getGeoLocationByLatLng(latLng);
      emit(GeolocationSuccess(model: model));
    } catch (e) {
      emit(GeolocationError(error: e.toString()));
    }
  }

  Future<void> getAddress({required String address}) async {
    emit(GeolocationLoading());
    try {
      final AddressModel addressModel =
          await repository.getAddress(address: address);
      emit(GeolocationSuccess(address: addressModel));
    } catch (e) {
      emit(GeolocationError(error: e.toString()));
    }
  }

  final GeoLocationRep repository;
}
