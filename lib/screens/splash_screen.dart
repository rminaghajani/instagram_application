import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage(
            'images/pattern.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: Image(
                  image: AssetImage(
                    'images/logo_splash.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    'Armin Aghajani',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontWeight: FontWeight.w700,
                      color: Color(0xff55B9F7),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
