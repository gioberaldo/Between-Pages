var database = require("../database/config");


function verificarLivros(idUsuario) {
    var instrucaoSql = `
        SELECT nome
        FROM LivrosLidos
        WHERE fk_usuario = ${idUsuario};
    `;
    return database.executar(instrucaoSql);
}



function salvar(idUsuario, nome, genero) {

    var instrucaoSql = `
        INSERT INTO LivrosLidos (nome, genero, fk_usuario)
        VALUES ('${nome}', '${genero}', '${idUsuario}');
    `;
    return database.executar(instrucaoSql);
}

function salvarHistorico(idUsuario, lidos) {
    var instrucaoSql = `
        INSERT INTO HistoricoLeitura (fk_usuario, livros_lidos)
        VALUES (${idUsuario}, ${lidos});
    `;
    return database.executar(instrucaoSql);
}

function puxarHistorico(idUsuario) {
    var instrucaoSql = `SELECT livros_lidos
    FROM historicoLeitura
    WHERE fk_usuario = ${idUsuario}
    ORDER BY id DESC
    LIMIT 1;
    `;
    return database.executar(instrucaoSql);
}

function puxarGenero(idUsuario) {
    var instrucaoSql = `
    
    SELECT genero, COUNT(*) AS quantidade
        FROM LivrosLidos
        WHERE fk_usuario = ${idUsuario}
        GROUP BY genero;
        

    `;

    return database.executar(instrucaoSql);
}

function puxarPaginas(idUsuario) {
    var instrucaoSql = `
    
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
FROM LivrosLidos
WHERE fk_usuario = ${idUsuario};
    
    `;

    return database.executar(instrucaoSql);
}

module.exports = {

    salvar,
    salvarHistorico,
    puxarHistorico,
    verificarLivros,
    puxarGenero,
    puxarPaginas,

};