# BibliaSagrada



Rendo graças ao meu Deus por conseguir fazer este simples projeto, o qual não é nada perante a Sua grandiosidade e generosidade.
----

- Este aplicativo baseia-se na versão Almeida Corrigida e Fiel da Bíblia Sagrada, conseguida através da api **https://bibleapi.co**. (Optei por utilizar dessa forma por ser basicamente um projeto para estudos, para assim treinar requisições GET e POST).

- O projeto foi desenvolvido em SwiftUI, utilizando para requisições http o *framework* **Alamofire** (https://github.com/Alamofire/Alamofire), e para persistência de dados o *Framework* Realm (https://github.com/realm/realm-cocoa).

- Para gerenciamento de dependências, foi usado Cocoapods (https://cocoapods.org/). Caso você queira rodar o projeto na sua máquina, será necessário fazer as seguintes etapas:
- 1) certifique-se de que você tem o Cocoapods instalado na sua máquina;
- 2) a partir do terminal, navegue até a pasta do projeto, e rode o comando *'pod init'* e em seguida *'pod install'*;
- 3) abra o arquivo *'BibliaSagrada.xcworkspace'*.

----
Este projeto apresenta 4 abas, a saber:
- **Antigo testamento**, com livros de Gênesis a Malaquias;
- **Novo testamento**, com livros de Mateus a Apocalipse;
- **Verso do dia**, o qual fornece ao usuário um verso cada vez que o app é aberto; e
- **Meus versos salvos**, que mostra uma lista dos versos salvos a partir dos testamentos ou do verso do dia (para salvar um verso em tais locais, basta clicar sobre o verso).

<p align="center">  
  <img src="https://github.com/AdrianoAntoniev/BibliaSagrada/blob/master/output.gif?raw=true" alt="App gif"/>
</p>

### Foi usado:
- Swift 5;
- Xcode 12.4





*E tudo quanto fizerdes, fazei-o de todo o coração, como ao Senhor, e não aos homens (Colossenses 3:23)*
