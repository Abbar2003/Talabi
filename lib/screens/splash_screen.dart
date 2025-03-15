import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/screens/login_screen.dart';
import 'package:flutter_maps/screens/maps_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        pageTransitionType: PageTransitionType.leftToRight,
        splashTransition: SplashTransition.slideTransition,
        animationDuration: Duration(seconds: 1),
        splash: Container(
          height: 200,
          width: 200,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                "assets/images/converted_image.png",
                fit: BoxFit.cover,
              )),
          alignment: Alignment.center,
          foregroundDecoration: BoxDecoration(),
        ),
        nextScreen: LoginScreen());
  }
}
