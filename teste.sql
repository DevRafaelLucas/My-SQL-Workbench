##-----BANCO DE DADOS-----

##Criando o banco de dados "consulta_medica".
CREATE DATABASE consultaMedica; 

##Usando banco de dados da "consulta_médica".
USE consultaMedica; 

## Mostrar todas as tabelas do banco de dados conectado
SHOW TABLES; 




##-----TABELA PESSOA-----

#Criando a tabela "pessoa" e adicionando atributos nela
CREATE TABLE pessoa(

id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(15) NOT NULL,
email VARCHAR(45),
dataNascimento DATE NOT NULL,
telefone VARCHAR(20),
situacao CHAR(1) NOT NULL DEFAULT 'A'

);

##Seleciona todos os atributos de "pessoa".
SELECT * FROM pessoa; 




##-----TABELA MEDICO-----

##Criando tabela "medico" e adicionando atributos nela
CREATE TABLE medico(

id_medico INT PRIMARY KEY AUTO_INCREMENT,
salario DECIMAL(10,2),
crm VARCHAR(15) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa) ##Usa o atributo "id_pessoa" da tabela "medico" como referencia do atributo "id_pessoa" da tabela "pessoa"

);

##Seleciona todos os atributos de "medico".
SELECT * FROM medico;




##-----TABELA PACIENTE-----

##Criando tabela "paciente" e adicionando atributos nela
CREATE TABLE paciente(

id_paciente INT PRIMARY KEY AUTO_INCREMENT,
planoSaude VARCHAR(25),
codigoCarteirinha VARCHAR(25),
situacao CHAR(1) NOT NULL DEFAULT 'A',
id_pessoa INT,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)

);

##Seleciona todos os atributos de "paciente".
SELECT * FROM paciente;



##-----TABELA CONSULTA-----

##Criando tabela "consulta" e adicionando atributos nela
CREATE TABLE consulta(

id_consulta INT PRIMARY KEY AUTO_INCREMENT,
dataRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
dataConsulta DATETIME NOT NULL,
statusConsulta VARCHAR(25) NOT NULL DEFAULT 'agendado',
dataConclusao DATETIME,
id_medico INT NOT NULL,
id_paciente INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)

);

SELECT * FROM consulta; 



----- ##ADICIONANDO VALOR NO ATRIBUTO DA TABELA PESSOA-----

##Seleciona todos os atributos de "pessoa".
SELECT * FROM pessoa;

##Inserindo dentro dos atributos os valores(dados)
INSERT INTO pessoa(nome, cpf, email, dataNascimento, telefone)

#valores(dados)
VALUES('Marcos', '123456789', 'marcos@gmail.com', '1998-01-15', '(61) 0 0000-0000'),
('Andreia', '123456789', 'andreia@gmail.com', '1898-06-16','(11)11111-1111'),
('Bruno','987654321', 'Bruno@gmail.com', '1978-03-22', '(78)99999-9999'),
('Robert', '987654321', 'Robert@gmail.com', '1956-08-02', '(32) 3 3333-3333'),
('Maria', '123498765', 'Maria@gmail.com', '1939-09-12', '(18) 9 9999-9999');



----- ##ADICIONANDO VALOR NO ATRIBUTO DA TABELA MEDICO-----

##Seleciona todos os atributos de "medico".
SELECT * FROM medico;

##Inserindo dentro dos atributos os valores(dados)
INSERT INTO medico(salario, crm, especialidade, id_pessoa)

#valores(dados)
VALUES('30000.59', 'CRM9090', 'Cirurgião Geral', 1),
('30000.59', 'CRM6565', 'Clinico Geral', '2'),
('30000.59', 'CRM2121', 'Cardiologista', '3'),
('30000.59', 'CRM3232', 'Assistente Clinico', '4'),
('30000.59', 'CRM7667', 'Cirurgião Particular', '5');



----- ##ADICIONANDO VALOR NO ATRIBUTO DA TABELA PACIENTE-----

##Seleciona todos os atributos de "paciente".
SELECT * FROM paciente;

##Inserindo dentro dos atributos os valores(dados)
INSERT INTO paciente(planoSaude, codigoCarteirinha, id_pessoa)

#valores(dados)
VALUES('Bradesco Saude', 'BS5372321', 3),
('Caixa Saude', 'CS8945212', 4),
(NULL, NULL, 5);



----- ##ADICIONANDO VALOR NO ATRIBUTO DA TABELA PACIENTE-----

##Seleciona todos os atributos de "consulta".
SELECT * FROM consulta;

##Inserindo dentro dos atributos os valores(dados)
INSERT INTO consulta(dataConsulta, id_medico, id_paciente)

#valores(dados)
VALUES('2025-04-21 11:00', '1', '1'),
('2025-04-21 11:00', '2', '2');

SELECT * FROM medico;
SELECT * FROM paciente;
SELECT * FROM pessoa;


