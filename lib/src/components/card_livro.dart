import 'package:flutter/material.dart';

import '../models/livros.dart';

class CardLivro extends StatelessWidget {
  final Livro livros;

  CardLivro({required this.livros});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network(livros.genero),
          ListTile(
            title: Text(livros.titulo),
            subtitle: Text(livros.autor),
          ),
        ],
      ),
    );
  }
}
