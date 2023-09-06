import 'package:catalogo_de_livros/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/user_repository.dart';
import '../register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    final userRepository = Provider.of<UserRepository>(context, listen: false);
    dynamic user = await userRepository.getUser(email, password);

    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Senha'),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                // border: Border.all(),
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
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterPage()));
              },
              child: const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
