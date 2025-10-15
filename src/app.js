//importación de rutas
const express = require("express");
const { sequelize } = require("./config/database.js");

// Importación las Router correctamente
// const albumesRoutes = require('./routes/albumes.js');
const artistasRoutes = require('./routes/artistas.js');

// Crear una instancia de Express
const app = express();
const PORT = process.env.PORT || 3000;
// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto http://localhost:${PORT}`);
});

// Configurar parseo de JSON
app.use(express.json());


// Ruta de bienvenida
app.get("/api/v1", (req, res) => {  
    try {
        res.send("¡Bienvenido a la API Spotify!");
    } catch (error) {
        res.status(500).send("Error en el servidor")
    }
});

// Middleware de autenticación de base de datos
sequelize.authenticate()
    .then(() => {
        console.log('Conexión a la base de datos establecida exitosamente.');
    })
    .catch(error => {
        console.error('No se pudo conectar a la base de datos:', error);
    });
;

// Rutas app
// app.use('/api/v1/albumes', albumesRoutes);
app.use('/api/v1/artistas', artistasRoutes);


module.exports = app;
