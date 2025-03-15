import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_maps/models/place_location_model.dart';
import 'package:flutter_maps/models/place_suggestion_model.dart';
import 'package:flutter_maps/repository/maps_repository.dart';
import 'package:meta/meta.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepository mapsRepository;
  MapsCubit(this.mapsRepository) : super(MapsInitial());

  Future<void> fetchSuggestions(String q) async {
    emit(MapsInitial());
    final featuresList = await mapsRepository.fetchSuggestions(q);
    featuresList.forEach((feature) {
      print('Feature: ${feature.toJson()}');
    });
    emit(PlaceLoaded(places: featuresList));
  }

   Future<void> getPlaceLocation(String lat,String lon) async {
    emit(MapsInitial());
    final placelocation = await mapsRepository.getPlaceLocation(lat,lon);
  
    emit(PlaceLocationLoaded(  placeLocationModel: placelocation));
  }
}

