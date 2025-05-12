## ----- BANCO DE DADOS -----

##Se necessário delete o banco de dados  :D
DROP DATABASE empreiteira;

##Criando banco de dados
CREATE DATABASE empreiteira;

##usando banco de dados
USE empreiteira;

##Mostrar todas as tabelas do banco de dados
SHOW TABLES;


## ----- !TABELAS! -----


## TABELA PESSOA

##Criando a tabela e adicionando atributos nela
CREATE TABLE pessoa (

id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf_cnpj VARCHAR(35) NOT NULL,
nomeFantasia VARCHAR(35) NOT NULL,
telefone VARCHAR(25) NOT NULL,
email VARCHAR(25) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A'

);



## TABELA EMPREITEIRA

##Criando a tabela e adicionando atributos nela
CREATE TABLE empreiteira (

id_empreiteira INT PRIMARY KEY AUTO_INCREMENT,
areaAtuacao VARCHAR(45) NOT NULL,
tipoContrato VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela endereco
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA COLABORADOR

##Criando a tabela e adicionando atributos nela
CREATE TABLE colaborador (

id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
salario DECIMAL (10,2) NOT NULL,
matricula VARCHAR(20) NOT NULL,
funcao VARCHAR(20) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A', 
id_pessoa INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela professor
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA PROJETO

##Criando a tabela e adicionando atributos nela
CREATE TABLE projeto (

id_projeto INT PRIMARY KEY AUTO_INCREMENT,
nomeProjeto VARCHAR(45) NOT NULL,
dataInicio DATETIME NOT NULL,
prazo DATE NOT NULL,
dataEntrega DATETIME NOT NULL,
valorProjeto DECIMAL(20,2) NOT NULL,
situacaoProjeto CHAR(1) NOT NULL DEFAULT 'A',
id_colaborador INT NOT NULL,
id_pessoa INT NOT NULL,

FOREIGN KEY(id_colaborador) REFERENCES colaborador(id_colaborador),
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA OBRA

##Criando a tabela e adicionando atributos nela
CREATE TABLE obra (

id_obra INT PRIMARY KEY AUTO_INCREMENT,
dataInicio DATETIME NOT NULL,
prazo DATE NOT NULL,
dataEntrega DATETIME NOT NULL,
valorObra DECIMAL(10,2) NOT NULL,
situacaoObra CHAR(1) NOT NULL,
id_empreiteira INT NOT NULL,
id_projeto INT NOT NULL,

FOREIGN KEY (id_empreiteira) REFERENCES empreiteira(id_empreiteira),
FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)

);



## TABELA CANTEIRO_OBRA

##Criando a tabela e adicionando atributos nela
CREATE TABLE canteiroObra (

id_canteiroObra INT PRIMARY KEY AUTO_INCREMENT,
id_obra INT,
id_colaborador INT,

FOREIGN KEY (id_obra) REFERENCES obra(id_obra),
FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador)

);


## ----- !VALORES! -----


## DADOS PESSOA

## Inserindo dados dentro dos atributos da tabela
INSERT INTO pessoa(nome, cpf_cnpj, nomeFantasia, telefone, email, situacao)

##Valores(dados)
VALUES('Rafael', '000.000.000-00', 'R', '(00) 0 0000-0000', 'Rafael@gmail.com', 'A'), 
('Gabriel', '111.111.111-11', 'G', '(11) 1 1111-1111', 'Gabriel@gmail.com', 'A'), 
('Mael', '222.222.222-22', 'M', '(22) 2 2222-2222', 'Mael@gmail.com', 'A'), 
('Miguel', '333.333.333-33', 'MI', '(33) 3 3333-3333', 'Miguel@gmail.com', 'A');

## Selecionando todos os atributos 
SELECT * FROM pessoa;



# DADOS EMPREITEIRA

## Inserindo dados dentro dos atributos da tabela 
INSERT INTO empreiteira(areaAtuacao, tipoContrato, situacao, id_pessoa)

##Valores(dados)
VALUES ('Construção Civil', 'CLT', 'A', '1'),
('Obras de Infraestrutura', 'CLT', 'A', '2');


## Seleciona todos os atributos 
SELECT * FROM  empreiteira;



# DADOS COLABORADOR

## Inserindo dados dentro dos atributos da tabela 
INSERT INTO colaborador(salario, matricula, funcao, situacao, id_pessoa)

##Valores(dados)
VALUES('1.00', '00123', 'Analista de RH', 'A', '3'),
('0.50', '00456', 'Técnico de Suporte', 'A', '4');

## Selecionando todos os atributos 
SELECT * FROM colaborador; 



# DADOS PROJETO

## Inserindo dados dentro dos atributos da tabela 
INSERT INTO projeto(nomeProjeto, dataInicio, prazo, dataEntrega, valorProjeto, situacaoProjeto, id_pessoa, id_colaborador)

##Valores(dados)
VALUES('Projeto', '2000-12-02 12:00:00', '2024-12-07', '2001-01-21 12:00:00', '0', 'A', '1', '1');

## Selecionando todos os atributos 
SELECT * FROM projeto; 



# DADOS OBRA

## Inserindo dados dentro dos atributos da tabela
INSERT INTO obra(dataInicio, prazo, dataEntrega, valorObra, situacaoObra, id_empreiteira, id_projeto) 

##Valores(dados)
VALUES('2020-12-07 12:00:00', '2015-07-30', '2020-01-22 12:00:00', '0', 'A', '1', '1');

## Seleciona todos os atributos 
SELECT * FROM obra;


# DADOS CANTEIRO_OBRA


## Inserindo dados dentro dos atributos da tabela 
INSERT INTO canteiroObra(id_obra, id_colaborador)

##Valores(dados)
VALUES('1', '1');

## Selecionando todos os atributos 
SELECT * FROM canteiroObra;


CREATE VIEW relatorioEmpreiteira AS

## Tabela da mais fraca até a mais forte
SELECT ps.id_pessoa, pj.id_projeto, clb.matricula, clb.salario, clb.funcao FROM projeto pj # pj id_projeto, id_colaborador
INNER JOIN colaborador clb ON clb.id_colaborador = pj.id_colaborador 
INNER JOIN pessoa ps ON ps.id_pessoa = pj.id_pessoa;

SELECT * FROM relatorioEmpreiteira
