import 'package:catalogo_de_livros/src/components/card_book.dart';
import 'package:catalogo_de_livros/src/models/books.dart';
import 'package:catalogo_de_livros/src/pages/add_book/add_book.dart';
import 'package:catalogo_de_livros/src/pages/book_content/book_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Catálogo de Livros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddBook();
              }));
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: booksCatalogue.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookContent(booksCatalogue[index]),
                    ));
              },
              child: CardBook(livros: booksCatalogue[index]),
            );
          }),
    );
  }
}

List<Book> booksCatalogue = [
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
