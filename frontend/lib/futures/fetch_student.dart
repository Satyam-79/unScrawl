import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/managers.dart';
import '../student_view/student_view.dart';
import '../widgets/widgets.dart';

class FetchStudent extends StatelessWidget {
   FetchStudent({Key? key, required this.studentID}) : super(key: key);

  final String studentID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<StudentManager>(
          builder: (context, manager, child) => FutureBuilder(
            future: manager.getData(studentID),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == true) {
                  return StudentNavigationScreen();
                } else {
                  return Text('${snapshot.data} | ${snapshot.error}');
                }
              } else {
                return SplashAnimation();
              }
            },
          ),
        ),
      ),
    );
  }
}
