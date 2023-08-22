import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/switch_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNextPage();
  }

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

  void _goNextPage() {
    var duration = Duration(seconds: 5);
    Future.delayed(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return SwitchScreen();
          },
        ),
      );
    });
  }
}
