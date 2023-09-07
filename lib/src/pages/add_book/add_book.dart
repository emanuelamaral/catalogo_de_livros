import 'package:catalogo_de_livros/src/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  // Book? book;

  // _addBook(title, String autor, String genre, num publicationYear) {
  //   final newBook = Book(
  //       title: title,
  //       autor: autor,
  //       genre: genre,
  //       publicationYear: publicationYear);

  //   setState(() {
  //     book = newBook;
  //   });
  // }

  final titleController = TextEditingController();
  final autorController = TextEditingController();
  final genreController = TextEditingController();
  final publicationYearController = TextEditingController();

  void _submitForm(BuildContext context) async {
    final title = titleController.text;
    final autor = autorController.text;
    final genre = genreController.text;
    final publicationYear = int.tryParse(publicationYearController.text) ?? 0.0;

    if (title.isEmpty ||
        autor.isEmpty ||
        genre.isEmpty ||
        publicationYear < 0) {
      return;
    }

    final bookRepository = Provider.of<BookRepository>(context, listen: false);
    dynamic bookId =
        await bookRepository.addBook(title, autor, genre, publicationYear);

    if (bookId != null) {
      print('Livro Cadastrado');
      Navigator.of(context).pop();
    }
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: titleController,
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Titulo do livro'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: autorController,
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nome do Autor'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: genreController,
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gênero do livro'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: publicationYearController,
                  onSubmitted: (_) => _submitForm,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ano de Publicação'),
                ),
              ),
            ],
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
                child: const Text('Cadastrar Livro',
                    style: TextStyle(fontSize: 18, color: Colors.white))),
          )
        ],
      ),
    );
  }
}
