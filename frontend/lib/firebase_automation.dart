import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<Map<String, dynamic>> students = [
  {
    'name': 'Student One',
    'email': 'student1@gmail.com',
    'topFour': [],
    'score': 0,
    'password': 'student_1'
  },
  {
    'name': 'Student Two',
    'email': 'student2@gmail.com',
    'topFour': [],
    'score': 0,
    'password': 'student_2'
  },
  {
    'name': 'Student Three',
    'email': 'student3@gmail.com',
    'topFour': [],
    'score': 0,
    'password': 'student_3'
  },
  {
    'name': 'Student Four',
    'email': 'student4@gmail.com',
    'topFour': [],
    'score': 0,
    'password': 'student_4'
  },
  {
    'name': 'Student Five',
    'email': 'student5@gmail.com',
    'topFour': [],
    'score': 0,
    'password': 'student_5'
  }
];

Future<List<String>> createStudentAccount(List<String> chapterIDs) async {
  final List<String> studentIDs = [];

  for (var i = 0; i < students.length; i++) {
    final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: students[i]['email'],
      password: students[i]['password'],
    );

    final studentID = userCred.user!.uid;
    studentIDs.add(studentID);
    final chapters = chapterIDs.getRange(i * 5, i * 5 + 5).toList();

    FirebaseFirestore.instance.collection('student').doc(studentID).set({
      'id': studentID,
      'name': students[i]['name'],
      'email': students[i]['email'],
      'score': students[i]['score'],
      'topFourAlphabets': students[i]['topFour'],
      'chapters': chapters,
    });
  }

  return studentIDs;
}

Future<List<String>> createChapters() async {
  final List<String> chapterIDs = [];
  final chapterCollection = FirebaseFirestore.instance.collection('chapter');

  for (var i = 0; i < 25; i++) {
    final chapterDoc = await chapterCollection.add({
      'pages': [],
      'score': 0,
    });

    chapterCollection.doc(chapterDoc.id).update({'id': chapterDoc.id}).then(
      (_) => chapterIDs.add(chapterDoc.id),
    );
  }

  return chapterIDs;
}

List<Map<String, dynamic>> teachers = [
  {
    'name': 'Teacher One',
    'email': 'teacher1@gmail.com',
    'password': 'teacher_1'
  },
  {
    'name': 'Teacher Two',
    'email': 'teacher2@gmail.com',
    'password': 'teacher_2'
  },
];

void createTeacherAccount(List<String> studentIDs) async {
  List<int> skip = [0, 3, 3, 5];

  for (var i = 0; i < teachers.length; i++) {
    final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: teachers[i]['email'],
      password: teachers[i]['password'],
    );

    final teacherID = userCred.user!.uid;

    FirebaseFirestore.instance.collection('teacher').doc(teacherID).set({
      'id': teacherID,
      'name': teachers[i]['name'],
      'email': teachers[i]['email'],
      'students': studentIDs.sublist(skip[i], skip[i + 2]),
    });
  }
}

Future<void> firebaseAutomation() async {
  final chapterIDS = await createChapters();
  final studentIDS = await createStudentAccount(chapterIDS);
  createTeacherAccount(studentIDS);
}
