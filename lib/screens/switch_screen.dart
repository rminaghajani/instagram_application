import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/main_screen.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        width: 352,
                        height: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                width: 129,
                                image: AssetImage('images/profile.png'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'ArminAghajani',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return MainScreen();
                                      },
                                    ),
                                  );
                                },
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                child: Text('Confirm'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(130, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                side: BorderSide(
                                  color: white,
                                  width: 3,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Switch account',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 132,
              bottom: 63,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? / ',
                  style: TextStyle(
                      fontFamily: 'GB',
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      fontSize: 16),
                ),
                Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
