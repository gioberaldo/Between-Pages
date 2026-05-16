var database = require("../database/config");


function salvar(idUsuario, nome) {

    var instrucaoSql = `
        INSERT INTO LivrosLidos (nome, fk_usuario)
        VALUES ('${nome}', ${idUsuario});
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

module.exports = {
    //limpar,
    salvar,
    salvarHistorico
};