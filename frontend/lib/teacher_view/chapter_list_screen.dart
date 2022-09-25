import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';
import 'teacher_view.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<TeacherManager>(context);

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 14),
                  child: Row(
                    children: [
                      Text('Chapter List', style: headingStyle),
                      PandaImage()
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: mainContainerHeight - 30,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: ListView.builder(
                        itemCount:
                            manager.teacher.userStudents[0].chapters.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChapterRankingScreen(
                                      teacher: manager.teacher,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                height: physicalHeight * .027,
                                width: physicalWidth * .17,
                                decoration: cardDecoration,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Chapter ${(index + 1).toString()}',
                                        softWrap: true,
                                        style: title,
                                      ),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
