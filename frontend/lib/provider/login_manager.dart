import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../futures/fetch_student.dart';
import '../futures/fetch_teacher.dart';

class LoginManager extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login(
    String email,
    String password,
    String role,
    context,
  ) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user != null) {
        final pref = await SharedPreferences.getInstance();
        pref.setString('userType', role);
        Map<String, dynamic>? userData;

        if (role == 'Teacher') {
          final userDocReference = FirebaseFirestore.instance
              .collection('teacher')
              .doc(user.user!.uid);
          await userDocReference
              .get()
              .then((value) => userData = value.data())
              .catchError((error) {
            print(error);
          });
          if (userData == null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('User not Found!')));
            FirebaseAuth.instance.signOut();
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FetchTeacher(uid: user.user!.uid),
              ),
            );
          }
        }
        if (role == 'Student') {
          final userDocReference = FirebaseFirestore.instance
              .collection('student')
              .doc(user.user!.uid);
          await userDocReference
              .get()
              .then((value) => userData = value.data())
              .catchError((error) {
            print(error);
          });
          if (userData == null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('User not Found!')));
            FirebaseAuth.instance.signOut();
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FetchStudent(studentID: user.user!.uid),
              ),
            );
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        final snackBar = SnackBar(content: Text('No user found.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        final snackBar = SnackBar(content: Text('Wrong Password!!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
