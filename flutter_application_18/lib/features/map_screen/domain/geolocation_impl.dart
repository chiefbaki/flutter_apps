import 'package:flutter_application_18/features/map_screen/data/geolocation_rep.dart';
import 'package:flutter_application_18/features/map_screen/data/location_model.dart';
import 'package:flutter_application_18/features/map_screen/domain/geolocation_usecase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GeoLocationImpl implements GeoLocationRep{
  final GeoLocationUseCase useCase;
  GeoLocationImpl({required this.useCase});
  @override
  Future<LocationModel> getGeoLocationByLatLng(LatLng latLng) async{
    return await useCase.getGeoLocation(latLng: latLng);
  }

}