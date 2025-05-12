##-----BANCO DE DADOS-----

##Criando banco de dados
CREATE DATABASE consultaMedica;

##Selecionando a DataBase
USE consultaMedica;

##Mostrando tabelas de "consultaMedica"
SHOW TABLES;




##----- TABELA PESSOA -----

##Criando tabela "pessoa"
CREATE TABLE pessoa (

id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(15) NOT NULL,
email VARCHAR(45),
telefone VARCHAR(35) NOT NULL,
dataNascimento DATE NOT NULL

);

##Selecionando todos os atributos da tabela "pessoa"
SELECT * FROM pessoa;


##----- TABELA MEDICO -----

##Criando tabela "medico"
CREATE TABLE medico (

id_medico INT PRIMARY KEY AUTO_INCREMENT,
salario VARCHAR(15) NOT NULL,
crm VARCHAR(15) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

##Selecionando todos os atributos da tabela "medico"
SELECT * FROM medico;



##----- TABELA PACIENTE -----

##Criando tabela "paciente"
CREATE TABLE paciente (

id_paciente INT PRIMARY KEY AUTO_INCREMENT,
planoSaude VARCHAR(45) NOT NULL,
codigoCarteirinha VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

##Selecionando todos os atributos da tabela "paciente"
SELECT * FROM paciente;




##----- TABELA CONSULTA -----

##Criando tabela "consulta"
CREATE TABLE consulta (

id_consulta INT PRIMARY KEY AUTO_INCREMENT,
dataRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
dataConsulta DATETIME NOT NULL,
statusConsulta VARCHAR(25) NOT NULL DEFAULT 'A',
dataConclusao DATE,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
FOREIGN KEY (id_medico) REFERENCES medico(id_medico)

);

SELECT * FROM consulta;



##----- DADOS ------

##DADOS DOS ATRIBUTOS DA TABELA PESSOA

##seleciona todos os atributos da tabela "pessoa"
SELECT * FROM pessoa;

##Inserindo valores dentro dos atributos da tabela "pessoa"
INSERT INTO pessoa(nome, cpf, email, telefone, dataNascimento)

##valores
VALUES('Rafael', '000.000.000-00', 'Rafael@gmail.com', '91111-1111', '2000-07-20'),
('Lucas', '111.111.111-11', 'Lucas@gmail.com', '92222-2222', '2000-06-10'),
('Miguel', '222.222,222-22', 'Miguel@gmail.com', '93333-3333', '2001-11-27'),
('Pedro', '333.333.333-33', 'Pedro@gmail.com', '94444-4444', '2000-01-07');



##DADOS DOS ATRIBUTOS DA TABELA MEDICO

##seleciona todos os atributos da tabela "medico"
SELECT * FROM medico;

##Inserindo valores dentro dos atributos da tabela "medico"
INSERT INTO medico(salario, crm, especialidade, situacao, id_pessoa)

##Valores
VALUES('33.000', 'CRM1111', 'Cardiologista', 'A', '1'),
('33.000', 'CRM1211', 'Cirurgião Geral', 'A', '2');




##DADOS DOS ATRIBUTOS DA TABELA PACIENTE

##seleciona todos os atributos da tabela "paciente"
SELECT * FROM paciente;

##Inserindo valores dentro dos atributos da tabela "paciente"
INSERT INTO paciente(planoSaude, codigoCarteirinha, situacao, id_pessoa)

##Valores
VALUES('Bradesco Saude', 'BS0101', 'A', '3'),
('Caixa ecônomica', 'CE7878', 'A', '4');




##DADOS DOS ATRIBUTOS DA TABELA MEDICO

##seleciona todos os atributos da tabela "consulta"
SELECT * FROM consulta;

##Inserindo valores dentro dos atributos da tabela "medico"
INSERT INTO consulta(DataConsulta, id_paciente, id_medico)

##Valores
VALUES('2025-12-07', '3', '1'),
('2025-12-07', '4', '2');