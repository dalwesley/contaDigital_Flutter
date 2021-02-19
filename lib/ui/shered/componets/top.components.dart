import 'package:flutter/material.dart';
import 'package:card/themes/light.theme.dart';

class TopComponents extends StatelessWidget {
  final int height;

  TopComponents({this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryColor,
          // child: Center(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         "assets/images/PC_3.png",
          //         width: 200,
          //       ),
          //     ],
          //   ),
          // ),
          width: double.infinity,
          height: 50,
        ),
        Container(
          color: dangerColor,

          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: new ExactAssetImage(
          //       "assets/images/ativo2.png",
          //     ),
          //     fit: BoxFit.cover,
          //     alignment: Alignment.bottomCenter,
          //   ),
          // ),
          width: double.infinity,
          height: 5,
        ),
      ],
    );
  }
}
