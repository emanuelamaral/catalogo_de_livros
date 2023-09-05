import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/login/login_page.dart';
import 'src/shared/provider/catalogue/book_list.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookList(), child: const MyApp()));
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
