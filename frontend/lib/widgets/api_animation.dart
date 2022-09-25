import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class APIAnimation extends StatelessWidget {
  APIAnimation({Key? key}) : super(key: key);

  final RiveAnimationController _controller = SimpleAnimation('idle');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff25536E),
      body: RiveAnimation.asset(
        'assets/rive/panda1.riv',
        // controllers: [_controller],
      ),
    );
  }
}
