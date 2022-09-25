import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';

class TeacherNavigationScreen extends StatelessWidget {
  const TeacherNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<TeacherNavigationManager>(context);
    return Scaffold(
      body: SizedBox.expand(
        child: manager.bodyScreen,
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: manager.index,
        dotIndicatorColor: darkBackgroundColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: darkBackgroundColor,
        backgroundColor: backgroundColor,
        boxShadow: [primaryShadow],
        onTap: (index) => manager.currentScreen(index),
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.view_list),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
