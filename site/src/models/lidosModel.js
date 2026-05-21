var database = require("../database/config");


function verificarLivros(idUsuario){
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

function puxarHistorico(idUsuario){
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

module.exports = {
    
    salvar,
    salvarHistorico,
    puxarHistorico,
    verificarLivros,
    puxarGenero,
    
};