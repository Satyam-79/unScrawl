import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';
import 'widgets.dart';

class OverHomeScreen extends StatefulWidget {
  const OverHomeScreen({Key? key}) : super(key: key);

  @override
  State<OverHomeScreen> createState() => _OverHomeScreenState();
}

class _OverHomeScreenState extends State<OverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<StudentManager>(
        builder: (context, manager, child) {
          return manager.studentObject.topFourAlphabets.isEmpty
              ? emptyState()
              : showTopFour(manager);
        },
      ),
    );
  }

  Column emptyState() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Let\'s begin',
            style: title,
          ),
          SmallGIF(alphabet: String.fromCharCode(Random().nextInt(26) + 97)),
          SmallGIF(alphabet: String.fromCharCode(Random().nextInt(26) + 97)),
        ],
      );

  Column showTopFour(value) => Column(
        children: [
          Row(
            children: [
              SmallGIF(alphabet: value.studentObject.topFourAlphabets[0]),
              SizedBox(width: 10),
              SmallGIF(alphabet: value.studentObject.topFourAlphabets[1]),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SmallGIF(alphabet: value.studentObject.topFourAlphabets[2]),
              SizedBox(width: 10),
              SmallGIF(alphabet: value.studentObject.topFourAlphabets[3]),
            ],
          )
        ],
      );
}
