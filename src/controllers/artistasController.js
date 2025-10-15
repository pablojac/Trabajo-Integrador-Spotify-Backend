/**
 * Controlador de Artistas
 * Los estudiantes deben implementar toda la lógica de negocio para artistas
 */
const Artista = require('../models/Artista');

const getAllArtistas = async (req, res) => {
    try {
        const artistas = await Artista.findAll();
        res.status(200).json(artistas);
    } catch (error) {
        res.status(500).send("Error en el servidor");
        console.error(error);
    }
};

const createArtista = async (req, res) => {
    try {
        const { nombre, genero } = req.body;
        const nuevoArtista = await Artista.create({ nombre, genero });
        res.status(201).json(nuevoArtista);
    } catch (error) {
        res.status(500).send("Error en el servidor");
        console.error(error);
    };
}
module.exports = {
    getAllArtistas
    , createArtista
};