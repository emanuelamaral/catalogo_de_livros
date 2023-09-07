
# Catálogo de Livros Flutter App

Este é um aplicativo Flutter simples que permite aos usuários criar uma conta, fazer login e catalogar livros. Ele inclui recursos como autenticação de usuário e uma lista de livros que podem ser adicionados e visualizados.

## Sobre o trabalho

- Disciplina: OP63L-CC8 - Desenvolvimento de Aplicações para Dispositivos Móveis
- Turma: 2023/2 - 8° Período
- Professor: Everton Coimbra de Araújo

## Pré-requisitos

Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Se você ainda não o fez, siga as instruções na [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install) para a instalação.

## Como usar

Siga estas etapas para configurar e executar o aplicativo em sua máquina:

1. Clone este repositório para o seu ambiente local:

   ```
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   ```

2. Navegue até o diretório do projeto:

   ```
   cd nome-do-repositorio
   ```

3. Instale as dependências do projeto com o comando:

   ```
   flutter pub get
   ```

4. Execute o aplicativo em um emulador ou dispositivo físico:

   ```
   flutter run
   ```

O aplicativo agora deve ser iniciado no seu emulador ou dispositivo físico.

## Funcionalidades

- **Login e Registro de Usuário:** Os usuários podem fazer login em suas contas existentes ou criar novas contas.

- **Catalogação de Livros:** Os usuários podem adicionar informações sobre livros, como título, autor e descrição.

- **Lista de Livros:** Os livros catalogados são exibidos em uma lista na tela inicial.

- **Detalhes do Livro:** Ao tocar em um livro da lista, os usuários podem ver os detalhes completos do livro.

- **Adição de Livros:** Os usuários podem adicionar novos livros à lista.

## Estrutura do Projeto

- `lib/`: Contém todo o código-fonte do aplicativo.
  - `src/`: Contém as páginas e componentes específicos do aplicativo.
  - `models/`: Contém os modelos de dados, como o modelo de livro.
  - `repositories/`: Contém os repositórios de dados, como o repositório de livros e o repositório de usuários.

## Tecnologias Utilizadas

- Flutter
- Provider (gerenciamento de estado)
- Material Design

## Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter mais detalhes.
