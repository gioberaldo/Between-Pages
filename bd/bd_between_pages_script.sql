CREATE DATABASE bd_between_pages;
USE bd_between_pages;


CREATE TABLE Usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
cpf CHAR(11),
senha VARCHAR(20)
);

CREATE TABLE LivrosLidos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
genero VARCHAR(45),
fk_usuario INT,
CONSTRAINT chFkUsuario
FOREIGN KEY (fk_usuario) 
REFERENCES Usuarios (id)
);


SELECT * FROM Usuarios;

SELECT * FROM LivrosLidos;

SELECT nome, email, cpf, senha FROM Usuarios;

SELECT nome, fk_usuario FROM LivrosLidos;


SELECT Usuarios.nome AS 'usuario',
LivrosLidos.nome AS 'livro lido'
FROM LivrosLidos
JOIN Usuarios
ON LivrosLidos.fk_usuario = Usuarios.id;

    
    SELECT
	
    CASE
        WHEN nome = 'harry_potter' THEN 'Fantasia'
        WHEN nome = 'o_grande_gatsby' THEN 'Drama'
        WHEN nome = 'alice_wonderland' THEN 'Fantasia'
        WHEN nome = 'carrie_a_estranha' THEN 'Terror'
        WHEN nome = 'bruxas_de_salem' THEN 'Drama'
        WHEN nome = 'anna_karenina' THEN 'Romance'
        WHEN nome = 'diario_anne_frank' THEN 'Biografia'
        WHEN nome = 'orgulho_e_preconceito' THEN 'Romance'
        WHEN nome = 'violinista_no_telhado' THEN 'Musical'
        WHEN nome = 'a_nascente' THEN 'Drama'
        ELSE 'Outro'
    END AS genero,

    COUNT(*) AS quantidade

FROM LivrosLidos
WHERE fk_usuario = 1
GROUP BY genero;
    

    
DESCRIBE LivrosLidos;

SELECT
nome,
CASE
    WHEN nome = 'alice_wonderland' THEN 144
    WHEN nome = 'o_grande_gatsby' THEN 272
    WHEN nome = 'harry_potter' THEN 223
    WHEN nome = 'carrie_a_estranha' THEN 199
    WHEN nome = 'bruxas_de_salem' THEN 160
    WHEN nome = 'anna_karenina' THEN 864
    WHEN nome = 'violinista_no_telhado' THEN 256
    WHEN nome = 'a_nascente' THEN 752
    WHEN nome = 'orgulho_e_preconceito' THEN 432
END AS qtdPaginas
FROM LivrosLidos;

DROP DATABASE IF EXISTS bd_between_pages;