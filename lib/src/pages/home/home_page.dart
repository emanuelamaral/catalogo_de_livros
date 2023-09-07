import 'package:catalogo_de_livros/src/components/card_book.dart';
import 'package:catalogo_de_livros/src/pages/add_book/add_book.dart';
import 'package:catalogo_de_livros/src/pages/book_content/book_content.dart';
import 'package:catalogo_de_livros/src/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookRepository = Provider.of<BookRepository>(context);
    final books = bookRepository.getAllBooks();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Catálogo de Livros'),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark_add),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddBook();
                }));
              },
            )
          ],
        ),
        body: FutureBuilder<List<Book>>(
            future: books,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar os livros.'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhum livro disponível.'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final book = snapshot.data![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookContent(book),
                              ),
                            );
                          },
                          child: CardBook(book: book));
                    });
              }
            }));
  }
}
