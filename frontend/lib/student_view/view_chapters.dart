import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';
import 'student_view.dart';

class ViewChapters extends StatelessWidget {
  const ViewChapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<StudentManager>(context);

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 0),
                  child: Row(
                    children: const [
                      Text('Chapter List', style: headingStyle),
                      PandaImage()
                    ],
                  ),
                ),
                //SizedBox(height: 10,),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: mainContainerHeight - 10,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: ListView.builder(
                      itemCount: manager.studentObject.chapters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: InkWell(
                            onTap: () {
                              print(manager.studentObject.chapters[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageScreen(
                                    chapterIndex: index,
                                    chapterID:
                                        manager.studentObject.chapters[index],
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
                      },
                    ),
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
