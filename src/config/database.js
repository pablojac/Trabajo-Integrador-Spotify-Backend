/**
 * Configuración de conexión a la base de datos MySQL
 * Los estudiantes deben completar la configuración de la conexión
 */
const { Sequelize } = require('sequelize');
const process = require('process');

process.loadEnvFile();


const sequelize = new Sequelize(
     // Host de la base de datos
    process.env.DB_NAME, // Nombre de la base de datos
    process.env.DB_USER, // Usuario de la base de datos
    process.env.DB_PASSWORD, // Contraseña de la base de datos
    {
        host: process.env.DB_HOST, // Host de la base de datos
        dialect: 'mysql', // Tipo de base de datos
   
    }
);


module.exports = { sequelize };