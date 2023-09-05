import 'package:catalogo_de_livros/src/models/book.dart';
import 'package:flutter/material.dart';

class BookList extends ChangeNotifier {
  final List<Book> _books = [
    Book(
      title: 'Introdução ao Pentest',
      autor: 'Daniel Moreno',
      genre: 'Computação e Tecnologia',
      publicationYear: 2019,
    ),
    Book(
        title:
            "Técnicas de Invasão: Aprenda as técnicas usadas por hackers em invasões reais ",
        autor: "Bruno Fraga",
        genre: 'Computação e Tecnologia',
        publicationYear: 2019),
    Book(
        title: 'A Arte da Guerra: Edição Especial ',
        autor: 'Sun Tzu',
        genre: 'Autodesenvolvimento',
        publicationYear: 2021),
    Book(
        title: "It: A coisa ",
        autor: "Stephen King",
        genre: "Terror",
        publicationYear: 2014)
  ];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }
}
