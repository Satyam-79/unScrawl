import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({Key? key, required this.index, required this.score})
      : super(key: key);

  final int index;
  final num score;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration,
      child: ListTile(
        title: Text(
          'Chapter ${index + 1}',
          style: title,
        ),
        trailing: SizedBox(
          width: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/star.png'),
              Center(
                child: Text(
                  score.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
