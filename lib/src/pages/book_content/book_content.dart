import 'package:catalogo_de_livros/src/models/books.dart';
import 'package:flutter/material.dart';

import '../add_book/edit_book.dart';

class BookContent extends StatefulWidget {
  final Book books;

  BookContent(this.books);

  @override
  State<BookContent> createState() => _BookContentState();
}

_openEditBookModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return const EditBook();
      });
}

class _BookContentState extends State<BookContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.books.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Icon(
              Icons.menu_book,
              size: 160,
            )),
            const SizedBox(height: 16.0),
            Text(
                "Ano de Publicação do livro: ${widget.books.publicationYear.toString()}"),
            Text("Autor do livro: ${widget.books.autor}"),
            Text("Gênero do livro: ${widget.books.genre}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openEditBookModal(context),
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
