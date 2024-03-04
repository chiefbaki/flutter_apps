import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/core/utils/consts/api_consts.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/location_address_model.dart';
import 'package:flutter_application_18/features/map_screen/data/geolocation/location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocationUseCase {
  final Dio dio;
  const GeoLocationUseCase({required this.dio});
  Future<LocationModel> getGeoLocation({required LatLng latLng}) async {
    final Response response = await dio.get(ApiConsts.geoUrl, queryParameters: {
      "latlng": "${latLng.latitude}, ${latLng.longitude}",
      "key": ApiConsts.key,
    });
    debugPrint("work");
    return LocationModel.fromJson(response.data);
  }
  Future<AddressModel> getAddress({required String address}) async {
    final Response response = await dio.get(ApiConsts.geoUrl,
        queryParameters: {"address": address, "key": ApiConsts.key});
    return AddressModel.fromJson(response.data);
  }
}
