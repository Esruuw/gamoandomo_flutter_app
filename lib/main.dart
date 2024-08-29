import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:omogamo/views/intro.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Map',
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/splash.png',
        splashIconSize: 300,
        nextScreen: IntroPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}


