class Page {
  final String folderID;
  final String id;
  final num incorrectWord;
  final num score;
  final num totalWord;

  Page({
    required this.folderID,
    required this.id,
    required this.incorrectWord,
    required this.score,
    required this.totalWord,
  });

  static Page fromJSON(Map<String, dynamic> map) => Page(
        id: map['id'],
        folderID: map['folderId'],
        incorrectWord: map['incorrectWords'],
        totalWord: map['totalWords'],
        score: map['score'],
      );
}
