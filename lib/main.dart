import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/besenes%20logic/maps/maps_cubit.dart';
import 'package:flutter_maps/besenes%20logic/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/repository/maps_repository.dart';
import 'package:flutter_maps/screens/splash_screen.dart';
import 'package:flutter_maps/services/init_getIt_services.dart';
import 'package:flutter_maps/services/navigation_services.dart';
import 'package:flutter_maps/services/place_webservices.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(providers: [
       BlocProvider(
      create: (context) => PhoneAuthCubit(),
    ),
    BlocProvider(
      create: (context) => MapsCubit(MapsRepository( placeWebservices: PlaceWebservices())),
    ),

    ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        home: SplashScreen(),
      ),);
   
  }
}
