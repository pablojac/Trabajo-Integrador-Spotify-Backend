/**
 * Rutas para álbumes
 * Los estudiantes deben implementar todas las rutas relacionadas con álbumes
 */
const express = require("express");
const router = express.Router();
const albumesController = require('../controllers/albumesController.js');

app.get('/api/v1/albumes', albumesController.getAllAlbumes);


module.exports = router;