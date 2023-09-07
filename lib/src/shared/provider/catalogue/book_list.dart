import 'dart:math';

import 'package:catalogo_de_livros/src/models/book.dart';
import 'package:flutter/material.dart';

class BookList extends ChangeNotifier {
  final List<Book> _books = [
    Book(
      id: Random().nextInt(100) + 1,
      title: 'Introdução ao Pentest',
      autor: 'Daniel Moreno',
      genre: 'Computação e Tecnologia',
      publicationYear: 2019,
    ),
    Book(
        id: Random().nextInt(100) + 1,
        title:
            "Técnicas de Invasão: Aprenda as técnicas usadas por hackers em invasões reais ",
        autor: "Bruno Fraga",
        genre: 'Computação e Tecnologia',
        publicationYear: 2019),
    Book(
        id: Random().nextInt(100) + 1,
        title: 'A Arte da Guerra: Edição Especial ',
        autor: 'Sun Tzu',
        genre: 'Autodesenvolvimento',
        publicationYear: 2021),
    Book(
        id: Random().nextInt(100) + 1,
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
