import 'package:flutter/material.dart';

import '../theme.dart';

class ResultScreenOne extends StatelessWidget {
  const ResultScreenOne({
    Key? key,
    required this.mainImageUrl,
  }) : super(key: key);

  final String mainImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Text('Report', style: headingStyle),
            ),
            Container(
              decoration: mainDecoration,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  mainImageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
