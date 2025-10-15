/**
 * Controlador de Álbumes
 * Los estudiantes deben implementar toda la lógica de negocio para álbumes
 */
const getAllAlbumes = async(req, res) => {
    try {
       res.status(200).json({ message: "Aquí estarán todos los álbumes" });
    } catch (error) {
        res.status(500).send("Error en el servidor")
    };
};

module.exports = {
    getAllAlbumes
};
