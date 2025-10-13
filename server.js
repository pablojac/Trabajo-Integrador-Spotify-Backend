/**
 * Punto de entrada del servidor
 * Los estudiantes deben completar la configuración del servidor Express
 */

const app = require("./src/app");
const{ sequelize } = require("./src/config/database.js");


const PORT = process.env.PORT || 3000;

// TODO: Configurar el servidor para escuchar en el puerto especificado
// TODO: Agregar manejo de errores del servidor
// TODO: Agregar logs de inicio del servidor

sequelize.authenticate()
    .then(() => {
        console.log('Conexión a la base de datos establecida exitosamente.');
    })
    .catch(err => {
        console.error('No se pudo conectar a la base de datos:', err);
    });
