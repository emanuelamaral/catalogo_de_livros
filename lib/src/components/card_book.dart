import 'package:flutter/material.dart';

import '../models/books.dart';

class CardBook extends StatelessWidget {
  final Book livros;

  CardBook({required this.livros});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(Icons.menu_book, size: 160),
          ListTile(
            title: Text(livros.title),
            subtitle: Text(livros.autor),
          ),
        ],
      ),
    );
  }
}
