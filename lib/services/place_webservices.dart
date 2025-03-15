import 'dart:convert';
import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlaceWebservices {
  Future<Map<String, dynamic>> fetchSuggestions(String q) async {
    final url =
        Uri.parse("https://photon.komoot.io/api/?q=$q&lat=34.8021&lon=38.9968");
    final response = await http.get(url).timeout(const Duration(seconds: 60));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return data; // إرجاع الاستجابة الكاملة
    } else {
      throw Exception("Failed to load suggestions: ${response.statusCode}");
    }
  }

  Future<dynamic> getPlaceLocation(String lat, String lon) async {
    final url = Uri.parse(
        "https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lon");
    final response = await http.get(url).timeout(const Duration(seconds: 60));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return data; // إرجاع الاستجابة الكاملة
    } else {
      throw Exception("Failed to load place location: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> getPlaceDirection(
      LatLng orgin, LatLng destination) async {
    final url = Uri.parse(
      "https://router.project-osrm.org/route/v1/driving/${orgin.longitude},${orgin.latitude};${destination.longitude},${destination.latitude}?overview=full&geometries=polyline&steps=true",
    );

    final response = await http.get(url).timeout(const Duration(seconds: 60));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return data; // إرجاع الاستجابة الكاملة
    } else {
      throw Exception("Failed to load suggestions: ${response.statusCode}");
    }
  }
}
