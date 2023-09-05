import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Cadastro'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Senha'),
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
                  onPressed: () {},
                  child: const Text('Cadastrar',
                      style: TextStyle(fontSize: 18, color: Colors.white))),
            )
          ],
        ));
  }
}
