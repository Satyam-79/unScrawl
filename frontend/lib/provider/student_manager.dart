import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class StudentManager extends ChangeNotifier {
  late Student _studentObject;

  Student get studentObject => _studentObject;

  Future<bool> getData(uid) async {
    final studentData = await FirebaseFirestore.instance
        .collection('student')
        .doc(uid)
        .get()
        .then((doc) => doc.data()!);

    final List<Chapter> chapters = [];
    for (final chapterID in studentData['chapters']) {
      final chapterData = await FirebaseFirestore.instance
          .collection('chapter')
          .doc(chapterID)
          .get()
          .then((doc) => doc.data()!);
      chapters.add(Chapter.fromJSON(chapterData));
    }

    Student studentObject = Student.fromJSON(studentData);
    _studentObject = studentObject.copyWith(chapter: chapters);
    return true;
  }
}
