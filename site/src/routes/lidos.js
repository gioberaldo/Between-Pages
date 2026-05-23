var express = require("express");
var router = express.Router();

var lidosController = require("../controllers/lidosController");

router.post("/salvar", function (req, res) {
    lidosController.salvar(req, res);
});

router.get("/verificarLivros/:idUsuario", function(req, res) {
    lidosController.verificarLivros(req, res);
});

router.get("/puxarHistorico/:idUsuario", function(req, res) {
    lidosController.puxarHistorico(req, res);
});

router.get("/puxarGenero/:idUsuario", function(req, res) {
    lidosController.puxarGenero(req, res);
});

router.get("/puxarPaginas/:idUsuario", function(req, res) {
    lidosController.puxarPaginas(req, res);
});

module.exports = router;