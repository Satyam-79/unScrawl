import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import '../theme.dart';

class StudentNavigationScreen extends StatelessWidget {
  const StudentNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StudentNavigationManager>(context);
    return Scaffold(
      body: SizedBox.expand(
        child: provider.bodyScreen,
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: provider.index,
        dotIndicatorColor: darkBackgroundColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: darkBackgroundColor,
        backgroundColor: backgroundColor,
        boxShadow: [primaryShadow],
        onTap: (index) => provider.currentScreen(index),
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
