CREATE TABLE pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pais VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE tipo_usuario (
    id_tipo_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo ENUM('free', 'standard', 'premium') UNIQUE NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_nac DATE,
    sexo CHAR(1),
    cp VARCHAR(20),
    id_pais INT,
    tipo_usuario_actual INT,
    fecha_ult_mod_password DATETIME,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais),
    FOREIGN KEY (tipo_usuario_actual) REFERENCES tipo_usuario(id_tipo_usuario)
);

CREATE TABLE artista (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) UNIQUE NOT NULL,
    imagen_url VARCHAR(500)
);

CREATE TABLE discografica (
    id_discografica INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    id_pais INT,
    UNIQUE(nombre, id_pais),
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE album (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_artista INT,
    id_discografica INT,
    imagen_portada VARCHAR(500),
    anio_publicacion YEAR,
    duracion_total_seg INT DEFAULT 0,
    UNIQUE(id_artista, titulo),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_discografica) REFERENCES discografica(id_discografica)
);

CREATE TABLE genero (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE cancion (
    id_cancion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    duracion_seg INT NOT NULL,
    id_album INT,
    reproducciones BIGINT DEFAULT 0,
    likes BIGINT DEFAULT 0,
    fecha_agregada DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_album) REFERENCES album(id_album)
);

CREATE TABLE cancion_genero (
    id_cancion INT,
    id_genero INT,
    PRIMARY KEY(id_cancion, id_genero),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
);

CREATE TABLE playlist (
    id_playlist INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_usuario INT,
    cant_canciones INT DEFAULT 0,
    estado ENUM('activa','eliminada') DEFAULT 'activa',
    fecha_creacion DATETIME NOT NULL,
    fecha_eliminada DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CHECK (
        (estado = 'activa' AND fecha_eliminada IS NULL) OR
        (estado = 'eliminada' AND fecha_eliminada IS NOT NULL)
    )
);

CREATE TABLE playlist_cancion (
    id_playlist INT,
    id_cancion INT,
    orden INT,
    fecha_agregada DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_playlist, id_cancion),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion)
);

CREATE TABLE suscripcion (
    id_suscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    tipo_usuario ENUM('free', 'standard', 'premium') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_renovacion DATE NOT NULL,
    UNIQUE(id_usuario, fecha_inicio),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CHECK (fecha_renovacion > fecha_inicio)
);

CREATE TABLE metodo_pago (
    id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    tipo_forma_pago VARCHAR(50),
    cbu VARCHAR(22),
    banco_codigo VARCHAR(10),
    nro_tarjeta_masc CHAR(4),
    mes_caduca TINYINT,
    anio_caduca SMALLINT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE pago (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_suscripcion INT,
    id_metodo_pago INT,
    importe DECIMAL(10,2),
    fecha_pago DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_suscripcion) REFERENCES suscripcion(id_suscripcion),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);