import 'package:flutter/material.dart';

import '../model/models.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key, required this.userStudent}) : super(key: key);

  final Student userStudent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 0.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20),
                          child: ProfileAvatar(
                            text: userStudent.name[0],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0, top: 20),
                        child: Text(
                          userStudent.name,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: 'voll',
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      PandaImage()
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: physicalHeight * .13,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child: ListView.builder(
                      itemCount: userStudent.chapters.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ChapterListTile(
                            index: index,
                            score: userStudent.chapter[index].score.round(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Chart(chapters: userStudent.chapter),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
