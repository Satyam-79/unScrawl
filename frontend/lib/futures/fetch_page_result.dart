import 'dart:io';

import 'package:flutter/material.dart';

import '../result/result_screen.dart';
import '../widgets/widgets.dart';
import 'result_function.dart';

class FetchPageResult extends StatelessWidget {
  const FetchPageResult({
    Key? key,
    required this.image,
    required this.chapterId,
  }) : super(key: key);

  final File image;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: resultWithImageUpload(image, chapterId),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // return ResultScreen(result: snapshot.data!);
                return ResultScreen(result: snapshot.data!);
              } else {
                return Text('Error : ${snapshot.error}');
              }
            } else {
              return Center(child: APIAnimation());
            }
          },
        ),
      ),
    );
  }
}
