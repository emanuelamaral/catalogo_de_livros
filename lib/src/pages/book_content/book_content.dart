import 'package:catalogo_de_livros/src/models/book.dart';
import 'package:flutter/material.dart';

import '../edit_book/edit_book.dart';

class BookContent extends StatefulWidget {
  final Book book;

  BookContent(this.book);

  @override
  State<BookContent> createState() => _BookContentState();
}

class _BookContentState extends State<BookContent> {
  _openEditBookModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return EditBook(widget.book);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
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
                "Ano de Publicação do livro: ${widget.book.publicationYear.toString()}"),
            Text("Autor do livro: ${widget.book.autor}"),
            Text("Gênero do livro: ${widget.book.genre}")
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
