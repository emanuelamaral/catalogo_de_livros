import 'package:catalogo_de_livros/src/components/card_livro.dart';
import 'package:catalogo_de_livros/src/models/livros.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Catálogo de Livros'),
      ),
      body: ListView.builder(
          itemCount: catalogoDeLivros.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ConteudoLivro(),
                  //   )
                  // )
                },
                child: CardLivro(livros: catalogoDeLivros[index]));
          }),
    );
  }
}

List<Livro> catalogoDeLivros = [
  Livro(
    titulo:
        'Desenvolvedora de jogos polêmicos libera pirataria de seus games; entenda',
    autor:
        'A desenvolvedora do polêmico jogo Postal publicou nas redes sociais que os gamers estão liberados para piratear seus jogos.',
    genero: 'https://tm.ibxk.com.br/2023/08/14/14143927728256.jpg?ims=704x264',
    anoDePublicacao: 2000,
  ),
  Livro(
      titulo: "Baldur's Gate 3: entenda a origem do nome do jogo",
      autor:
          "Baldur's Gate 3 foi lançado dia 3 de agosto e está recebendo uma enxurrada de elogios, inclusive sendo um forte candidato a jogo do ano.",
      genero:
          'https://tm.ibxk.com.br/2023/08/15/15181341512388.jpg?ims=704x264',
      anoDePublicacao: 2000),
  Livro(
      titulo:
          'Modern Warfare 3 traz de volta o minimapa clássico de Call of Duty',
      autor:
          'As mudanças para o multijogador de Modern Warfare 3 que agradam ao público continuam chegando.',
      genero:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.wccftech.com%2Fwp-content%2Fuploads%2F2020%2F04%2Fcall-of-duty-MW3-remastered.jpg&f=1&nofb=1&ipt=709dcc6d6c1867f0e2f3b1d3998c611bd40fd04064faf481dd549dea2a010396&ipo=images',
      anoDePublicacao: 2000),
  Livro(
      titulo:
          "Jogadores de Diablo 4 estão usando masmorra apelidada de 'túneis de dopamina' para subir 40 níveis em 2 horas",
      autor:
          'Os jogadores de Diablo 4 estão explorando a fundo uma masmorra tão cheia de monstros que permite que eles ganhem 40 níveis em apenas duas horas.',
      genero:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F4078681.jpg&f=1&nofb=1&ipt=3ea2c6fd51aa54876da56f46ff6f9cb057969ff45257151d3f5ac6e7d4617bb9&ipo=images',
      anoDePublicacao: 2000)
];
