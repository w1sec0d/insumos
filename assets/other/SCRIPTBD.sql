DROP DATABASE IF EXISTS INSUMOS;
CREATE DATABASE INSUMOS;
USE INSUMOS;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE CENTRO(
	ID INT AUTO_INCREMENT,
    PRIMARY KEY(ID),
    NOMBRE VARCHAR(100) NOT NULL
);

CREATE TABLE INSUMO(
	ID INT AUTO_INCREMENT,
    PRIMARY KEY(ID),
	NOMBRE VARCHAR(50) NOT NULL,
    DIMENSIONES VARCHAR(30),
    COLOR VARCHAR(30),
    TIPO SET('BOLSAS','LIQUIDOS','CAFETERIA','HERRAMIENTAS','INSUMOS_GENERALES','EPP','OTROS') NOT NULL
);

CREATE TABLE USUARIOS(
	ID INT AUTO_INCREMENT,
    PRIMARY KEY(ID),    
	CONTRASENA VARCHAR(50) NOT NULL,
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY (ID_CENTRO) REFERENCES CENTRO(ID)
);

CREATE TABLE TRANSACCION(
	ID INT AUTO_INCREMENT,
    PRIMARY KEY(ID),
	TIPO SET('ENTRADA','SALIDA'),
    CANTIDAD INT NOT NULL,
    JUSTIFICACION TINYTEXT,
	FECHA DATE,
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY (ID_CENTRO) REFERENCES CENTRO(ID),
    ID_INSUMO INT NOT NULL,
    FOREIGN KEY (ID_INSUMO) REFERENCES INSUMO(ID)
);

CREATE TABLE INVENTARIO(
	ID INT AUTO_INCREMENT,
    PRIMARY KEY(ID),
    ID_INSUMO INT NOT NULL,
    FOREIGN KEY(ID_INSUMO) REFERENCES INSUMO(ID),
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY(ID_CENTRO) REFERENCES CENTRO(ID),
    CANTIDAD INT NOT NULL DEFAULT 0
);

-- INSERT DE CENTROS
INSERT INTO CENTRO(NOMBRE) VALUES ('HOSPITAL DE KENNEDY'); 

-- INSERT DE INSUMOS
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 20X20','20X20','ROJO','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 20X20','20X20','AZUL','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 20X20','20X20','AMARILLO','BOLSAS');

INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 50X50','50X50','ROJO','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 50X50','50X50','AZUL','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 50X50','50X50','AMARILLO','BOLSAS');

INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 100X100','100X100','ROJO','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 100X100','100X100','AZUL','BOLSAS');
INSERT INTO INSUMO(NOMBRE,DIMENSIONES,COLOR,TIPO) VALUES ('BOLSA 100X100','100X100','AMARILLO','BOLSAS');

INSERT INTO INSUMO(NOMBRE,TIPO) VALUES ('HIPOCLORITO','LIQUIDOS');
INSERT INTO INSUMO(NOMBRE,TIPO) VALUES ('JABON','LIQUIDOS');
INSERT INTO INSUMO(NOMBRE,TIPO) VALUES ('CLOROX','LIQUIDOS');

-- INSERT DE INVENTARIO
SELECT * FROM INSUMO;
SELECT * FROM INVENTARIO;
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(1,1,40); 
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(2,1,20); 
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(3,1,30); 
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(4,1,67);
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(10,1,40);
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(11,1,2);
INSERT INTO INVENTARIO(ID_INSUMO,ID_CENTRO,CANTIDAD) VALUES(12,1,0);

-- Triggers

/*
DELIMITER //
CREATE TRIGGER INVENTARIO_BU
BEFORE UPDATE ON INVENTARIO
FOR EACH ROW
BEGIN
	SET @diferencia = new.CANTIDAD - old.CANTIDAD;
	SET @tipoTransaccion = (SELECT IF(old.CANTIDAD > new.Cantidad,'ENTRADA','SALIDA'));
    INSERT INTO TRANSACCION(TIPO,CANTIDAD,DIFERENCIA,)
END //
DELIMITER ;  
*/

-- VISTAS
SELECT * FROM INSUMO;
SELECT * FROM INVENTARIO;

CREATE OR REPLACE VIEW VISTA_INSUMOS AS
SELECT INSUMO_INVENTARIO.*,CENTRO.NOMBRE AS 'NOMBRE_CENTRO' FROM (SELECT INSUMO.*, INVENTARIO.ID_CENTRO, INVENTARIO.CANTIDAD FROM INSUMO INNER JOIN INVENTARIO ON INSUMO.ID = INVENTARIO.ID_INSUMO) AS INSUMO_INVENTARIO INNER JOIN CENTRO ON CENTRO.ID = INSUMO_INVENTARIO.ID_CENTRO;

SELECT * FROM VISTA_INSUMOS;

-- PROCEDIMIENTOS
DELIMITER //
CREATE PROCEDURE MODIFICAR_CANTIDAD(
	IDINSUMO INT, CAMBIO INT
)
BEGIN
	UPDATE INVENTARIO SET CANTIDAD = CANTIDAD + CAMBIO WHERE ID_INSUMO = IDINSUMO;
END // 
DELIMITER ;

SELECT * FROM INSUMO;
SELECT * FROM INVENTARIO;
CALL MODIFICAR_CANTIDAD(1,7);