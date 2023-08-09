import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetDesign extends StatelessWidget {
  const BottomSheetDesign({super.key});

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
          color: Color.fromRGBO(255, 255, 255, 0.09),
          height: 300,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
