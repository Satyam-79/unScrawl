import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class TeacherManager extends ChangeNotifier {
  late Teacher _teacher;

  Teacher get teacher => _teacher;
  List<String> sortedStudent=[];

  Future<bool> getData(uid) async {
    final teacherData = await FirebaseFirestore.instance
        .collection('teacher')
        .doc(uid)
        .get()
        .then((doc) => doc.data()!);

    List<Student> students = [];
    for (final studentID in teacherData['students']) {
      final studentData = await FirebaseFirestore.instance
          .collection('student')
          .doc(studentID)
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
      studentObject = studentObject.copyWith(chapter: chapters);
      students.add(studentObject);
    }

    Teacher teacherObject = Teacher.fromJSON(teacherData);
    _teacher = teacherObject.copyWith(userStudents: students);

    //StudentRanking();

    return true;
  }

  void StudentRanking() {
    int i = -1;
    for (var student in _teacher.userStudents) {
      i += 1;
      Student userStudent = student;
      num max = student.score;
      for (int j = i + 1; j < _teacher.userStudents.length; j++) {
        if (max < _teacher.userStudents[j].score) {
          userStudent = _teacher.userStudents[j];
          max = _teacher.userStudents[j].score;
        }
      }
      sortedStudent.add(userStudent.name);
      _teacher.userStudents.remove(userStudent);
    }
  }
}
