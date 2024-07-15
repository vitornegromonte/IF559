SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Fornecedor;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cargo_Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Livro_Pedido;

-- Tabela de Fornecedor
CREATE TABLE Fornecedor (
    cod_fornecedor SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100),
    tipo VARCHAR(50) CHECK (tipo IN ('Editora', 'Cliente'))
);

-- Tabela de Livro
CREATE TABLE Livro (
    ISBN VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(100),
    ano_publicacao INT,
    preco DECIMAL(10, 2),
    cod_fornecedor INTEGER REFERENCES Fornecedor(cod_fornecedor)
);

-- Tabela de Funcionario
CREATE TABLE Funcionario (
    cod_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(255)
);

-- Tabela de Cargo_Funcionario
CREATE TABLE Cargo_Funcionario (
    cod_funcionario INTEGER REFERENCES Funcionario(cod_funcionario),
    cargo VARCHAR(50) CHECK (cargo IN ('Administração', 'RH', 'Gerência')),
    PRIMARY KEY (cod_funcionario, cargo)
);

-- Tabela de Cliente
CREATE TABLE Cliente (
    cod_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(255),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

-- Tabela de Pedido
CREATE TABLE Pedido (
    num_pedido SERIAL PRIMARY KEY,
    data_compra DATE NOT NULL,
    cod_cliente INT REFERENCES Cliente(cod_cliente),
    cod_funcionario INT REFERENCES Funcionario(cod_funcionario),
    preco_total DECIMAL(10, 2),
    pagamento VARCHAR(50) CHECK (pagamento IN ('Cartão', 'Pix', 'Espécie'))
);

-- Tabela de Livro_Pedido
CREATE TABLE Livro_Pedido (
    ISBN VARCHAR(13) REFERENCES Livro(ISBN),
    num_pedido INTEGER REFERENCES Pedido(num_pedido),
    quantidade INTEGER,
    preco_item DECIMAL(10, 2),
    PRIMARY KEY (ISBN, num_pedido)
);


-- 1) Inserção de dados

-- Fornecedor
INSERT INTO Fornecedor (nome, telefone, email, tipo) VALUES ('Companhia das Letras', '11999999999', 'contato@companhiadasletras.com.br', 'Editora');
INSERT INTO Fornecedor (nome, telefone, email, tipo) VALUES ('Saraiva', '11988888888', 'contato@saraiva.com.br', 'Editora');
-- Fornecor pessoa física
INSERT INTO Fornecedor (nome, telefone, email, tipo) VALUES ('João Silva', '11977777777', 'joaosilva@gmail.com', 'Cliente');
INSERT INTO Fornecedor (nome, telefone, email, tipo) VALUES ('Maria Pereira', '11966666666', 'mariapereira.com', 'Cliente');

-- Livro
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES ('9788535928574', 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 20.00, 1);
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES ('9788535928575', 'Dom Casmurro', 'Machado de Assis', 1899, 25.00, 2);
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES ('9788535928576', 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 30.00, 4);
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES ('9788535928577', 'O Hobbit', 'J. R. R. Tolken', 1882, 35.00, 3);
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES ('9788535928578', 'O Senhor dos Anéis', 'J. R. R. Tolken', 1883, 40.00, 1);

-- Funcionario
INSERT INTO Funcionario (nome, CPF, endereco, telefone, email) VALUES ('João da Silva', '12345678901', 'Rua das Flores, 123', '11999999999', 'jds@livrariamachado.com.br');
INSERT INTO Funcionario (nome, CPF, endereco, telefone, email) VALUES ('Maria Pereira', '12345678902', 'Rua das Rosas, 456', '11988888888', 'mp@livrariamachado.com.br');
INSERT INTO Funcionario (nome, CPF, endereco, telefone, email) VALUES ('Joana Santos', '12345678903', 'Rua das Margaridas, 789', '11977777777', 'js1@@livrariamachado.com.br');

-- Cargo_Funcionario
INSERT INTO Cargo_Funcionario (cod_funcionario, cargo) VALUES (1, 'Administração');
INSERT INTO Cargo_Funcionario (cod_funcionario, cargo) VALUES (2, 'RH');
INSERT INTO Cargo_Funcionario (cod_funcionario, cargo) VALUES (3, 'Gerência');

-- Cliente
INSERT INTO Cliente (nome, CPF, email, telefone, endereco) VALUES ('Pedro Almeida', '12345678904', 'pedro.almeida@gmail.com', '81912345678', 'Av. Conde da Boa Vista');
INSERT INTO Cliente (nome, CPF, email, telefone, endereco) VALUES ('Maria Joana', '12345678905', 'mariajoana@gmail.com', '31924681014', 'Rua Miramar');
INSERT INTO Cliente (nome, CPF, email, telefone, endereco) VALUES ('Paula Dentro', '12345678906', 'paualdentro@gmail.com' '11912345678', 'Rua das Flores');

-- Pedido
INSERT INTO Pedido (data_compra, cod_cliente, cod_funcionario, preco_total, pagamento) VALUES ('2024-15-07', 1, 1, 20.00, 'Cartão');
INSERT INTO Pedido (data_compra, cod_cliente, cod_funcionario, preco_total, pagamento) VALUES ('2024-10-07', 2, 2, 25.00, 'Pix');
INSERT INTO Pedido (data_compra, cod_cliente, cod_funcionario, preco_total, pagamento) VALUES ('2024-20-07', 3, 3, 30.00, 'Espécie');

-- Livro_Pedido
INSERT INTO Livro_Pedido (ISBN, num_pedido, quantidade, preco_item) VALUES ('9788535928574', 1, 1, 20.00);
INSERT INTO Livro_Pedido (ISBN, num_pedido, quantidade, preco_item) VALUES ('9788535928575', 2, 1, 25.00);
INSERT INTO Livro_Pedido (ISBN, num_pedido, quantidade, preco_item) VALUES ('9788535928576', 3, 1, 30.00);


-- 2) Consultas SQL

-- 2.1) selecionar todos os dados de uma tabela
SELECT * FROM Livro;

-- 2.2) selecionar um subconjunto de atributos de uma tabela
SELECT ISBN, titulo FROM Livro;

-- 2.3) selecionar dados de uma tabela mediante alguma condição
SELECT * FROM Livro WHERE ano_publicacao > 1880;


