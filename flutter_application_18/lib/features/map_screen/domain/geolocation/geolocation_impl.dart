import 'package:flutter_application_18/features/map_screen/data/geolocation/location_address_model.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/geolocation_rep.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/location_model.dart';
import 'package:flutter_application_18/features/map_screen/domain/geolocation/geolocation_usecase.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GeoLocationImpl implements GeoLocationRep{
  final GeoLocationUseCase useCase;
  GeoLocationImpl({required this.useCase});
  @override
  Future<LocationModel> getGeoLocationByLatLng(LatLng latLng) async{
    return useCase.getGeoLocation(latLng: latLng);
  }
  Future<AddressModel> getAddress({required String address}){
    return useCase.getAddress(address: address);
  }

}