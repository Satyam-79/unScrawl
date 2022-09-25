import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unscrawl/model/models.dart';
import 'package:unscrawl/theme.dart';

import '../provider/managers.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text('About Us', style: headingStyle),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                  ),
                  height: mainContainerHeight - 10,
                  width: mainContainerWidth,
                  decoration: mainDecoration,
                  child: ListView(
                    children: [
                      Text('What is this app doing?', style: infoHeadingStyle),
                      Text(
                          'The platform is providing help in the identification of strengths and weaknesses, the planning of instruction, the evaluation of instructional activities, the monitoring performance, and the reporting progress.',
                          style: title.copyWith(fontSize: 18),
                          textAlign: TextAlign.justify),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Why to use?',
                        style: infoHeadingStyle,
                      ),
                      Text(
                          "When someone's penmanship is crystal clear, we can understand what they're saying without much effort. If it's jumbled , we'll strain to read the letters and most likely misread the majority of the words.",
                          style: title.copyWith(fontSize: 18),
                          textAlign: TextAlign.justify),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Goal of App?',
                        style: infoHeadingStyle,
                      ),
                      Text(
                        "The  goal is to provide a platform that allows teachers and parents to digitally assess the quality and readability of a child's handwriting.It should also provide students with incentives and resources to help them improve their penmanship.",
                        style: title.copyWith(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ),
                          );
                          Provider.of<StudentNavigationManager>(context,
                                  listen: false)
                              .currentScreen(0);
                          Provider.of<TeacherNavigationManager>(context,
                                  listen: false)
                              .currentScreen(0);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xfff7b6a7)),
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Center(
                          child: Text(
                        'from',
                        style: TextStyle(fontSize: 12),
                      )),
                      Center(
                        child: Text(
                          'GeekBugs 0.0.1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
