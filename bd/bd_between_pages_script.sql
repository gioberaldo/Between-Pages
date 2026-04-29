CREATE DATABASE bd_between_pages;
USE bd_between_pages;

CREATE TABLE Cadastro (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
cpf CHAR(11),
senha VARCHAR(20)
);

DROP TABLE LivrosLidos;
DROP TABLE Cadastro;

CREATE TABLE LivrosLidos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fk_usuario INT,
CONSTRAINT chFkUsuario
FOREIGN KEY (fk_usuario) 
REFERENCES Cadastro (id)
);

INSERT INTO Cadastro ( nome, email, cpf, senha) VALUES
('Ana', 'ana@email.com', '12345678901', 'senha123'),
('Joao', 'joao@email.com', '98765432100', 'abc12345');

INSERT INTO LivrosLidos (nome, fk_usuario) VALUES
('Anna Karenina – Leon Tolstoy', 1),
('O Diário de Anne Frank – Anne Frank', 2);

INSERT INTO LivrosLidos (nome, fk_usuario) VALUES
('Anna Karenina – Leon Tolstoy', 2),
('O Diário de Anne Frank – Anne Frank', 1),
('Orgulho e Preconceito – Jane Austen', 2);

SELECT * FROM Cadastro;

SELECT * FROM LivrosLidos;

SELECT nome, email, cpf, senha FROM Cadastro;

SELECT nome, fk_usuario FROM LivrosLidos;

SELECT Cadastro.nome AS 'usuario',
LivrosLidos.nome AS 'livro lido'
FROM LivrosLidos
JOIN Cadastro
ON LivrosLidos.fk_usuario = Cadastro.id;

