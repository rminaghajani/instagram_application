import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetDesign extends StatelessWidget {
  const BottomSheetDesign({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40.0,
          sigmaY: 40.0,
        ),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          height: 300,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              _getContent(),
              _getShareButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _getContent() {
  //   return GridView.builder(
  //     controller: controller,
  //     itemCount: 100,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisSpacing: 20,
  //       mainAxisSpacing: 20,
  //       crossAxisCount: 4,
  //     ),
  //     itemBuilder: (BuildContext context, int index) {
  //       return Container(
  //         color: Colors.red,
  //       );
  //     },
  //   );
  // }

  Widget _getContent() {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: _headerOfBottomSheet(),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getItemGrid();
            },
            childCount: 50,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            mainAxisExtent: 110,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            top: 100,
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('images/profile.png'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'armin aghajani',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'GB', fontSize: 12, color: Colors.white),
        )
      ],
    );
  }

  Widget _headerOfBottomSheet() {
    return Column(
      children: [
        Container(
          height: 5,
          width: 67,
          margin: EdgeInsets.only(top: 10, bottom: 22),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Share',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Image.asset('images/icon_share_bottomsheet.png')
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset('images/icon_search.png'),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search User',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget _getShareButton() {
    return Positioned(
      bottom: 47,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
          child: Text(
            'Share',
            style: TextStyle(fontFamily: 'GB', fontSize: 16),
          ),
        ),
      ),
    );
  }
}
