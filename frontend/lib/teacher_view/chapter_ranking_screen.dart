import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/models.dart';
import '../provider/managers.dart';
import '../theme.dart';
import '../widgets/widgets.dart';

class ChapterRankingScreen extends StatelessWidget {
  const ChapterRankingScreen({Key? key, required this.teacher})
      : super(key: key);

  final Teacher teacher;

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
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Ranking', style: headingStyle),
                      PandaImage()
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: physicalHeight * .29,
                    width: mainContainerWidth,
                    decoration: mainDecoration,
                    child:Consumer<TeacherManager>(builder: (context, value, child) =>  ListView.builder(
                      itemCount: value.sortedStudent.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ),
                              Container(
                                height: physicalHeight * .027,
                                width: physicalWidth * .24,
                                decoration: cardDecoration,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child:
                                            Text(
                                          value.sortedStudent[index],
                                          softWrap: true,
                                          style: title,

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
