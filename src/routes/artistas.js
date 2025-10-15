/**
 * Rutas para artistas
 * Los estudiantes deben implementar todas las rutas relacionadas con artistas
 */

const express = require("express");
const router = express.Router();
const artistasController = require('../controllers/artistasController.js');

router.get('/', async (req, res) => {
    try {
        await artistasController.getAllArtistas(req, res);
    } catch (error) {
        console.error('Error al obtener artistas:', error);
        res.status(500).send('Error interno del servidor');
    }
});
router.post('/', async (req, res) => {
    try {
        await artistasController.createArtista(req, res);
    } catch (error) {
        console.error('Error al crear artista:', error);
        res.status(500).send('Error interno del servidor');
    }
});



module.exports = router;