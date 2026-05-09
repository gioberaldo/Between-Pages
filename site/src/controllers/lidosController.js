var lidosModel = require("../models/lidosModel");

function salvar(req, res) {
    var idUsuario = req.body.idUsuario;
    var livros = req.body.livros;
    var lidos = req.body.lidos;

    if (idUsuario == undefined) {
        res.status(400).send("ID do usuário undefined!");
    } else if (livros == undefined) {
        res.status(400).send("Livros undefined!");
    } else {

        lidosModel.limpar(idUsuario)
            .then(function () {

                for (let i = 0; i < livros.length; i++) {

                    lidosModel.salvar(
                        idUsuario,
                        livros[i].livro
                    );

                }

                return lidosModel.salvarHistorico(idUsuario, lidos);

            })
            .then(function () {
                res.json("Salvo com sucesso");
            })
            .catch(function (erro) {
                console.log(erro);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

module.exports = {
    salvar
};