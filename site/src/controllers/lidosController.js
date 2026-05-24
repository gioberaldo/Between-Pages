var lidosModel = require("../models/lidosModel");

function salvar(req, res) {

    var idUsuario = req.body.idUsuario;
    var livros = req.body.livros;
    var generos = req.body.generos;

    if (idUsuario == undefined) {

        res.status(400).send("ID do usuário undefined!");

    } else if (livros == undefined) {

        res.status(400).send("Livros undefined!");

    } else {

        lidosModel.salvar(

            idUsuario,
            livros,
            generos

        )

        .then(function () {

            res.json("Salvo com sucesso");

        })

        .catch(function (erro) {

            console.log(erro);

            res.status(500).json(erro.sqlMessage);

        });

    }

}
// function salvar(req, res) {
//     var idUsuario = req.body.idUsuario;
//     var livros = req.body.livros;
//     var lidos = req.body.lidos;

//     if (idUsuario == undefined) {
//         res.status(400).send("ID do usuário undefined!");
//     } else if (livros == undefined) {
//         res.status(400).send("Livros undefined!");
//     } else {


//         lidosModel.salvarHistorico(idUsuario, lidos)
//             .then(function () {

//                 for (let i = 0; i < livros.length; i++) {

//                     lidosModel.salvar(
//                         idUsuario,
//                         livros[i].livro
//                     );


//                 }


//             })
//         console.log()
//             .then(function () {
//                 res.json("Salvo com sucesso");
//             })
//             .catch(function (erro) {
//                 console.log(erro);
//                 res.status(500).json(erro.sqlMessage);
//             });
//     }
// }

function verificarLivros(req, res) {
    var idUsuario = req.params.idUsuario;

    lidosModel.verificarLivros(idUsuario).then(function (resultado) {
        res.json(resultado);
    })
}



function puxarTotalLivrosLidos(req, res) {
    var idUsuario = req.params.idUsuario;

    lidosModel.puxarTotalLivrosLidos(idUsuario).then(function (resultado) {

        res.json(resultado);

    })
}

function puxarGenero(req, res) {
    var idUsuario = req.params.idUsuario;

    lidosModel.puxarGenero(idUsuario).then(function (resultado) {

        res.json(resultado);

    })
}

function puxarPaginas(req, res) {
    var idUsuario = req.params.idUsuario;

    lidosModel.puxarPaginas(idUsuario).then(function(resultado) {

            res.json(resultado);

        });
}



module.exports = {
    salvar,
    verificarLivros,
    puxarTotalLivrosLidos,
    puxarGenero,
    puxarPaginas,
};