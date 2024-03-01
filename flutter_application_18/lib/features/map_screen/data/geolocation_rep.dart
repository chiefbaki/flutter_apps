import 'package:flutter_application_18/features/map_screen/data/location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GeoLocationRep {
  Future<LocationModel> getGeoLocationByLatLng(LatLng latLng);
}
