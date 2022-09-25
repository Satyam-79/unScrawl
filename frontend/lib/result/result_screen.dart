import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unscrawl/theme.dart';

import 'one.dart';
import 'three.dart';
import 'two.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.result}) : super(key: key);
  final Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    List screen = [
      ResultScreenOne(mainImageUrl: result['main']),
      ResultScreenTwo(
        alphabetsUrl: result['alphabet'],
        spellingUrl: result['spelling'],
        alphabetsList: result['alphabetList'],
      ),
      ResultScreenThree(
        score: result['score'],
        inCorrectWord: result['incorrectWords'],
        totalWord: result['totalWords'],
      )
    ];
    PageController controller = PageController();
    print(result);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          itemCount: screen.length,
          controller: controller,
          itemBuilder: (context, index) {
            return screen[index];
          },
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: JumpingDotEffect(
            activeDotColor: darkBackgroundColor,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            radius: 10,
          ),
        )
      ],
    );
  }
}
