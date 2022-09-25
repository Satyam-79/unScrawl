import 'dart:ui';

import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFFF4E5E4);
const Color darkBackgroundColor = Color(0xFFF7B6A7);

final double physicalHeight = window.physicalSize.height;
final double physicalWidth = window.physicalSize.width;
final double mainContainerHeight = physicalHeight * .265;
final double mainContainerWidth = physicalWidth * 0.3;
final double overContainerHeight = physicalHeight * .07;
final double overContainerWidth = physicalWidth * .13;
const double overContainerPadding = 10;

const TextStyle appTitle = TextStyle(fontSize: 40, fontFamily: 'Dyna');
const TextStyle headingStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'RobotoCon',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
const TextStyle title = TextStyle(
  fontFamily: 'RobotoCon',
  color: Colors.black,
  fontSize: 25,
);

TextStyle infoHeadingStyle = TextStyle(
    fontFamily: 'RobotoCon',
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold);

final BoxShadow primaryShadow = BoxShadow(
  offset: Offset(0, 2),
  blurRadius: 10,
  color: Color(0x2F000000),
);

final BoxDecoration mainDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [primaryShadow],
  borderRadius: BorderRadius.circular(20),
);
final BoxDecoration cardDecoration = BoxDecoration(
  color: darkBackgroundColor,
  borderRadius: BorderRadius.circular(10),
);
