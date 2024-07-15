# IF559 - Banco de dados (2024.1)
> Implementação do projeto físico da disciplina Banco de Dados (IF559)

## Sobre
A entrega é realizada em duas fases. Na primeira, consiste apenas um relatório descritivo sobre a aplicação com seu minimundo (descrição do cenário selecionado) e os diagramas conceituais e lógicos. Na segunda fase, pede-se a entrega do projeto lógico (criação dos scripts para criação e carregamento do banco de dados criado, além de uma lista de consultas obrigatórias descritas abaixo).

### Storytelling/Minimundo:
A livraria “Machado & Co” é uma loja física que vende uma vasta gama de livros de diferentes gêneros e autores, sobretudo, autores nacionais. Além disso, a livraria também dá aos clientes a possibilidade de vender seus próprios livros(usados, mas em boas condições), de forma que eles possam ser também um fornecedor . Para gerenciar suas operações, a livraria quer obter um sistema de gestão interna que abrange diversas áreas do fluxo da companhia, como o gerenciamento de estoque, pedidos, fornecedores e clientes.
Os livros são fornecidos pelas editoras e clientes da loja. São reconhecidos pelo ISBN(Padrão Internacional de Número do Livro), título, autor, ano de publicação, preço e código do fornecedor.
Os funcionários são identificados por um código, nome, cpf, endereço, telefone e email. Podem atuar como: Administração, RH e Gerência. Mas todos são aptos para atender os clientes.
O cliente, após a escolha do(s) livro(s), se dirige ao caixa e antes de efetivar a compra, lhe é perguntado se deseja realizar um cadastro na loja. Caso sim, alguns dados são necessários para cadastrar na base, como: nome completo, CPF, email, telefone e endereço. Caso não, a compra segue normalmente.
 Na compra é gerado um número do pedido e o(s) título(s) do(s) livro(s) e seu(s) respectivo(s) valor(es), como também a data da compra e o preço total. Assim, é escolhida a forma de pagamento sendo cartão, pix ou espécie.

## Requisitos do projeto físico

- [x] Criação do banco de dados
- [x] Carregamento do banco de dados
- [ ] Operações com notação de algebra relacional obrigatória
  - [x] selecionar todos os dados de uma tabela
  - [x] selecionar um subconjunto de atributos de uma tabela
  - [x] selecionar dados de uma tabela mediante alguma condição
  - [ ] realizar seleção de dados sem apresentar duplicadas
  - [ ] realizar consulta de seleção-projeção-junção
  - [ ] atribuir “apelidos”
  - [ ] aplicar união
  - [ ] aplicar interseção
  - [ ] aplicar diferença
  - [ ] aplicar produto cartesiano
  - [ ] realizar seleção sob condição que envolva outra seleção
  - [ ] consultar valores de atributos que iniciem por algum termo

- [ ] Operações independentes de notação de algebra relacional
  - [ ] ordenar resultados de consultas de forma ascendente
  - [ ] utilizar função de agregação
  - [ ] realizar agrupamento de resultado de consulta
  - [ ] criar regra apenas para consultas do banco criado
  - [ ] criar regra para execução de comandos DML e DQL
  - [ ] criar regra para execução de comandos DDL
  - [ ] criar usuário que possua a regra padrão para consulta (criada anteriormente) 
  - [ ] criar usuário que possua a regra padrão para comandos DML e DQL (criada anteriormente)
  - [ ] criar usuário que possua a regra padrão para comandos DDL (criada anteriormente)
  - [ ] criar uma transação única
  - [ ] criar uma view a partir de mais de uma tabela
  - [ ] criar uma regra para consulta apenas na visualização criada
  - [ ] criar usuário que possua a regra padrão para consulta da view (criadas anteriormente)