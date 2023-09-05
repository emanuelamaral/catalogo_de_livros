import 'package:catalogo_de_livros/src/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/forms/book_form.dart';
import '../../shared/provider/catalogue/book_list.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  Book? book;

  _addBook(title, String autor, String genre, num publicationYear) {
    final newBook = Book(
        title: title,
        autor: autor,
        genre: genre,
        publicationYear: publicationYear);

    setState(() {
      book = newBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Novo Livro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BookForm(onSubmit: _addBook),
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
                onPressed: () {
                  final bookList = context.read<BookList>();

                  if (book != null) {
                    bookList.addBook(book!);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Cadastrar Livro',
                    style: TextStyle(fontSize: 18, color: Colors.white))),
          )
        ],
      ),
    );
  }
}
