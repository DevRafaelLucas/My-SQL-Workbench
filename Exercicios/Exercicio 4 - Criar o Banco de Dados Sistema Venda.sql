## BANCO DE DADOS

## Criando banco de dados
CREATE DATABASE sistema_venda; 

## Acessando o banco de dados criado 
USE sistema_venda;

## Mostrando as tabelas
SHOW TABLES;

## ----- !TABELAS! -----



CREATE TABLE pessoa(

id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(20) NOT NULL,
telefone VARCHAR(20),
email VARCHAR(30),
situacao CHAR(1) NOT NULL DEFAULT 'A'

);

CREATE TABLE endereco(

id_endereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(20) NOT NULL,
bairro VARCHAR(20) NOT NULL,
cidade VARCHAR(20) NOT NULL,
uf CHAR(2) NOT NULL,
cep VARCHAR(15) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE vendedor(

id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
salario DECIMAL(10,2),
matricula VARCHAR(20) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE cliente (

id_cliente INT PRIMARY KEY AUTO_INCREMENT,
fidelidade VARCHAR(20),
desconto DECIMAL(10,2),
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE forma_pagamento (

id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(30) NOT NULL,
parcela INT,
prazo INT

);

CREATE TABLE venda (

id_venda INT PRIMARY KEY AUTO_INCREMENT,
data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
valor_total DECIMAL(10,2),
desconto DECIMAL(10,2),
acrescimo DECIMAL(10,2),
cupom INT NOT NULL,
id_vendedor INT NOT NULL,
id_cliente INT NOT NULL,
id_forma_pagamento INT,

FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor),
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY(id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)

);

CREATE TABLE produto (

id_produto INT PRIMARY KEY AUTO_INCREMENT,
denominacao VARCHAR(30) NOT NULL,
quantidade_estoque INT NOT NULL,
preco DECIMAL(10,2) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A'

);

CREATE TABLE itens_venda (

id_itens_venda INT PRIMARY KEY AUTO_INCREMENT,
desconto DECIMAL(10,2),
acrescimo DECIMAL(10,2),
quantidade INT NOT NULL,
preco DECIMAL(10,2) NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
cancelado CHAR(1) NOT NULL DEFAULT 'N',
id_venda INT NOT NULL,
id_produto INT NOT NULL,

FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
FOREIGN KEY (id_produto) REFERENCES produto(id_produto)

);



----- !DADOS! -----



INSERT INTO pessoa(nome, cpf, telefone, email)

VALUES('Rafael', '000.000.000-00', '(00) 0 0000-0000 ', 'Rafael@gmail.com'),
('Miguel', '111.111.111-11', '(11) 1 1111-1111', 'Miguel@gmail.com'),
('Gabriel', '222.222.222-22', '(22) 2 2222-2222', 'Gabriel@gmail.com'),
('Mael', '333.333.333-33', '(33) 3 3333-3333', 'Mael@gmail.com');

SELECT * FROM pessoa;


INSERT INTO endereco(cidade, rua, bairro, cep, uf, id_pessoa)

VALUES('São Paulo', 'Rua das flores', 'Vila Mariana', '00000-00', 'SP', '1'),
('Rio de Janeiro', 'Rua da bala perdida', 'Bairro do rio', '11111-11', 'RJ', '2'),
('Belo Horizonte', 'Rua horizonte', 'Vila belo', '22222-22', 'MG', '3'),
('Curitiba', 'Rua XV', 'Bairro Curitiba', '33333-33', 'PR', '4');

SELECT * FROM endereco;


INSERT INTO vendedor(salario, matricula, id_pessoa)

VALUES('1.00', 'VENDEDOR0101', '1'),
('1.00', 'VENDEDOR0202', '1');

SELECT * FROM vendedor;


INSERT INTO cliente(fidelidade, desconto, id_pessoa)

VALUES('1 ano', '20', '1'),
('5 ano', '100', '2');

SELECT * FROM cliente;


INSERT INTO forma_pagamento(descricao, parcela, prazo)

VALUES('Cartão', '12', '12'),
('Pix', '1', '0');

SELECT * FROM forma_pagamento;


INSERT INTO venda(data_compra, valor_total, desconto, acrescimo, cupom, id_vendedor, id_cliente, id_forma_pagamento)

VALUES('2020-03-12', '2000.00', '10', '0', '76', '2', '1', '2'),
('2020-03-12', '200.00', '10', '12', '76', '1', '2', '1');

SELECT * FROM venda;


INSERT INTO produto(denominacao, quantidade_estoque, preco)

VALUES('Microsoft', '1', '12.00');

SELECT * FROM produto;


INSERT INTO itens_venda(desconto, acrescimo, quantidade, preco, valor_total, id_venda, id_produto)

VALUES('0', '0', '10', '1.00', '1000', '1', '1');

SELECT * FROM itens_venda;
