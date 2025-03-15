import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/besenes%20logic/maps/maps_cubit.dart';
import 'package:flutter_maps/helper/location_helper.dart';
import 'package:flutter_maps/models/place_suggestion_model.dart';
import 'package:flutter_maps/widgets/my_drawer.dart';
import 'package:flutter_maps/widgets/place_item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static Position? position;
  FloatingSearchBarController controller = FloatingSearchBarController();
  Completer<GoogleMapController> _mapController = Completer();
  List<dynamic> Places = [];

  Set<Marker> markers = Set();
  late Features selectedPlace;
  late Marker searcedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition _goToSearchedLocation;
  late PlaceSuggestionModel placeSuggestionModel;
  void buildCameraNewPosition() {
    _goToSearchedLocation = CameraPosition(
      target: LatLng(
        selectedPlace.geometry!.coordinates![1],
        selectedPlace.geometry!.coordinates![0],
      ),
      zoom: 10,
      bearing: 0.0,
      tilt: 0.0,
    );
  }

  static CameraPosition _currentLocationCameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 10,
    bearing: 0.0,
    tilt: 0.0,
  );

  @override
  void initState() {
    getMyCurrentLocation();

    super.initState();
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
    // if (position != null) {
    //   _currentLocationCameraPosition = CameraPosition(
    //     target: LatLng(position!.latitude, position!.longitude),
    //     zoom: 17,
    //   );
    //   setState(() {});
    // }
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _currentLocationCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: markers,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> goToMyLocation(CameraPosition CameraPosition) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition));
  }

  void getPlaceSuggestions(String query) {
    BlocProvider.of<MapsCubit>(context).fetchSuggestions(query);
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        getPlaceSuggestions(query);
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              BlocBuilder<MapsCubit, MapsState>(
                builder: (context, state) {
                  if (state is PlaceLoaded) {
                    Places = state.places;
                    return Places.isNotEmpty
                        ? buildListPlaces() // تأكد من استدعاء هذه الدالة هنا
                        : Center(child: Text("No Places Found"));
                  } else if (state is MapsInitial) {
                    return Center(
                        child:
                            CircularProgressIndicator()); // إظهار مؤشر التحميل
                  } else {
                    return Center(child: Text("No Places Found"));
                  }
                },
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget buildListPlaces() {
    return ListView.builder(
      itemCount: Places.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            controller.close();
            // نُعيّن العنصر المحدد إلى selectedPlace بعد التأكد من نوعه
            selectedPlace = Places[index] as Features;
            buildCameraNewPosition();
            goToMyLocation(_goToSearchedLocation);
            buildSearchedPlaceMarker();
            // final GoogleMapController mapController =
            //     await _mapController.future;
            // mapController.animateCamera(
            //   CameraUpdate.newCameraPosition(_goToSearchedLocation),
            // );

            // استخدام getPlaceLocation مع الإحداثيات
            BlocProvider.of<MapsCubit>(context).getPlaceLocation(
              selectedPlace.geometry!.coordinates![1].toString(),
              selectedPlace.geometry!.coordinates![0].toString(),
            );
          },
          child: PlaceItem(
              feature: Places[index]), // الآن Places تحتوي على Features
        );
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void buildSearchedPlaceMarker() {
    searcedPlaceMarker = Marker(
      position: _goToSearchedLocation.target,
      markerId: MarkerId("1"),
      infoWindow: InfoWindow(title: "${selectedPlace.properties?.state}"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      onTap: () {
        buildCurrentLocationMarker();
      },
    );
    addMarkerToMarkersSetAndUpdatUi(searcedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId("2"),
      infoWindow: InfoWindow(title: "my current location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      onTap: () {},
    );
    addMarkerToMarkersSetAndUpdatUi(currentLocationMarker);
  }

  void addMarkerToMarkersSetAndUpdatUi(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
          buildFloatingSearchBar()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.place,
          color: Colors.white,
        ),
        onPressed: () {
          goToMyLocation(_currentLocationCameraPosition);
        },
      ),
    );
  }
}
