class Chapter {
  final String id;
  final List<String> pages;
  final num score;

  Chapter({
    required this.id,
    required this.pages,
    required this.score,
  });

  static Chapter fromJSON(Map<String, dynamic> map) => Chapter(
        id: map['id'],
        pages: List.castFrom(map['pages']),
        score: map['score'],
      );
}
