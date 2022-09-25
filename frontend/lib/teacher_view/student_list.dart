import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';
import 'teacher_view.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 14, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Student List',
                      style: headingStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: PandaImage(),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  height: mainContainerHeight - 20,
                  width: mainContainerWidth,
                  decoration: mainDecoration,
                  child: Consumer<TeacherManager>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.teacher.students.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecordScreen(
                                      userStudent:
                                          value.teacher.userStudents[index],
                                    ),
                                  ),
                                );
                              },
                              child: StudentTile(
                                userStudent: value.teacher.userStudents[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
