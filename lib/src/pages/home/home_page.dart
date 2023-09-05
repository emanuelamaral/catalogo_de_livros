import 'package:catalogo_de_livros/src/components/card_book.dart';
import 'package:catalogo_de_livros/src/pages/add_book/add_book.dart';
import 'package:catalogo_de_livros/src/pages/book_content/book_content.dart';
import 'package:catalogo_de_livros/src/shared/provider/catalogue/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookList = context.read<BookList>();

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
          itemCount: bookList.books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookContent(bookList.books[index]),
                    ));
              },
              child: CardBook(book: bookList.books[index]),
            );
          }),
    );
  }
}
