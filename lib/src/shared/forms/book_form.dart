import 'package:flutter/material.dart';

class BookForm extends StatefulWidget {
  final Function(String, String, String, num) onSubmit;

  BookForm({required this.onSubmit});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final titleController = TextEditingController();
  final autorController = TextEditingController();
  final genreController = TextEditingController();
  final publicationYearController = TextEditingController();

  void _submitForm() {
    final title = titleController.text;
    final autor = titleController.text;
    final genre = genreController.text;
    final publicationYear = int.tryParse(publicationYearController.text) ?? 0.0;

    if (title.isEmpty ||
        autor.isEmpty ||
        genre.isEmpty ||
        publicationYear < 0) {
      return;
    }

    widget.onSubmit(title, autor, genre, publicationYear);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Titulo do livro'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: autorController,
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome do Autor'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: genreController,
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Gênero do livro'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: publicationYearController,
            onSubmitted: (_) => _submitForm(),
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Ano de Publicação'),
          ),
        ),
      ],
    );
  }
}
