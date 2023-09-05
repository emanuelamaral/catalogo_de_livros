import 'package:catalogo_de_livros/src/models/books.dart';
import 'package:flutter/material.dart';

class BookContent extends StatelessWidget {
  final Book books;

  BookContent(this.books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(books.title),
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
                "Ano de Publicação do livro: ${books.publicationYear.toString()}"),
            Text("Autor do livro: ${books.autor}"),
            Text("Gênero do livro: ${books.genre}")
          ],
        ),
      ),
    );
  }
}
