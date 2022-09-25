import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<StudentManager>(context);

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 20, bottom: 0),
                        child: ProfileAvatar(
                          text: manager.studentObject.name[0],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 20, bottom: 0),
                        child: Text(
                          manager.studentObject.name,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: 'voll',
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      PandaImage(),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: physicalHeight * .115,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: ListView.builder(
                      itemCount: manager.studentObject.chapters.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ChapterListTile(
                            index: index,
                            score: manager.studentObject.chapter[index].score
                                .round(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Spacer(),
                Chart(chapters: manager.studentObject.chapter),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
