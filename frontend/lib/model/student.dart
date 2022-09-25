import 'models.dart';

class Student {
  final String id;
  final String? email;
  final String name;
  final num score;
  final List<String> chapters;
  final List<Chapter> chapter;
  final List<String> topFourAlphabets;

  Student({
    required this.id,
    required this.email,
    required this.name,
    required this.chapters,
    required this.score,
    this.chapter = const [],
    this.topFourAlphabets = const [],
  });

  static Student fromJSON(Map<String, dynamic> map) => Student(
        id: map['id'],
        email: map['email'],
        name: map['name'],
        score: map['score'],
        chapters: List<String>.from(map['chapters']),
        topFourAlphabets: List<String>.from(map['topFourAlphabets']),
      );

  Student copyWith({
    String? id,
    String? email,
    String? name,
    num? score,
    List<String>? chapters,
    List<Chapter>? chapter,
    List<String>? topFourAlphabets,
  }) =>
      Student(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        score: score?? this.score,
        chapters: chapters ?? this.chapters,
        chapter: chapter ?? this.chapter,
        topFourAlphabets: topFourAlphabets ?? this.topFourAlphabets,
      );
}
