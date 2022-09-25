import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../futures/fetch_student.dart';
import '../futures/fetch_teacher.dart';
import '../screens/screens.dart';

class UserManager extends ChangeNotifier {
  late String _userType;
  late bool _isLoggedIn;

  bool get isLoggedIn => _isLoggedIn;
  String get userType => _userType;

  void checkLogin() {
    final user = FirebaseAuth.instance.currentUser;
    user == null ? _isLoggedIn = false : _isLoggedIn = true;
  }

  Future<void> getUserType() async {
    final preferences = await SharedPreferences.getInstance();
    final userTypeString = preferences.getString('userType');
    userTypeString == 'Teacher' ? _userType = 'Teacher' : _userType = 'Student';
  }

  Future<void> checkStatus(context) async {
    checkLogin();
    await getUserType();

    _isLoggedIn
        ? _userType == 'Teacher'
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FetchTeacher(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                  ),
                ),
              )
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FetchStudent(
                    studentID: FirebaseAuth.instance.currentUser!.uid,
                  ),
                ),
              )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
  }
}
