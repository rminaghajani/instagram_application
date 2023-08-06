import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff323A99), Color(0xffF98BFC)],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getLoginContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 50,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getLoginContainer(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                        color: white,
                        fontFamily: 'GB',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image(
                      image: AssetImage('images/mood.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 16,
                        color: negahban1.hasFocus ? pink : gray,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: gray,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: pink,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 16,
                        color: negahban2.hasFocus ? pink : gray,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: gray,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: pink,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('Sign in'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
