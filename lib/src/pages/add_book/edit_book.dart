import 'package:flutter/material.dart';

class EditBook extends StatelessWidget {
  const EditBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Titulo do livro'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome do Autor'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Gênero do livro'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Ano de Publicação'),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8.0),
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
                Navigator.of(context).pop();
              },
              child: const Text('Editar Livro',
                  style: TextStyle(fontSize: 18, color: Colors.white))),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Remover Livro"))
      ],
    ));
  }
}
