import 'dart:math';

import 'package:flutter_maps/models/place_location_model.dart';
import 'package:flutter_maps/models/place_suggestion_model.dart';
import 'package:flutter_maps/services/place_webservices.dart';

class MapsRepository {
  final PlaceWebservices placeWebservices;

  MapsRepository({required this.placeWebservices});

  Future<List<Features>> fetchSuggestions(String q) async {
  final data = await placeWebservices.fetchSuggestions(q);
  // ننشئ نموذج لمجموعة الاقتراحات
  final placeSuggestions = PlaceSuggestionModel.fromJson(data);
  // نعيد القائمة الموجودة في مفتاح features (مفترض أن تكون غير null)
  return placeSuggestions.features ?? [];
}

Future<PlaceLocationModel> getPlaceLocation(String lat,String lon) async {
  final placeLocation = await placeWebservices.getPlaceLocation(lat,lon);
  return PlaceLocationModel.fromJson(placeLocation);
}
}
