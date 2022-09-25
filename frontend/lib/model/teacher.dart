import 'models.dart';

class Teacher {
  final String id;
  final String name;
  final String email;
  final List<String> students;
  final List<Student> userStudents;
  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.students,
    this.userStudents = const [],
  });

  static Teacher fromJSON(Map<String, dynamic> map) => Teacher(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        students: List<String>.from(map['students']),
      );

  Teacher copyWith({
    String? id,
    String? name,
    String? email,
    List<String>? students,
    List<Student>? userStudents,
  }) =>
      Teacher(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        students: students ?? this.students,
        userStudents: userStudents ?? this.userStudents,
      );
}
