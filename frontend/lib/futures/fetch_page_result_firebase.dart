import 'package:flutter/material.dart';

import '../result/result_screen.dart';
import '../widgets/widgets.dart';
import 'result_function.dart';

class FetchPageResultFirebase extends StatelessWidget {
  const FetchPageResultFirebase({Key? key, required this.pageID})
      : super(key: key);

  final String pageID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: resultWithoutUpload(pageID),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ResultScreen(result: snapshot.data!);
              } else {
                return Text(snapshot.error.toString());
              }
            } else {
              return Center(
                child: APIAnimation(),
              );
            }
          },
        ),
      ),
    );
  }
}
