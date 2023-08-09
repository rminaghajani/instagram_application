import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: false,
        title: Image(
          width: 128,
          height: 24,
          image: AssetImage('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetDesign();
                    });
              },
              child: Text('Open BottomSheet'),
            ),
            _getSotryList(),
            _getPostList(),
          ],
        ),
      ),
    );
  }

  Widget _addStoryBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'your story',
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }

  Widget _storyOfFollowings(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 60,
      height: 60,
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            strokeWidth: 2,
            color: pink,
            dashPattern: [10, 5],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('images/profile.png'),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'armin',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _profileImageForPost() {
    return Container(
      width: 46,
      height: 46,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(17),
        padding: EdgeInsets.all(4),
        strokeWidth: 2,
        color: pink,
        dashPattern: [10, 5],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _getHeaderOfPost(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _profileImageForPost(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'arminaghajani',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Front-end developer',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getBodyOfPost(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 400,
        width: 392,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 356,
                height: 356,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/post3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('images/icon_video.png'),
            ),
            Positioned(
              bottom: 15,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    width: 320,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.2),
                          ]),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_hart.png'),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '2.5 k',
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Row(
                          children: [
                            Image.asset('images/icon_comments.png'),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '1.5 k',
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Image.asset('images/icon_share.png'),
                        SizedBox(
                          width: 35,
                        ),
                        Image.asset('images/icon_save.png'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _getHeaderOfPost(context),
            SizedBox(
              height: 15,
            ),
            _getBodyOfPost(context),
          ],
        );
      },
      itemCount: 9,
    );
  }

  Widget _getSotryList() {
    return Container(
      height: 87,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0
                ? _addStoryBox(context)
                : _storyOfFollowings(context);
          }),
    );
  }
}
