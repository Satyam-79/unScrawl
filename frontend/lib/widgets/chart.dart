import 'package:flutter/material.dart';

import '../model/models.dart';
import '../theme.dart';
import 'widgets.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.chapters}) : super(key: key);

  final List<Chapter> chapters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 300,
      width: mainContainerWidth,
      decoration: mainDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'SCORE',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ...List.generate(
                5,
                (index) => ChartBar(
                  index: index + 1,
                  height: (chapters[index].score * 200) / 20,
                  score: chapters[index].score.round(),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            'CHAPTERS',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
