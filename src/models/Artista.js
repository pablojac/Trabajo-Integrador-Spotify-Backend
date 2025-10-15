/**
 * Modelo Artista
 * Los estudiantes deben implementar todas las operaciones CRUD para artistas
 */

const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/database');

const Artista = sequelize.define('Artista', {
    id_artista: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'artista',
    timestamps: false
});
module.exports = Artista;