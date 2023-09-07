import 'dart:math';

import 'package:catalogo_de_livros/src/models/book.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';

class BookRepository extends ChangeNotifier {
  late Database database;
  dynamic dbAux;

  BookRepository() {
    _initRepository();
  }

  _initRepository() async {
    dbAux = await DB.instance.database;
  }

  Future<int> addBook(
      String title, String autor, String genre, num publicationYear) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;
    final newBook = Book(
        title: title,
        autor: autor,
        genre: genre,
        publicationYear: publicationYear);

    try {
      final id = await database.insert('tb_livro', newBook.toMap());
      return id;
    } catch (e) {
      print('Erro durante a inserção: $e');
    }

    notifyListeners();
    return 0;
  }
}