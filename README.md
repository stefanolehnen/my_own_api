Purchase Details App
Este é um aplicativo Flutter que permite buscar e exibir detalhes de compras a partir de uma URL fornecida. O aplicativo faz uma requisição para um serviço backend em Python, que realiza o web scraping da URL e retorna os detalhes da compra em formato JSON. Esses detalhes incluem informações sobre a loja, método de pagamento, data da compra, e uma lista de produtos adquiridos.

Funcionalidades
Campo de entrada para a URL da compra.
Requisição para um serviço Python que faz scraping e retorna detalhes da compra.
Exibição dos detalhes da compra: nome da loja, data/hora da compra, método de pagamento, e total de itens comprados.
Exibição de uma lista detalhada dos produtos adquiridos, incluindo nome, código, quantidade, unidade, preço unitário e preço total.
Arquitetura
O projeto segue o padrão de arquitetura MVC (Model-View-Controller), dividindo a lógica do aplicativo em três partes:

Model: Representa os dados do aplicativo, como os detalhes da compra e os produtos.
View: A interface do usuário, que exibe as informações de compra e produtos.
Controller: Faz a ligação entre a View e o Model, além de gerenciar as requisições para o serviço backend.
Estrutura do Código
Models
shopping_details.dart
Este arquivo contém a classe ShoppingDetails, que representa as informações gerais sobre a compra, como o nome da loja, data/hora da compra, número total de itens e o método de pagamento.

product.dart
Este arquivo contém a classe Product, que representa cada produto da lista de compras. Ela inclui informações como o nome, código, quantidade, unidade, preço unitário e preço total do produto.

Controller
purchase_controller.dart
Este arquivo contém a classe PurchaseController, que faz a requisição HTTP para o backend Python utilizando a biblioteca http. A função fetchPurchaseDetails envia a URL da compra e recebe os detalhes da compra e produtos em formato JSON, que são convertidos para objetos das classes ShoppingDetails e Product.

View
purchase_details.dart
Este arquivo contém o widget PurchaseDetails, que representa a interface do usuário. Ele exibe um campo de entrada de texto para a URL, um botão para buscar os detalhes da compra, e exibe as informações da compra e a lista de produtos de maneira dinâmica.

Requisitos
Flutter: Certifique-se de ter o Flutter instalado em sua máquina. Você pode instalar o Flutter seguindo as instruções aqui.
Backend Python: O aplicativo depende de um backend Python que faz web scraping de uma página HTML para retornar os dados da compra em JSON. O backend deve estar rodando localmente em http://127.0.0.1:5000/api/scrape_purchase.
Como Rodar o Projeto
Clone este repositório:

bash
Copiar código
git clone https://github.com/seu-usuario/nome-do-repositorio.git
No terminal, navegue até o diretório do projeto e instale as dependências:

bash
Copiar código
flutter pub get
Certifique-se de que o backend Python está rodando localmente. Para isso, siga as instruções do seu serviço de web scraping em Python.

Inicie o aplicativo no emulador ou dispositivo conectado:

bash
Copiar código
flutter run
Insira a URL da compra no campo de texto e clique em "Fetch Purchase Details" para visualizar as informações na tela.

Estrutura do Backend
O backend está implementado em Python usando Flask. Ele recebe uma URL de nota fiscal eletrônica (NFe), faz o scraping da página e retorna um JSON com os detalhes da compra e dos produtos.

Aqui está um exemplo de como o JSON retornado pelo backend pode se parecer:

json
Copiar código
{
  "shopping_details": {
    "company_name": "UNIDASUL DISTRIBUIDORA ALIMENTICIA S/A",
    "datetime_purchase": "2024-09-17T13:45:00",
    "payment_method": "Cartão de Crédito"
  },
  "products": [
    {
      "code": 33480,
      "name": "PAO FRANCES kg",
      "quantity": 0.45,
      "unit": "KG",
      "unit_price": 12.9,
      "total_price": 5.80
    },
    {
      "code": 80019,
      "name": "DONUTS PINK kg",
      "quantity": 0.064,
      "unit": "KG",
      "unit_price": 42.9,
      "total_price": 2.75
    }
    // outros produtos...
  ]
}
Contribuição
Se você deseja contribuir com este projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request. Qualquer feedback é bem-vindo!

Licença
Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.

