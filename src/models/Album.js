/**
 * Modelo Album
 * Los estudiantes deben implementar todas las operaciones CRUD para álbumes
 */

const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/database');

const Album = sequelize.define('Album', {
    id_album: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    
}, {
    tableName: 'albumes',
    
});
module.exports = Album;
