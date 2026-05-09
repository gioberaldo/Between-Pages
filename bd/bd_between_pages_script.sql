CREATE DATABASE bd_between_pages;
USE bd_between_pages;

-- mudar para usuario

CREATE TABLE Cadastro (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
cpf CHAR(11),
senha VARCHAR(20)
);

CREATE TABLE LivrosLidos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fk_usuario INT,
CONSTRAINT chFkUsuario
FOREIGN KEY (fk_usuario) 
REFERENCES Cadastro (id)
);

CREATE TABLE HistoricoLeitura(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    livros_lidos INT,
    FOREIGN KEY (fk_usuario) REFERENCES Cadastro(id)
);

DROP TABLE LivrosLidos;

INSERT INTO Cadastro (nome, senha, email, cpf) VALUES
('Ana', 'ana@email.com', '12345678901', 'senha123'),
('Joao', 'joao@email.com', '98765432100', 'abc12345');

INSERT INTO LivrosLidos (nome, fk_usuario) VALUES
('Anna Karenina – Leon Tolstoy', 1),
('O Diário de Anne Frank – Anne Frank', 2);

INSERT INTO HistoricoLeitura (fk_usuario, livros_lidos)
VALUES (1, 1);

INSERT INTO LivrosLidos (nome, fk_usuario) VALUES
('Anna Karenina – Leon Tolstoy', 2),
('O Diário de Anne Frank – Anne Frank', 1),
('Orgulho e Preconceito – Jane Austen', 2);

SELECT * FROM Cadastro;

SELECT * FROM LivrosLidos;

SELECT * FROM HistoricoLeitura;

SELECT nome, email, cpf, senha FROM Cadastro;

SELECT nome, fk_usuario FROM LivrosLidos;

SELECT Cadastro.nome AS 'usuario',
LivrosLidos.nome AS 'livro lido'
FROM LivrosLidos
JOIN Cadastro
ON LivrosLidos.fk_usuario = Cadastro.id;

SELECT 
    c.nome AS usuario,
    l.nome AS livro_lido,
    h.livros_lidos
FROM Cadastro c
JOIN LivrosLidos l 
    ON l.fk_usuario = c.id
JOIN HistoricoLeitura h 
    ON h.fk_usuario = c.id;

