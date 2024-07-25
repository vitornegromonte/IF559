SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


DROP TABLE IF EXISTS Livro_Pedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Cargo_Funcionario;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Fornecedor;


-- Tabela de Fornecedor
CREATE TABLE Fornecedor (
    cod_fornecedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    tipo VARCHAR(50) CHECK (tipo IN ('Editora', 'Cliente'))
);


-- Tabela de Livro
CREATE TABLE Livro (
    ISBN VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
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
    cod_cliente INT REFERENCES Cliente(cod_cliente),
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cod_funcionario INT REFERENCES Funcionario(cod_funcionario),
    preco_total DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50) CHECK (metodo_pagamento IN ('Cartão', 'Pix', 'Espécie'))
);


-- Tabela de Livro_Pedido
CREATE TABLE Livro_Pedido (
    ISBN VARCHAR(13) REFERENCES Livro(ISBN),
    num_pedido INTEGER REFERENCES Pedido(num_pedido),
    quantidade INTEGER,
    preco_item DECIMAL(10, 2),
    PRIMARY KEY (ISBN, num_pedido)
);

-- Insert sample Fornecedor
INSERT INTO Fornecedor (nome, endereco, telefone, email, tipo) VALUES
('Editora A', 'Rua A, 123', '123456789', 'editoraA@example.com', 'Editora'),
('Editora B', 'Rua B, 456', '987654321', 'editoraB@example.com', 'Editora'),
('Cliente C', 'Rua C, 789', '112233445', 'clienteC@example.com', 'Cliente');

-- Insert sample Livro
INSERT INTO Livro (ISBN, titulo, autor, ano_publicacao, preco, cod_fornecedor) VALUES
('9783161484100', 'Livro A', 'Autor A', 2020, 29.99, 1),
('9783161484101', 'Livro B', 'Autor B', 2021, 39.99, 2),
('9783161484102', 'Livro C', 'Autor C', 2022, 49.99, 3);

-- Insert sample Funcionario
INSERT INTO Funcionario (nome, CPF, endereco, telefone, email) VALUES
('Funcionário A', '12345678901', 'Rua A, 123', '123456789', 'funcionarioA@example.com'),
('Funcionário B', '23456789012', 'Rua B, 456', '234567890', 'funcionarioB@example.com'),
('Funcionário C', '34567890123', 'Rua C, 789', '345678901', 'funcionarioC@example.com');

-- Insert sample Cargo_Funcionario
INSERT INTO Cargo_Funcionario (cod_funcionario, cargo) VALUES
(1, 'Administração'),
(2, 'RH'),
(3, 'Gerência');

-- Insert sample Cliente
INSERT INTO Cliente (nome, CPF, email, telefone, endereco) VALUES
('Cliente A', '45678901234', 'clienteA@example.com', '456789012', 'Rua A, 123'),
('Cliente B', '56789012345', 'clienteB@example.com', '567890123', 'Rua B, 456'),
('Cliente C', '67890123456', 'clienteC@example.com', '678901234', 'Rua C, 789');

-- Insert sample Pedido
INSERT INTO Pedido (cod_cliente, preco_total, metodo_pagamento, cod_funcionario) VALUES
(1, 29.99, 'Cartão', 1),
(2, 39.99, 'Pix', 2),
(3, 49.99, 'Espécie', 3);

-- Insert sample Livro_Pedido
INSERT INTO Livro_Pedido (ISBN, num_pedido, quantidade, preco_item) VALUES
('9783161484100', 1, 1, 29.99),
('9783161484101', 2, 1, 39.99),
('9783161484102', 3, 1, 49.99);