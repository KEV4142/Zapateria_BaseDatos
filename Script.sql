-- CREATE DATABASE zapateria;
-- USE zapateria;

CREATE TABLE categorias(
categoriaid	SERIAL NOT NULL,
descripcion	VARCHAR(100) NOT NULL,
estado	VARCHAR(1) NOT NULL DEFAULT 'A'
);
ALTER TABLE categorias ADD CONSTRAINT pkcategoriaid PRIMARY KEY(categoriaid);
ALTER TABLE categorias ADD CONSTRAINT ckcategoriaestado CHECK (estado IN('A','I','B'));

CREATE TABLE imagenes (
imagenid	SERIAL NOT NULL,
url	VARCHAR(100) NOT NULL,
publicid	VARCHAR(100) NOT NULL,
estado VARCHAR(1) NOT NULL DEFAULT 'A'
);
ALTER TABLE imagenes ADD CONSTRAINT pkimagenid PRIMARY KEY(imagenid);
ALTER TABLE imagenes ADD CONSTRAINT ckimagenesaestado CHECK (estado IN('A','I','B'));


CREATE TABLE productos (
    productoid SERIAL NOT NULL,
    descripcion	VARCHAR(100) NULL,
    precio NUMERIC(10, 2) NULL,
	categoriaid INT NOT NULL,
	imagenid INT NULL,
    estado 	VARCHAR(1) NOT NULL DEFAULT 'A'
);
ALTER TABLE productos ADD CONSTRAINT pkproductosid PRIMARY KEY(productoid);
ALTER TABLE productos ADD CONSTRAINT ckproductosestado CHECK (estado IN('A','I','B'));
ALTER TABLE productos ADD CONSTRAINT fkproductocategoriaid FOREIGN KEY (categoriaid) REFERENCES categorias(categoriaid);
ALTER TABLE productos ADD CONSTRAINT fkproductoimagenid FOREIGN KEY (imagenid) REFERENCES imagenes(imagenid);
