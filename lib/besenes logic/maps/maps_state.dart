part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

final class MapsInitial extends MapsState {}
final class PlaceLoaded extends MapsState {
  final List<Features> places;

  PlaceLoaded({required this.places});
}
final class PlaceLocationLoaded extends MapsState {
  final PlaceLocationModel placeLocationModel;
  PlaceLocationLoaded({required this.placeLocationModel});
}


