import 'package:flutter/material.dart';

import '../models/book.dart';

class CardBook extends StatelessWidget {
  final Book book;

  CardBook({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(Icons.menu_book, size: 160),
          ListTile(
            title: Text(book.title),
            subtitle: Text(book.autor),
          ),
        ],
      ),
    );
  }
}
