import 'package:flutter/material.dart';
import 'package:instagram/screens/splash_screen.dart';

import 'data/constants/constants.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              color: white,
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        textTheme: TextTheme(
            headlineMedium: TextStyle(
              color: white,
              fontFamily: 'GB',
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: TextStyle(
              color: white,
              fontFamily: 'GR',
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
