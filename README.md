# Stranger Things APP

App que traz as princiapis informações da série Stranger Things da Netflix. Aplicativo foi produzido para fins didáticos como utilziação de APIs.

## 🔨 Funcionalidades do projeto
O app lista os videos, os personagens e as temporadas da série. Os dados são obtidos de três APIs diferentes ([API Youtube](https://developers.google.com/youtube/v3), [Api Stranger things](https://github.com/api-tutorial/stranger-things-api), [API TMDB](https://developers.themoviedb.org/3/getting-started)). O app dispõe plugins como [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter), [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter), [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) e [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar). Tudo isso organizado, facilmente personalizável e reaproveitável através da componentização

![videoST](https://user-images.githubusercontent.com/89111549/168503604-138077c2-698a-410d-9666-f47647fd67c4.gif)

## ✔️ Técnicas e tecnologias utilizadas
- `consumo de api`: leitura de dados vindos de um arquivo json.
- `componentização`: os componentes personalizados do projeto encontram-se na pasta "components".
- `plugins`: utilização de plugins para sanar necessidades do app

## 🛠️ Abrir e rodar o projeto

**Para executar este projeto você precisa:**

- Ter o [Flutter](https://flutter.dev/docs/get-started/install) instalado na sua máquina
- Ter algum editor de códigos ou IDE como o [Android Studio](https://developer.android.com/studio), [Intellij Idea](https://www.jetbrains.com/pt-br/idea/download/) ou [Visual Studio Code](https://code.visualstudio.com/docs/?dv=win). 

Caso opte por IDEs como as duas sugeridas acima, o processo de execução do aplicativo funcionará através de um botão de play na parte superior que ambas dispõem. Caso escolha rodar o projeto via linha de comandos, utilize o comando `flutter run`. Lembre-se de antes de executar o comando de navegar até a pasta do projeto antes. 

Para mais instruções sobre a configuração do ambiente, recomendamos a leitura do artigo [Flutter - Como configurar o ambiente de desenvolvimento](https://www.alura.com.br/artigos/flutter-como-configurar-o-ambiente-de-desenvolvimento).

## ⭐ Créditos

- Api Stranger Things: https://github.com/api-tutorial/stranger-things-api
- Api Youtube: https://developers.google.com/youtube/v3
- Template de readme: https://github.com/alura-cursos/flutter-nuvigator/blob/start/README.md
