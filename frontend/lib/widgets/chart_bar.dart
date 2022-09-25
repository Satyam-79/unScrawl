import 'package:flutter/material.dart';
import 'package:unscrawl/theme.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.height,
    required this.index,
    required this.score,
  }) : super(key: key);

  final num score;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(score.toString()),
          SizedBox(height: 2),
          Container(
            height: height,
            width: 30,
            decoration: BoxDecoration(
              color: darkBackgroundColor,
              // borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 2),
          Text(index.toString()),
        ],
      ),
    );
  }
}
