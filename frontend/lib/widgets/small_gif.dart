import 'package:flutter/material.dart';

import '../theme.dart';

class SmallGIF extends StatelessWidget {
  const SmallGIF({Key? key, required this.alphabet}) : super(key: key);
  final String alphabet;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: physicalHeight * .07,
      width: physicalWidth * .13,
      decoration: BoxDecoration(
          color: darkBackgroundColor,
          boxShadow: [primaryShadow],
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/alphabets/$alphabet.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
