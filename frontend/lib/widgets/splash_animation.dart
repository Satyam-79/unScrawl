import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF9F9F),
      body: Center(
        child: RiveAnimation.asset('assets/rive/apple.riv'),
      ),
    );
  }
}
