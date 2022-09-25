import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/widgets.dart';

class ResultScreenThree extends StatelessWidget {
  const ResultScreenThree({
    Key? key,
    required this.totalWord,
    required this.inCorrectWord,
    required this.score,
  }) : super(key: key);

  final num totalWord;
  final num inCorrectWord;
  final num score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text('Grades', style: headingStyle),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 30,
                    ),
                    height: mainContainerHeight,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: Column(
                      children: [
                        card('Score - $score /20'),
                        SizedBox(
                          height: 20,
                        ),
                        card('Total words - $totalWord'),
                        SizedBox(
                          height: 20,
                        ),
                        card('Correct words - ${totalWord - inCorrectWord}'),
                        SizedBox(
                          height: 20,
                        ),
                        card('Incorrect words - $inCorrectWord'),
                        SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/resultPanda.png',
                          height: physicalHeight * .1,
                          width: physicalWidth * .2,
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {Navigator.pop(context);
                  Navigator.pop(context);},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xfff7b6a7)),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container card(String text) => Container(
        height: physicalHeight * .024,
        width: physicalWidth * .25,
        decoration: cardDecoration,
        child: Center(
          child: Text(
            text,
            softWrap: true,
            style: title,
          ),
        ),
      );
}
