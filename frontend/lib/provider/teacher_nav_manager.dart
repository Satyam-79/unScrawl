import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../teacher_view/teacher_view.dart';

class TeacherNavigationManager extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  Widget bodyScreen = TeacherHomeScreen();

  currentScreen(int index) {
    _index = index;
    if (index == 0) {
      bodyScreen = TeacherHomeScreen();
    }
    if (index == 1) {
      bodyScreen = StudentList();
    }
    if (index == 2) {
      bodyScreen = ChapterListScreen();
    }
    if (index == 3) {
      bodyScreen = InfoScreen();
    }
    notifyListeners();
  }
}
