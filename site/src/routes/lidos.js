var express = require("express");
var router = express.Router();

var lidosController = require("../controllers/lidosController");

router.post("/salvar", function (req, res) {
    lidosController.salvar(req, res);
});

module.exports = router;