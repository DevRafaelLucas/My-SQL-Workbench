DROP DATABASE vendas;
CREATE DATABASE vendas;

USE vendas;

SHOW TABLES;



----- !TABELAS! -----

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

CREATE TABLE historico_preco(

	id_historico_preco INT PRIMARY KEY AUTO_INCREMENT,
	data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
	preco_antigo DECIMAL (10,2),
	preco_novo DECIMAL (10,2),
	id_produto INT,
	FOREIGN KEY (id_produto) REFERENCES produto(id_produto)

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



----- !TRIGGER! -----



DELIMITER //
CREATE TRIGGER auditoria_preco ## Pode colocar qualquer nome
AFTER UPDATE 
ON produto FOR EACH ROW 
BEGIN
	IF(OLD.preco <> NEW.preco) THEN
		INSERT INTO historico_preco
		VALUES(OLD.preco, NEW.preco, id_produto);
	END IF;
END //



----- !DADOS! -----



INSERT INTO pessoa(nome, cpf, telefone, email)

VALUES('Rafael', '000.000.000-00', '(00) 0 0000-0000 ', 'Rafael@gmail.com'),
('Miguel', '111.111.111-11', '(11) 1 1111-1111', 'Miguel@gmail.com'),
('Gabriel', '222.222.222-22', '(22) 2 2222-2222', 'Gabriel@gmail.com'),
('Mael', '333.333.333-33', '(33) 3 3333-3333', 'Mael@gmail.com'),
('João Silva', '123.456.789-00', '(11) 91234-5678', 'joao.silva@email.com'),
('Maria Oliveira', '987.654.321-00', '(21) 99876-5432', 'maria.oliveira@email.com'),
('Carlos Souza', '456.789.123-00', '(31) 92345-6789', 'carlos.souza@email.com'),
('Lucas Pereira', '321.654.987-00', '(41) 98765-4321', 'lucas.pereira@email.com'),
('Fernanda Costa', '789.123.456-00', '(51) 91324-7654', 'fernanda.costa@email.com'),
('Ricardo Lima', '654.987.321-00', '(61) 92543-8765', 'ricardo.lima@email.com');

SELECT * FROM pessoa;


INSERT INTO endereco(cidade, rua, bairro, cep, uf, id_pessoa)

VALUES('São Paulo', 'Rua das flores', 'Vila Mariana', '00000-00', 'SP', '1'),
('Rio de Janeiro', 'Rua da bala perdida', 'Bairro do rio', '11111-11', 'RJ', '2'),
('Belo Horizonte', 'Rua horizonte', 'Vila belo', '22222-22', 'MG', '3'),
('Curitiba', 'Rua XV', 'Bairro Curitiba', '33333-33', 'PR', '4');

SELECT * FROM endereco;


INSERT INTO vendedor(salario, matricula, id_pessoa)

VALUES(2500.00, 'M12345', 1),
(3500.50, 'M12346', 2);
##(4200.75, 'M12347', 3),
##(2800.30, 'M12348', 4),
##(3100.20, 'M12349', 5);

SELECT * FROM vendedor;


INSERT INTO cliente(fidelidade, desconto, id_pessoa)

VALUES(3, 5.0, 6),
(2, 10.0, 7),
(1, 3.5, 8),
(4, 7.5, 9),
(5, 15.0, 10);

SELECT * FROM cliente;


INSERT INTO forma_pagamento(descricao, parcela, prazo)

VALUES('Cartão Credito', '12', '12'),
('Cartão Debito', '12', '12'),
('Pix', '0', '0'),
('Dinheiro','0','0');

SELECT * FROM forma_pagamento;


INSERT INTO venda(data_compra, valor_total, desconto, acrescimo, cupom, id_vendedor, id_cliente, id_forma_pagamento)

VALUES
('2025-05-10', 150.75, 10.0, 5.0, 2025, 1, 2, 1),
('2025-05-12', 230.50, 05.0, 10.0, 5, 2, 3, 1);
##('2025-05-13', 99.99, 0, 7.5, 10, 2, 4, 3),
##('2025-05-14', 450.00, 20.0, 15.0, 20, 1, 2, 2),
##('2025-05-15', 320.00, 10.0, 0, 10, 2, 2, 4);

SELECT * FROM venda;


INSERT INTO produto(denominacao, quantidade_estoque, preco)

VALUES('Arroz 5kg', 200, 24.90),
('Feijão Carioca 1kg', 150, 8.90),
('Açúcar 1kg', 180, 4.50),
('Óleo de Soja 900ml', 100, 6.99),
('Macarrão Espaguete 500g', 250, 3.20),
('Leite UHT 1L', 300, 3.70),
('Cerveja Lata 350ml', 90, 2.50),
('Maionese 500g', 70, 5.80),
('Sabão em Pó 1kg', 130, 9.40),
('Detergente 500ml', 220, 1.99);

SELECT * FROM produto;


INSERT INTO itens_venda(desconto, acrescimo, quantidade, preco, valor_total, id_venda, id_produto)

VALUES('7.46', '0', '5', (SELECT preco FROM produto WHERE id_produto = 5), ((quantidade*preco)-desconto + acrescimo), 2, 5),
('12.24', '10.00', '10', (SELECT preco FROM produto WHERE id_produto = 3), ((quantidade*preco)-desconto + acrescimo), 5, 3),
('13.22', '12.00', '7', (SELECT preco FROM produto WHERE id_produto = 4), ((quantidade*preco)-desconto + acrescimo), 3, 4),
('16.59', '12.00', '10', (SELECT preco FROM produto WHERE id_produto = 3), ((quantidade*preco)-desconto + acrescimo), 4, 3),
('17.18', '10.00', '4', (SELECT preco FROM produto WHERE id_produto = 1), ((quantidade*preco)-desconto + acrescimo), 1, 1);

SELECT * FROM itens_venda;



## ----- !RELATORIO! -----



SELECT v.id_vendedor, c.id_cliente, ve.data_compra, p.denominacao, iv.quantidade, iv.preco, iv.valor_total, p.quantidade_estoque  FROM itens_venda iv

INNER JOIN produto p ON p.id_produto = iv.id_produto
INNER JOIN venda ve ON ve.id_venda = iv.id_venda
INNER JOIN vendedor v ON v.id_vendedor = ve.id_vendedor
INNER JOIN cliente c ON c.id_cliente = ve.id_cliente