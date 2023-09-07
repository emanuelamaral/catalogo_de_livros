import 'package:catalogo_de_livros/src/repositories/book_repository.dart';
import 'package:catalogo_de_livros/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/login/login_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BookRepository()),
    ChangeNotifierProvider(create: (context) => UserRepository()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Login'),
    );
  }
}
