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

  Future<List<Book>> getAllBooks() async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;

    final List<Map<String, dynamic>> bookMaps =
        await database.query("tb_livro");
    return List.generate(bookMaps.length, (index) {
      return Book(
        id: bookMaps[index]['id'],
        title: bookMaps[index]['title'],
        autor: bookMaps[index]['autor'],
        genre: bookMaps[index]['genre'],
        publicationYear: bookMaps[index]['publication_year'],
      );
    }).toList();
  }

  Future<void> removeBook(int id) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;

    try {
      await database.delete('tb_livro', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('Erro durante a remoção: $e');
    } finally {
      notifyListeners();
    }
  }

  getBook(int id) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;

    final bookMap =
        await database.query("tb_livro", where: 'id = ?', whereArgs: [id]);

    if (bookMap.isNotEmpty) {
      final book = bookMap.first;
      return Book(
          id: book['id'] as int,
          title: book['title'] as String,
          autor: book['autor'] as String,
          genre: book['genre'] as String,
          publicationYear: book['publication_year'] as num);
    }

    return;
  }

  Future<void> updateBook(int id, String title, String autor, String genre,
      num publicationYear) async {
    if (dbAux == null) {
      await _initRepository();
    }
    database = dbAux;

    final updatedBook = Book(
      id: id,
      title: title,
      autor: autor,
      genre: genre,
      publicationYear: publicationYear,
    );

    try {
      await database.update('tb_livro', updatedBook.toMap(),
          where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('Erro durante a atualização: $e');
    } finally {
      notifyListeners();
    }
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
      return 0;
    } finally {
      notifyListeners();
    }
  }
}
