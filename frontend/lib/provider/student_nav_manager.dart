import 'package:flutter/material.dart';
import 'package:unscrawl/screens/info_screen.dart';

import '../student_view/student_view.dart';

class StudentNavigationManager extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  Widget bodyScreen = StudentHomeScreen();

  currentScreen(int index) {
    _index = index;
    if (index == 0) {
      bodyScreen = StudentHomeScreen();
    }
    if (index == 1) {
      bodyScreen = RecordScreen();
    }
    if (index == 2) {
      bodyScreen = ViewChapters();
    }
    if (index == 3) {
      bodyScreen = InfoScreen();
    }
    notifyListeners();
  }
}
