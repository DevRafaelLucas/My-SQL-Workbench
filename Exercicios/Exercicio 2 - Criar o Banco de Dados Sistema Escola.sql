## ----- BANCO DE DADOS -----

##Criando banco de dados
CREATE DATABASE sistemaEscolar;

##usando banco de dados
USE sistemaEscolar;

##Mostrar todas as tabelas do banco de dados
SHOW TABLES;


## ----- !TABELAS! -----


## TABELA PESSOA

##Criando a tabela "pessoa" e adicionando atributos nela
CREATE TABLE pessoa (

id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(35) NOT NULL,
idade INT NOT NULL, 
situacao CHAR(1) NOT NULL DEFAULT 'A'

);



## TABELA ENDEREÇO

##Criando a tabela "endereço" e adicionando atributos nela
CREATE TABLE endereco (

id_endereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(45) NOT NULL,
rua VARCHAR(45) NOT NULL,
bairro VARCHAR(45) NOT NULL,
cep VARCHAR(35) NOT NULL,
uf CHAR(2) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela endereco
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA PROFESSOR

##Criando a tabela "endereço" e adicionando atributos nela
CREATE TABLE professor (

id_professor INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(20) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela professor
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA ALUNO

##Criando a tabela 'endereço' e adicionando atributos nela
CREATE TABLE aluno (

id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(20) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela aluno
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);



## TABELA CURSO

##Criando a tabela 'curso' e adicionando atributos nela
CREATE TABLE curso (

id_curso INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45),
cargaHoraria TIME NOT NULL,
dataInicio DATE NOT NULL,
dataFim DATE NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A'

);



## TABELA TURMA

##Criando a tabela 'turma' e adicionando atributos nela
CREATE TABLE turma (

id_turma INT PRIMARY KEY AUTO_INCREMENT,
numeroSala INT NOT NULL,
capacidade FLOAT NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_curso INT NOT NULL,
id_professor INT NOT NULL,
id_aluno INT NOT NULL,

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela curso
FOREIGN KEY (id_curso) REFERENCES  curso(id_curso),

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela professor
FOREIGN KEY (id_professor) REFERENCES  professor(id_professor),

##Referenciando 'id_pesssoa' da tabela pessoa no 'id_pesssoa' da tabela aluno
FOREIGN KEY (id_aluno) REFERENCES  aluno(id_aluno)

);


## ----- !VALORES! -----


## DADOS DA TABELA PESSOA

## Inserindo dados dentro dos atributos da tabela 'pessoa'
INSERT INTO pessoa(nome, cpf, idade, situacao, id_pessoa)

##Valores(dados)
VALUES('Rafael', '000.000.000-00', '22', 'A', '1'),
('Gabriel', '111.111.111-11', '18', 'A', '2'),
('Joâo', '222.222.222-22', '25', 'A', '3'),
('Herminio', '333.333.333-22', '28', 'A', '4'),
('Victor', '444.444.444-44', '17', 'A', '5'),
('Bruno', '555.555.555-55', '18', 'A', '6');

## Seleciona todos os atributos de 'pessoa'
SELECT * FROM pessoa;



# DADOS DA TABELA ENDERECO

## Inserindo dados dentro dos atributos da tabela 'endereco'
INSERT INTO endereco(cidade, rua, bairro, cep, uf, situacao, id_pessoa)

##Valores(dados)
VALUES('São Paulo', 'Rua das Flores', 'Jardim das Acácias', '01234-567', 'SP', 'A', '1'),
('Rio de Janeiro', 'Rua da bala perdida', 'Copacabana', '22021-001', 'RJ', 'A', '2'),
('Belo Horizonte', 'Rua da Bahia', 'Funcionários', '30160-010', 'MG', 'A', '3'),
('Curitiba', 'Rua XV de Novembro', 'Centro', '80020-310', 'PR', 'A', '4'),
('Salvador', 'Rua das Palmeiras', 'Pituba', '41810-000', 'BA', 'A', '5'),
('Porto Alegre', 'Avenida Ipiranga', 'Jardim Botânico', '48510-221', 'RS', 'A', '6');

## Seleciona todos os atributos de 'endereco'
SELECT * FROM endereco;



# DADOS DA TABELA PROFESSOR

## Inserindo dados dentro dos atributos da tabela 'professor'
INSERT INTO professor(matricula, situacao, id_pessoa)

##Valores(dados)
VALUES('PROFESSOR2244', 'A', 1),
('PROFESSORA1234', 'A', 2);


## Seleciona todos os atributos de 'professor'
SELECT * FROM professor;



# DADOS DA TABELA ALUNO

## Inserindo dados dentro dos atributos da tabela 'aluno'
INSERT INTO aluno(matricula, situacao, id_pessoa)

##Valores(dados)
VALUES('ALUNO0010', 'A', 3),
('ALUNO2673', 'A', 4);

## Seleciona todos os atributos de 'aluno'
SELECT * FROM aluno;



# DADOS DA TABELA CURSO

## Inserindo dados dentro dos atributos da tabela 'curso'
INSERT INTO curso(descricao, cargaHoraria, dataInicio, dataFim, situacao)

##Valores(dados)
VALUES('Analise e Desenvolvimento de Sistemas', '4:00', '2022-12-03', '2023-11-16', 'A'),
('Analise e Desenvolvimento de Sistemas', '8:00', '2022-02-12', '2023-11-27', 'A'),
('Analise e Desenvolvimento de Sistemas', '4:00', '2022-12-23', '2023-11-16', 'A');


## Seleciona todos os atributos de 'curso'
SELECT * FROM curso;



# DADOS DA TABELA TURMA

## Inserindo dados dentro dos atributos da tabela 'turma'
INSERT INTO turma(numeroSala, capacidade, situacao, id_curso, id_professor, id_aluno)

##Valores(dados)
VALUES('22', '40', 'A', '2', '1', '1'),
('37', '40', 'A', '1', '2' , '2'),
('54', '40', 'A', '2', '1' , '1');

## Seleciona todos os atributos de 'turma'
SELECT * FROM turma;







