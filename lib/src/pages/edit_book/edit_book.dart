import 'package:catalogo_de_livros/src/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';

class EditBook extends StatefulWidget {
  final Book book;

  EditBook(this.book);

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final titleController = TextEditingController();
  final autorController = TextEditingController();
  final genreController = TextEditingController();
  final publicationYearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.book.title;
    autorController.text = widget.book.autor;
    genreController.text = widget.book.genre;
    publicationYearController.text = widget.book.publicationYear.toString();
  }

  void _submitForm(BuildContext context) async {
    var title = titleController.text;
    var autor = autorController.text;
    var genre = genreController.text;
    var publicationYear = int.tryParse(publicationYearController.text) ?? 0.0;

    final bookRepository = Provider.of<BookRepository>(context, listen: false);

    await bookRepository.updateBook(
        widget.book.id!, title, autor, genre, publicationYear);

    Navigator.of(context).popUntil((route) {
      return route.settings.name == '/home';
    });
  }

  void _removeBook(BuildContext context) async {
    final bookRepository = Provider.of<BookRepository>(context, listen: false);

    await bookRepository.removeBook(widget.book.id!);

    Navigator.of(context).popUntil((route) {
      return route.settings.name == '/home';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Titulo do livro'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: autorController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome do Autor'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: genreController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Gênero do livro'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: publicationYearController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Ano de Publicação'),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFFD16BA5),
                Color(0xFF86a8e7),
                Color(0xFF5ffbf1),
              ],
            ),
          ),
          child: TextButton(
              onPressed: () => _submitForm(context),
              child: const Text('Editar Livro',
                  style: TextStyle(fontSize: 18, color: Colors.white))),
        ),
        TextButton(
            onPressed: () => _removeBook(context),
            child: const Text("Remover Livro"))
      ],
    )));
  }
}
