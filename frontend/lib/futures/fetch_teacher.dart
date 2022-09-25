import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/managers.dart';
import '../teacher_view/teacher_view.dart';
import '../widgets/widgets.dart';

class FetchTeacher extends StatelessWidget {
  FetchTeacher({Key? key, required this.uid}) : super(key: key);

  final String uid;
  @override
  Widget build(BuildContext context) {
    final userTeacherProvider =
        Provider.of<TeacherManager>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: userTeacherProvider.getData(uid),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                return TeacherNavigationScreen();
              } else {
                return Text('${snapshot.data} | ${snapshot.error}');
              }
            } else {
              return SplashAnimation();
            }
          },
        ),
      ),
    );
  }
}
