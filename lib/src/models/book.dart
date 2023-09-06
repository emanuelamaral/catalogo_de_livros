class Book {
  final int? id;
  final String title;
  final String autor;
  final String genre;
  final num publicationYear;

  Book(
      {this.id,
      required this.title,
      required this.autor,
      required this.genre,
      required this.publicationYear});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'autor': autor,
      'genre': genre,
      'publication_year': publicationYear
    };
  }
}
