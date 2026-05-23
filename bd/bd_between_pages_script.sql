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
genero VARCHAR(45),
fk_usuario INT,
CONSTRAINT chFkUsuario
FOREIGN KEY (fk_usuario) 
REFERENCES Cadastro (id)
);

CREATE TABLE HistoricoLeitura(
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    livros_lidos INT,
    dtHrRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fk_usuario) REFERENCES Cadastro(id)
);




SELECT * FROM Cadastro;



SELECT * FROM LivrosLidos;

SELECT * FROM HistoricoLeitura;


SELECT nome, email, cpf, senha FROM Cadastro;

SELECT nome, fk_usuario FROM LivrosLidos;


SELECT livros_lidos
        FROM HistoricoLeitura
        ORDER BY idHistorico DESC
        LIMIT 1;

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



ALTER TABLE historicoLeitura ADD COLUMN dtHrRegistro DATETIME DEFAULT CURRENT_TIMESTAMP;

    
   
    
    ALTER TABLE livrosLidos ADD COLUMN genero VARCHAR(45);
    
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

DROP DATABASE bd_between_pages;