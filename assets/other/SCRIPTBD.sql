DROP DATABASE IF EXISTS INSUMOS;
CREATE DATABASE INSUMOS;
USE INSUMOS;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE CENTRO (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    NOMBRE VARCHAR(100) NOT NULL
);

CREATE TABLE INSUMO (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    NOMBRE VARCHAR(50) NOT NULL,
    DIMENSIONES VARCHAR(30),
    COLOR VARCHAR(30),
    TIPO SET('BOLSAS', 'LIQUIDOS', 'CAFETERIA', 'HERRAMIENTAS', 'INSUMOS_GENERALES', 'EPP', 'TOALLAS', 'PAPELERIA', 'ACTIVOS_FIJOS', 'OTROS') NOT NULL
);

CREATE TABLE USUARIOS (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    CONTRASENA VARCHAR(50) NOT NULL,
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY (ID_CENTRO)
        REFERENCES CENTRO (ID)
);
	CREATE TABLE TRANSACCION (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    TIPO SET('ENTRADA', 'SALIDA'),
    CANTIDAD INT NOT NULL,
    JUSTIFICACION TINYTEXT,
    SERVICIO VARCHAR(60),
    PERSONA VARCHAR(60),
    FECHA DATETIME,
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY (ID_CENTRO)
        REFERENCES CENTRO (ID),
    ID_INSUMO INT NOT NULL,
    FOREIGN KEY (ID_INSUMO)
        REFERENCES INSUMO (ID)
);

CREATE TABLE INVENTARIO (
    ID INT AUTO_INCREMENT,
    PRIMARY KEY (ID),
    ID_INSUMO INT NOT NULL,
    FOREIGN KEY (ID_INSUMO)
        REFERENCES INSUMO (ID),
    ID_CENTRO INT NOT NULL,
    FOREIGN KEY (ID_CENTRO)
        REFERENCES CENTRO (ID),
    CANTIDAD INT NOT NULL DEFAULT 0
);

                    INSERT INTO CENTRO
                        (ID,NOMBRE)
                    VALUES
                        (1, 'HOSPITAL SIMON BOLIVAR');
                    INSERT INTO CENTRO
                        (ID,NOMBRE)
                    VALUES
                        (2, 'HOSPITAL TUNAL');
                    INSERT INTO CENTRO
                        (ID,NOMBRE)
                    VALUES
                        (3, 'HOSPITAL SANTA CLARA');
                    INSERT INTO CENTRO
                        (ID,NOMBRE)
                    VALUES
                        (4, 'HOSPITAL KENNEDY');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (1, 'BOLSA GRIS 50 CM X50 CM PEQUENA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (2, 'BOLSA GRIS 55 CM X 65 CM MEDIANA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (3, 'BOLSA GRIS 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (4, 'BOLSA GRIS 80 CM X 98  EXTRAGRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (5, 'BOLSA ROJA 18 CM X25 PARA MUELAS', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (6, 'BOLSA ROJA 30 CM X 40 PEQUENA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (7, 'BOLSA ROJA 50 CM X 50 PEQUENIA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (8, 'BOLSA ROJA 55 CM X 65 MEDIANA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (9, 'BOLSA ROJA 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (10, 'BOLSA ROJA 80 CM X 98 EXTRAGRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (11, 'BOLSA ROJA RIESGO QUIMICO 55 CM X65', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (12, 'BOLSA ROJA RIESGO QUIMICO 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (13, 'BOLSA VERDE 50 CM X50 MM PEQUENIA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (14, 'BOLSA VERDE 55 CM X 65 MM MEDIANA', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (15, 'BOLSA VERDE 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (16, 'BOLSA VERDE 80 CM X 98 CM  EXTRAGRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (17, 'BOLSA AMARILLA 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (18, 'BOLSA AZUL 65 CM X90 GRANDE', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (19, 'BOLSA BLANCA ROLLO TUBULAR', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (20, 'BOLSA SELLO HERMETICO', NULL, NULL, 'BOLSAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (21, 'PAPEL HIGIENICO NATURAL X 250 MTS  REF. 1TTCO04714', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (22, 'PAPEL HIGIENICO TRIPLE HOJA ROLLO REF. 1TTCO009001', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (23, 'TOALLA CENTER FLOW  NATURAL 100 MTS TH 1TTCO340629', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (24, 'TOALLA NATURAL DH 100 MTS ROLLO REF. 1TTCO611009', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (25, 'TOALLA INTERFOLIADA  NAT. PAQX150 REF. 1TTCO631003', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (26, 'PANO MAXWIPE X60 300 M 890 PANOS REF.1TTCO615001', NULL, NULL, 'TOALLAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (27, 'GUANTE AMARILLO CALIBRE 25 T7/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (28, 'GUANTE AMARILLO CALIBRE 25 T8 1/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (29, 'GUANTE AMARILLO CALIBRE 25 T9', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (30, 'GUANTE ROJO CALIBRE 25 T 7/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (31, 'GUANTE ROJO CALIBRE 25 T8 1/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (32, 'GUANTE ROJO CALIBRE 25 T9', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (33, 'GUANTE ROJO CALIBRE 25 10', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (34, 'GUANTE NEGRO CALIBRE 35 T7/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (35, 'GUANTE NEGRO CALIBRE 35 T8/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (36, 'GUANTE NEGRO CALIBRE 35 T9', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (37, 'GUANTE NEGRO CALIBRE 35 T10', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (38, 'GUANTE VERDE 7/2', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (39, 'GUANTE VERDE 8 1/2  CALIBRE 20', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (40, 'GUANTE VERDE CALIBRE 25 TALLA 9', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (41, 'GUANTE DE VINILO X PARES', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (42, 'GUANTES LARGOS (MOSQUETEROS)', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (43, 'TAPABOCAS CONVENCIONAL', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (45, 'TAPABOCAS N-95', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (46, 'BATA PACIENTE MANGA LARGA', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (47, 'PIJAMA QUIRURGICA/BLUSA PANTALON', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (48, 'GORRO DESECHABLE', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (49, 'POLAINA', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (50, 'CARETA FACIAL ACRILICO', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (51, 'MASCARILLA CON DOBLE FILTRO', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (52, 'MONOGAFAS', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (53, 'MONOGAFAS DE SOBREPONER', NULL, NULL, 'EPP');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (54, 'AMBIENTADOR LIQUIDO TALCO-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (55, 'AMBIENTADOR TALCO GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (56, 'CERA EMULSIONADA ANTIDESLIZANTE-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (57, 'CERA POLIMERICA-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (58, 'CERA EMULSIONADA ANTIDESLIZANTE-GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (59, 'CERA POLIMERICA GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (60, 'SELLADOR-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (61, 'SELLADOR GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (62, 'JABON MULTIUSOS-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (63, 'JABON PARA MANOS ANTIBACTERIAL-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (64, 'LAVALOZA JABON LIQUIDO-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (65, 'JABON PARA MULTIUSOS-GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (66, 'JABON PARA MANOS-GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (67, 'DESENGRASANTE  JDR GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (68, 'DESENGRASANTE GALON JDR', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (69, 'REMOVEDOR GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (70, 'REMOVEDOR-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (71, 'HIPOCLORITO GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (72, 'HIPOCLORITO GARRAFA', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (73, 'COMPUCLEAR-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (74, 'LIMPIAVIDRIOS-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (75, 'LUSTRAMUEBLES-GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (76, 'ALCOHOL JDR GALON', NULL, NULL, 'LIQUIDOS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (77, 'MECHA COPA REF. 1003178', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (78, 'ESCOBAS NYLON CERDA BLANDA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (79, 'ESCOBAS NYLON CERDA DURA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (80, 'CEPILLO DE DIENTES PARA LAVAMANOS', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (81, 'CEPILLO DE MANO CERDA DURA TIPO PLANCHA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (82, 'CEPILLO DE PARED', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (83, 'CEPILLO MANGO LARGO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (84, 'CEPILLO PARA UNAS', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (85, 'CHURRUSCO PARA BANO CON BASE REF. 1004732', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (86, 'RECOGEDORES', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (87, 'TAZA PLASTICA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (88, 'TUBO PLASTICO RECOGEDOR', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (89, 'CHUPAS', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (90, 'BALDE', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (91, 'JARRA REDONDA 1 LITRO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (92, 'ATOMIZADOR ECO  E.500CC BLCO HONGO B.24.C. LARGO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (93, 'BOMBA ECO SPRAY 24/415 BLCO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (94, 'PISTOLA AMERICANA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (95, 'CANECAS  CON LLAVE', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (96, 'EMBUDO GRANDE', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (97, 'EMBUDO PEQUENO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (98, 'PORTATRAPERO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (99, 'BRILLADOR INDUSTRIAL 80 CM', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (100, 'ESCOBA CURVA', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (101, 'RASTRILLO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (102, 'BRILLADOR INDUSTRIAL 60 CM', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (103, 'HARAGAN DE PISO 50CM', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (104, 'BRILLADOR INDUSTRIAL 1 METRO', NULL, NULL, 'HERRAMIENTAS');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (105, 'AMBIENTADOR EN SPRAY (GLADE, BONAIRE)', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (106, 'AMBIENTADOR GLADE ACEITE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (107, 'PISOL GRANDE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (108, 'PISOL MEDIANO', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (109, 'JABON ABRASIVO CENIZA X 500 GRAMOS', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (110, 'JABON ABRASIVO POLVO 1A X 500 GRAMOS', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (111, 'JABON AXION X 500 GRS', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (112, 'JABON DETERGENTE POLVO X 500 GRAMOS', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (113, 'PAD NEGRO (LAVAR) 17 PEQUENO', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (114, 'PAD ROJO (BRILLAR) DE 17 PEQUENO', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (115, 'PAD NEGRO (LAVAR) DE 20 GRANDE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (116, 'PAD ROJO (BRILLAR) DE 20 GRANDE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (117, 'ESPONJILLA BOMBRIL', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (118, 'ESPONJILLA DE ALAMBRE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (119, 'SABRA DE 14 X 10 CM', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (120, 'SABRA RETAL', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (121, 'LANA ACERO', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (122, 'LLAVE CANECA', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (123, 'CHURRUSCO GRECA', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (124, 'GELIFICANTE SOBRE X 7 GRAMOS', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (125, 'TOALLA TELA 50X22 AMARILLA', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (126, 'TOALLA TELA 50X22 BLANCA', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (127, 'TOALLA TELA 50X22 ROJA', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (128, 'TOALLA TELA 50X22 VERDE', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (129, 'BAYETILLA PARA ESCOBA 50X38', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (130, 'BAYETILLA PARA MOTOSO 100 CM', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (131, 'BAYETILLA PARA MOTOSO  65 CM', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (132, 'BAYETILLA PARA MOTOSO 85 CM', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (133, 'BAYETILLA PARA POLVO  45 X 36 CM', NULL, NULL, 'INSUMOS_GENERALES');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (134, 'AROMATICA  PANELA SURTIDA CAJA X 25 SOBRES', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (135, 'CAFE PACA X  2500 GRS.', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (136, 'CAFE X LIBRA 500 GRS.', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (137, 'CHURRUSCO GRECA', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (138, 'FILTRO PARA AROMATICA', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (139, 'FILTRO PARA GRECA', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (140, 'AZUCAR SICKPACK X KILO BCO CTE 10X200 UNDS', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (141, 'MEZCLADORES DE TINTO X 500 UNIDS', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (142, 'VASO 4 OZ CARTON PQX50', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (143, 'VASO 7 OZ CARTON PQX50', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (144, 'AROMATICA JAIBEL CAJA X 20 SOBRES', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (145, 'AROMATICA JAIBEL  INSTITUCIONAL CAJA X 25 SOBRES', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INSUMO
                        (ID,NOMBRE,DIMENSIONES,COLOR,TIPO)
                    VALUES
                        (146, 'SERVILLETA 19%', NULL, NULL, 'CAFETERIA');
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (1, 1, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (2, 2, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (3, 3, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (4, 4, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (5, 5, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (6, 6, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (7, 7, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (8, 8, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (9, 9, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (10, 10, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (11, 11, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (12, 12, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (13, 13, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (14, 14, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (15, 15, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (16, 16, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (17, 17, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (18, 18, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (19, 19, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (20, 20, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (21, 21, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (22, 22, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (23, 23, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (24, 24, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (25, 25, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (26, 26, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (27, 27, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (28, 28, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (29, 29, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (30, 30, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (31, 31, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (32, 32, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (33, 33, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (34, 34, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (35, 35, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (36, 36, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (37, 37, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (38, 38, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (39, 39, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (40, 40, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (41, 41, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (42, 42, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (43, 43, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (45, 45, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (46, 46, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (47, 47, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (48, 48, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (49, 49, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (50, 50, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (51, 51, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (52, 52, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (53, 53, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (54, 54, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (55, 55, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (56, 56, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (57, 57, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (58, 58, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (59, 59, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (60, 60, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (61, 61, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (62, 62, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (63, 63, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (64, 64, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (65, 65, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (66, 66, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (67, 67, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (68, 68, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (69, 69, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (70, 70, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (71, 71, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (72, 72, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (73, 73, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (74, 74, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (75, 75, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (76, 76, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (77, 77, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (78, 78, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (79, 79, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (80, 80, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (81, 81, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (82, 82, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (83, 83, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (84, 84, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (85, 85, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (86, 86, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (87, 87, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (88, 88, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (89, 89, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (90, 90, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (91, 91, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (92, 92, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (93, 93, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (94, 94, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (95, 95, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (96, 96, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (97, 97, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (98, 98, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (99, 99, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (100, 100, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (101, 101, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (102, 102, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (103, 103, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (104, 104, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (105, 105, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (106, 106, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (107, 107, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (108, 108, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (109, 109, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (110, 110, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (111, 111, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (112, 112, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (113, 113, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (114, 114, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (115, 115, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (116, 116, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (117, 117, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (118, 118, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (119, 119, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (120, 120, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (121, 121, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (122, 122, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (123, 123, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (124, 124, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (125, 125, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (126, 126, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (127, 127, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (128, 128, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (129, 129, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (130, 130, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (131, 131, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (132, 132, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (133, 133, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (134, 134, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (135, 135, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (136, 136, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (137, 137, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (138, 138, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (139, 139, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (140, 140, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (141, 141, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (142, 142, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (143, 143, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (144, 144, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (145, 145, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (146, 146, 1, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (147, 1, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (148, 2, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (149, 3, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (150, 4, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (151, 5, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (152, 6, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (153, 7, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (154, 8, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (155, 9, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (156, 10, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (157, 11, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (158, 12, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (159, 13, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (160, 14, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (161, 15, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (162, 16, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (163, 17, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (164, 18, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (165, 19, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (166, 20, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (167, 21, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (168, 22, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (169, 23, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (170, 24, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (171, 25, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (172, 26, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (173, 27, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (174, 28, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (175, 29, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (176, 30, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (177, 31, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (178, 32, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (179, 33, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (180, 34, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (181, 35, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (182, 36, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (183, 37, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (184, 38, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (185, 39, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (186, 40, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (187, 41, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (188, 42, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (189, 43, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (191, 45, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (192, 46, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (193, 47, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (194, 48, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (195, 49, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (196, 50, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (197, 51, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (198, 52, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (199, 53, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (200, 54, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (201, 55, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (202, 56, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (203, 57, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (204, 58, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (205, 59, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (206, 60, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (207, 61, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (208, 62, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (209, 63, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (210, 64, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (211, 65, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (212, 66, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (213, 67, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (214, 68, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (215, 69, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (216, 70, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (217, 71, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (218, 72, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (219, 73, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (220, 74, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (221, 75, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (222, 76, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (223, 77, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (224, 78, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (225, 79, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (226, 80, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (227, 81, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (228, 82, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (229, 83, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (230, 84, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (231, 85, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (232, 86, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (233, 87, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (234, 88, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (235, 89, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (236, 90, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (237, 91, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (238, 92, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (239, 93, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (240, 94, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (241, 95, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (242, 96, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (243, 97, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (244, 98, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (245, 99, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (246, 100, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (247, 101, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (248, 102, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (249, 103, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (250, 104, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (251, 105, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (252, 106, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (253, 107, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (254, 108, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (255, 109, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (256, 110, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (257, 111, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (258, 112, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (259, 113, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (260, 114, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (261, 115, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (262, 116, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (263, 117, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (264, 118, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (265, 119, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (266, 120, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (267, 121, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (268, 122, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (269, 123, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (270, 124, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (271, 125, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (272, 126, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (273, 127, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (274, 128, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (275, 129, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (276, 130, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (277, 131, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (278, 132, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (279, 133, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (280, 134, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (281, 135, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (282, 136, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (283, 137, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (284, 138, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (285, 139, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (286, 140, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (287, 141, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (288, 142, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (289, 143, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (290, 144, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (291, 145, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (292, 146, 2, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (293, 1, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (294, 2, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (295, 3, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (296, 4, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (297, 5, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (298, 6, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (299, 7, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (300, 8, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (301, 9, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (302, 10, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (303, 11, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (304, 12, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (305, 13, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (306, 14, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (307, 15, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (308, 16, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (309, 17, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (310, 18, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (311, 19, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (312, 20, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (313, 21, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (314, 22, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (315, 23, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (316, 24, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (317, 25, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (318, 26, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (319, 27, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (320, 28, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (321, 29, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (322, 30, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (323, 31, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (324, 32, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (325, 33, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (326, 34, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (327, 35, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (328, 36, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (329, 37, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (330, 38, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (331, 39, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (332, 40, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (333, 41, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (334, 42, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (335, 43, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (337, 45, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (338, 46, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (339, 47, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (340, 48, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (341, 49, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (342, 50, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (343, 51, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (344, 52, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (345, 53, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (346, 54, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (347, 55, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (348, 56, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (349, 57, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (350, 58, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (351, 59, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (352, 60, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (353, 61, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (354, 62, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (355, 63, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (356, 64, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (357, 65, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (358, 66, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (359, 67, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (360, 68, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (361, 69, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (362, 70, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (363, 71, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (364, 72, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (365, 73, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (366, 74, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (367, 75, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (368, 76, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (369, 77, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (370, 78, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (371, 79, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (372, 80, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (373, 81, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (374, 82, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (375, 83, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (376, 84, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (377, 85, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (378, 86, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (379, 87, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (380, 88, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (381, 89, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (382, 90, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (383, 91, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (384, 92, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (385, 93, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (386, 94, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (387, 95, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (388, 96, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (389, 97, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (390, 98, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (391, 99, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (392, 100, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (393, 101, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (394, 102, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (395, 103, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (396, 104, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (397, 105, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (398, 106, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (399, 107, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (400, 108, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (401, 109, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (402, 110, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (403, 111, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (404, 112, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (405, 113, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (406, 114, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (407, 115, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (408, 116, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (409, 117, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (410, 118, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (411, 119, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (412, 120, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (413, 121, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (414, 122, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (415, 123, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (416, 124, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (417, 125, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (418, 126, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (419, 127, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (420, 128, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (421, 129, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (422, 130, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (423, 131, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (424, 132, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (425, 133, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (426, 134, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (427, 135, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (428, 136, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (429, 137, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (430, 138, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (431, 139, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (432, 140, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (433, 141, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (434, 142, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (435, 143, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (436, 144, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (437, 145, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (438, 146, 3, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (439, 1, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (440, 2, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (441, 3, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (442, 4, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (443, 5, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (444, 6, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (445, 7, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (446, 8, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (447, 9, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (448, 10, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (449, 11, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (450, 12, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (451, 13, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (452, 14, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (453, 15, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (454, 16, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (455, 17, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (456, 18, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (457, 19, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (458, 20, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (459, 21, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (460, 22, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (461, 23, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (462, 24, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (463, 25, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (464, 26, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (465, 27, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (466, 28, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (467, 29, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (468, 30, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (469, 31, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (470, 32, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (471, 33, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (472, 34, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (473, 35, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (474, 36, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (475, 37, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (476, 38, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (477, 39, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (478, 40, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (479, 41, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (480, 42, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (481, 43, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (483, 45, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (484, 46, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (485, 47, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (486, 48, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (487, 49, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (488, 50, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (489, 51, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (490, 52, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (491, 53, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (492, 54, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (493, 55, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (494, 56, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (495, 57, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (496, 58, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (497, 59, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (498, 60, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (499, 61, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (500, 62, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (501, 63, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (502, 64, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (503, 65, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (504, 66, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (505, 67, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (506, 68, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (507, 69, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (508, 70, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (509, 71, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (510, 72, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (511, 73, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (512, 74, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (513, 75, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (514, 76, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (515, 77, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (516, 78, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (517, 79, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (518, 80, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (519, 81, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (520, 82, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (521, 83, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (522, 84, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (523, 85, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (524, 86, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (525, 87, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (526, 88, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (527, 89, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (528, 90, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (529, 91, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (530, 92, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (531, 93, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (532, 94, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (533, 95, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (534, 96, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (535, 97, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (536, 98, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (537, 99, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (538, 100, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (539, 101, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (540, 102, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (541, 103, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (542, 104, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (543, 105, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (544, 106, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (545, 107, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (546, 108, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (547, 109, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (548, 110, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (549, 111, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (550, 112, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (551, 113, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (552, 114, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (553, 115, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (554, 116, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (555, 117, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (556, 118, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (557, 119, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (558, 120, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (559, 121, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (560, 122, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (561, 123, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (562, 124, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (563, 125, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (564, 126, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (565, 127, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (566, 128, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (567, 129, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (568, 130, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (569, 131, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (570, 132, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (571, 133, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (572, 134, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (573, 135, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (574, 136, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (575, 137, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (576, 138, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (577, 139, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (578, 140, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (579, 141, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (580, 142, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (581, 143, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (582, 144, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (583, 145, 4, 0);
                    INSERT INTO INVENTARIO
                        (ID,ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (584, 146, 4, 0);
                    -- VISTAS
CREATE OR REPLACE VIEW VISTA_INSUMOS AS
    SELECT 
        INSUMO_INVENTARIO.*, CENTRO.NOMBRE AS 'NOMBRE_CENTRO'
    FROM
        (SELECT 
            INSUMO.*, INVENTARIO.ID_CENTRO, INVENTARIO.CANTIDAD, INVENTARIO.CANTIDAD_MINIMA, INVENTARIO.CANTIDAD_BAJA, INVENTARIO.ID AS ID_INVENTARIO
        FROM
            INSUMO
        INNER JOIN INVENTARIO ON INSUMO.ID = INVENTARIO.ID_INSUMO) AS INSUMO_INVENTARIO
            INNER JOIN
        CENTRO ON CENTRO.ID = INSUMO_INVENTARIO.ID_CENTRO;
SELECT 
    *
FROM
    VISTA_INSUMOS;
        
CREATE OR REPLACE VIEW VISTA_GENERAL_INSUMOS AS
    SELECT 
        NOMBRE, SUM(cantidad) AS CANTIDAD
    FROM
        VISTA_INSUMOS
    GROUP BY ID;

SELECT 
    *
FROM
    VISTA_GENERAL_INSUMOS;

                    -- PROCEDIMIENTOS
                    DELIMITER //
                    CREATE PROCEDURE MODIFICAR_CANTIDAD(IDINSUMO INT, IDCENTRO INT, CAMBIO INT
)
                    BEGIN
                        UPDATE INVENTARIO SET CANTIDAD = CANTIDAD + CAMBIO WHERE ID_INSUMO = IDINSUMO AND ID_CENTRO = IDCENTRO;
                    END
                    // 
DELIMITER ;

CREATE OR REPLACE VIEW VISTA_TRANSACCION AS
    SELECT 
        SUBCONSULTA.*, CENTRO.NOMBRE
    FROM
        (SELECT 
            TRANSACCION.ID,
                TRANSACCION.TIPO,
                TRANSACCION.CANTIDAD,
                TRANSACCION.JUSTIFICACION,
                TRANSACCION.SERVICIO,
                TRANSACCION.PERSONA,
                DATE_SUB(TRANSACCION.FECHA, INTERVAL 5 HOUR) AS FECHA,
                TRANSACCION.ID_CENTRO,
                TRANSACCION.ID_INSUMO,
                INSUMO.NOMBRE AS 'NOMBRE_INSUMO',
                INSUMO.COLOR,
                INSUMO.TIPO AS 'TIPO_INSUMO'
        FROM
            TRANSACCION
        INNER JOIN INSUMO
        WHERE
            TRANSACCION.ID_INSUMO = INSUMO.ID) AS SUBCONSULTA
            INNER JOIN
        CENTRO ON SUBCONSULTA.ID_CENTRO = CENTRO.ID;
SELECT 
    *
FROM
    VISTA_TRANSACCION;
                        
SELECT 
    *
FROM
    INVENTARIO;

-- CODIGO 2021
INSERT INTO INSUMO (NOMBRE, COLOR, TIPO) VALUES ('BOLSA AZUL PEQUENA', 'AZUL', 'BOLSAS');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('147 ', '3', '0');
ALTER TABLE INSUMO MODIFY COLUMN TIPO SET('BOLSAS', 'LIQUIDOS', 'CAFETERIA', 'HERRAMIENTAS', 'INSUMOS_GENERALES', 'EPP', 'TOALLAS', 'PAPELERIA', 'ACTIVOS_FIJOS','OTROS') NOT NULL;

SELECT 
    *
FROM
    inventario;
ALTER TABLE CENTRO ADD COLUMN ABREVIATURA VARCHAR(30);
ALTER TABLE CENTRO ADD COLUMN PASS VARCHAR(30);
UPDATE CENTRO 
SET 
    ABREVIATURA = 'H. Simon Bolivar',
    PASS = 'hsm6432'
WHERE
    ID = '1';
UPDATE CENTRO 
SET 
    ABREVIATURA = 'H. Tunal',
    PASS = 'ht0287'
WHERE
    ID = '2';
UPDATE CENTRO 
SET 
    ABREVIATURA = 'H. Santa Clara',
    PASS = 'hst3920'
WHERE
    ID = '3';
UPDATE CENTRO 
SET 
    ABREVIATURA = 'H. Kennedy',
    PASS = 'hk9102'
WHERE
    ID = '4';

DELIMITER //
CREATE PROCEDURE CREAR_CENTRO(
	IN NOMBRE_CENTRO VARCHAR(30), IN ABREVIACION VARCHAR(30), IN CONTRASENA VARCHAR(30)
)
BEGIN 
	INSERT INTO CENTRO(NOMBRE,ABREVIATURA,PASS) VALUES (NOMBRE_CENTRO,ABREVIACION,CONTRASENA);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE INVENTARIO_CENTRO(
	IN ID INT
)
BEGIN 
	INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (1, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (2, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (3, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (4, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (5, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (6, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (7, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (8, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (9, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (10, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (11, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (12, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (13, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (14, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (15, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (16, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (17, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (18, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (19, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (20, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (21, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (22, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (23, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (24, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (25, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (26, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (27, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (28, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (29, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (30, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (31, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (32, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (33, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (34, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (35, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (36, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (37, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (38, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (39, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (40, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (41, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (42, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (43, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (45, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (46, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (47, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (48, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (49, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (50, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (51, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (52, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (53, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (54, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (55, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (56, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (57, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (58, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (59, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (60, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (61, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (62, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (63, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (64, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (65, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (66, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (67, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (68, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (69, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (70, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (71, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (72, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (73, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (74, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (75, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (76, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (77, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (78, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (79, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (80, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (81, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (82, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (83, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (84, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (85, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (86, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (87, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (88, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (89, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (90, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (91, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (92, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (93, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (94, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (95, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (96, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (97, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (98, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (99, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (100, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (101, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (102, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (103, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (104, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (105, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (106, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (107, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (108, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (109, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (110, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (111, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (112, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (113, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (114, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (115, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (116, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (117, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (118, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (119, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (120, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (121, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (122, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (123, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (124, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (125, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (126, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (127, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (128, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (129, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (130, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (131, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (132, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (133, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (134, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (135, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (136, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (137, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (138, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (139, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (140, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (141, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (142, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (143, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (144, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (145, ID, 0);
                    INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (146, ID, 0);
                        INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (148, ID, 0);
					INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (149, ID, 0);
					INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (150, ID, 0);
					INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (151, ID, 0);
                        INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (152, ID, 0);
                        INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (153, ID, 0);
					INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (154, ID, 0);
					INSERT INTO INVENTARIO
                        (ID_INSUMO,ID_CENTRO,CANTIDAD)
                    VALUES
                        (155, ID, 0);
END //
DELIMITER ;


INSERT INTO `CENTRO` (`ID`, `NOMBRE`, `ABREVIATURA`, `PASS`) VALUES
(5, 'INSTITUTO MATERNO INFANTIL', 'INST. MATERNO INFANTIL', 'IN0293'),
(6, 'HOSPITAL CARDIOVASCULAR', 'H. Cardiovascular', 'hc7485'),
(7, 'MARIO GAITAN DE SOACHA (CAMI)', 'MARIO GAITAN DE SOACHA (CAMI)', 'MGS6518'),
(8, 'HOSPITAL DE FONTIBON', 'H. Fontibon', 'hf4681'),
(9, 'HOSPITAL DE CHAPINERO', 'H. Chapinero', 'hc2083'),
(10, 'HOSPITAL VISTA HERMOSA (CAMI)', 'H. VISTA HERMOSA (CAMI)', 'HVH1923'),
(11, 'HOSPITAL LA VICTORIA', 'H. La Victoria', 'HLV7521'),
(12, 'HOSPITAL DE MEISSEN', 'H. Meissen', 'HM0245'),
(13, 'CLINICA MIOCARDIO', 'CLINICA MIOCARDIO', 'CLI6772'),
(14, 'CLINICA NUEVA', 'CLINICA NUEVA', 'CL9180'),
(15, 'FUNDACION SAN CARLOS', 'Fund. San Carlos', 'FND1201'),
(16, 'HOSPITAL DE ENGATIVA', 'H. Engativa', 'HE5579'),
(17, 'COMPENSAR AV.1RA DE MAYO', 'COMPENSAR AV.1RA DE MAYO', 'CM7020'),
(18, 'COMPENSAR CALLE 153', 'COMPENSAR CALLE 153', 'CM1392'),
(19, 'HOSPITAL DE SUBA', 'H. Suba', 'hs0105'),
(20, 'HOSPITAL SAN BLAS', 'H. San Blas', 'hs6125'),
(21, 'HOSPITAL PABLO VI BOSA (CAMI)', 'H. Pablo VI Bosa (CAMI)', 'hb7214'),
(22, 'DISPENSARIO GILBERTO ECHEVERRY', 'Disp. Gilberto Echeverry', 'DS1038'),
(23, 'HOSPITAL BOSA II NIVEL', 'H. Bosa II Nivel', 'hb2907');


INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('CINTA EMPAQUE 200MT', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('CINTA EMPAQUE 48*100', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('CUADERNO GRAPADO', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('ESFEROS BIC', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('LIBRO BITACORA 100 FOLIOS', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('MARCADOR SHARPIE', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('MARCADORES NEGROS PERMANENTES', 'PAPELERIA');
INSERT INTO INSUMO (NOMBRE,TIPO) VALUES ('PAPEL CONTAC', 'PAPELERIA');

INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '1', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '2', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '3', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '4', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '5', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '6', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '7', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '8', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '9', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '10', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '11', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '12', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '13', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '14', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '15', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '16', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '17', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '18', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '19', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '20', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '21', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '22', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('148', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('149', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('150', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('151', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('152', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('153', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('154', '23', '0');
INSERT INTO INVENTARIO (ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES ('155', '23', '0');

CREATE OR REPLACE VIEW VISTA_INSUMOS_ESCASOS AS
SELECT * FROM VISTA_INSUMOS WHERE CANTIDAD < CANTIDAD_MINIMA;

CREATE OR REPLACE VIEW VISTA_INSUMOS_BAJOS AS
SELECT * FROM VISTA_INSUMOS WHERE CANTIDAD > CANTIDAD_MINIMA AND CANTIDAD <= CANTIDAD_BAJA;
DELIMITER //
CREATE PROCEDURE NUEVO_INSUMO(IN ID_NUEVO_INSUMO INT, IN NOMBRE_INSUMO VARCHAR(40), IN CATEGORIA SET('BOLSAS', 'LIQUIDOS', 'CAFETERIA', 'HERRAMIENTAS', 'INSUMOS_GENERALES', 'EPP', 'TOALLAS', 'PAPELERIA', 'ACTIVOS_FIJOS', 'OTROS'))
BEGIN
	INSERT INTO INSUMO(ID,NOMBRE,TIPO) VALUES (ID_NUEVO_INSUMO, NOMBRE_INSUMO, CATEGORIA);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 1, 0);
	INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 2, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 3, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 4, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 5, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 6, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 7, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 8, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 9, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 10, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 11, 0);
	INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 12, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 13, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 14, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 15, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 16, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 17, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 18, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 19, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 20, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 21, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 22, 0);
    INSERT INTO INVENTARIO(ID_INSUMO, ID_CENTRO, CANTIDAD) VALUES (ID_NUEVO_INSUMO, 23, 0);
END //
DELIMITER ;
select * from vista_insumos_escasos;

CALL NUEVO_INSUMO(156,'ASPIRADORAS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(157,'ASPERSORA','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(158,'ARAGAN','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(159,'AVISOS PREVENTIVOS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(160,'BALDES','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(161,'BASCULA 500 KLG','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(162,'BASCULA 150 KLG','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(163,'BRILLADORA 20" ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(164,'BRILLADORA 17"','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(165,'BRILLADORA DE ALTA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(166,'BRILLADORA','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(167,'CARRO CAFETERIA GRIS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(168,'CANECA CON LLAVE','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(169,'CANECA GRIS CON TAPA 120 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(170,'CANECA ROJA CON TAPA 120 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(171,'CANECA VERDE CON TAPA 120 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(172,'BUGGY ROJO 750 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(173,'BUGGY GRIS 750 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(174,'BUGGY VERDE 750 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(175,'CARRO EXPRIMIDOR RUBBERMAID','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(176,'CARRO EXPRIMIDOR','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(177,'CARRO ORGANIZADOR ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(178,'CARRO TRANSPORTADOR DE ROPA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(179,'CARRO TRANSPORTADOR AMARILLO 120 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(180,'CARRO TRANSPORTADOR ROJO 240 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(181,'CARRO TRANSPORTADOR VERDE 240 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(182,'CARRO TRANSPORTADOR ROJO 120 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(183,'CARRO TRANSPORTADOR ROJO 360 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(184,'CARRO TRANSPORTADOR GRIS 360 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(185,'CARRO TRANSPORTADOR VERDE 360 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(186,'CARRO TRANSPORTADOR AMARILLO 360 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(187,'CARRO TRANSPORTADOR AMARILLO 80 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(188,'CARRO TRANSPORTADOR GRIS 80 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(189,'CARRO TRANSPORTADOR ROJO 80 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(190,'CARRO TRANSPORTADOR GRIS 120 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(191,'CARRO TRANSPORTADOR VERDE 120 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(192,'CARRO TRANSPORTADOR VERDE 80 LTS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(193,'CARRO TRANSPORTADOR CANASTILLAS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(194,'DINAMOMETRO','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(195,'ESCALERILLA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(196,'ESTIBAS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(197,'ESCALERA 5 PASOS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(198,'ESTUFA 2 BOQUILLAS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(199,'EXTENSION ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(200,'GRECA 30 TINTOS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(201,'GRECA 60 TINTOS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(202,'GRECA 120 TINTOS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(203,'HIDROLAVADORA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(204,'HORNO MICROONDAS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(205,'LICUADORA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(206,'LOCKER 12 PUESTOS ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(207,'NEVERA 16 LTS','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(208,'SOPLADORA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(209,'SANDUCHERA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(210,'MANGUERA ','ACTIVOS_FIJOS');
CALL NUEVO_INSUMO(211,'TERMO INDUSTRIAL ','ACTIVOS_FIJOS');
UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=1 AND ID_INSUMO=156;   UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=52 WHERE ID_CENTRO=1 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=1 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=14 WHERE ID_CENTRO=1 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=1 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=1 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=1 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=24 WHERE ID_CENTRO=1 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=13 WHERE ID_CENTRO=1 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=1 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=1 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=1 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=1 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=1 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=1 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=1 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=1 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=1 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=1 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=1 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=1 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=46 WHERE ID_CENTRO=2 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=25 WHERE ID_CENTRO=2 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=12 WHERE ID_CENTRO=2 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=27 WHERE ID_CENTRO=2 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=19 WHERE ID_CENTRO=2 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=18 WHERE ID_CENTRO=2 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=2 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=2 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=2 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=2 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=2 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=22 WHERE ID_CENTRO=3 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=63 WHERE ID_CENTRO=3 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=3 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=3 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=35 WHERE ID_CENTRO=3 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=3 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=3 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=3 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=3 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=3 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=47 WHERE ID_CENTRO=4 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=75 WHERE ID_CENTRO=4 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=17 WHERE ID_CENTRO=4 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=28 WHERE ID_CENTRO=4 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=4 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=16 WHERE ID_CENTRO=4 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=4 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=17 WHERE ID_CENTRO=4 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=4 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=4 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=4 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=4 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=4 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=4 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=4 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=42 WHERE ID_CENTRO=4 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=5 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=18 WHERE ID_CENTRO=5 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=25 WHERE ID_CENTRO=5 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=5 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=5 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=5 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=5 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=5 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=5 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=5 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=5 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=5 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=5 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=5 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=5 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=31 WHERE ID_CENTRO=6 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=20 WHERE ID_CENTRO=6 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=6 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=6 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=12 WHERE ID_CENTRO=6 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=6 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=6 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=6 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=6 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=6 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=6 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=6 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=38 WHERE ID_CENTRO=7 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=28 WHERE ID_CENTRO=7 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=7 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=7 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=7 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=7 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=7 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=7 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=7 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=7 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=7 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=7 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=7 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=7 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=7 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=7 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=7 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=7 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=23 WHERE ID_CENTRO=8 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=8 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=8 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=8 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=8 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=8 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=8 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=8 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=8 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=8 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=8 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=9 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=9 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=9 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=9 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=9 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=9 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=9 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=9 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=9 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=9 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=9 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=9 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=9 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=9 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=13 WHERE ID_CENTRO=10 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=10 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=11 WHERE ID_CENTRO=10 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=10 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=10 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=10 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=10 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=10 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=10 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=24 WHERE ID_CENTRO=11 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=40 WHERE ID_CENTRO=11 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=11 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=11 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=11 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=12 WHERE ID_CENTRO=11 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=13 WHERE ID_CENTRO=11 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=11 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=11 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=11 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=25 WHERE ID_CENTRO=12 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=26 WHERE ID_CENTRO=12 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=12 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=20 WHERE ID_CENTRO=12 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=12 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=12 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=12 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=12 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=12 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=12 WHERE ID_CENTRO=13 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=13 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=13 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=13 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=13 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=13 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=13 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=13 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=13 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=13 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=13 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=14 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=14 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=14 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=14 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=14 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=14 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=14 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=14 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=14 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=14 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=14 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=14 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=14 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=59 WHERE ID_CENTRO=15 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=30 WHERE ID_CENTRO=15 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=11 WHERE ID_CENTRO=15 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=15 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=15 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=25 WHERE ID_CENTRO=15 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=15 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=15 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=15 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=15 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=15 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=15 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=15 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=16 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=24 WHERE ID_CENTRO=16 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=16 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=23 WHERE ID_CENTRO=16 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=16 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=16 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=16 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=16 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=16 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=16 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=16 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=16 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=17 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=17 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=17 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=17 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=17 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=17 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=17 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=17 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=17 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=17 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=17 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=17 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=17 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=18 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=18 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=18 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=18 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=18 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=18 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=18 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=18 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=18 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=34 WHERE ID_CENTRO=19 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=19 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=7 WHERE ID_CENTRO=19 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=15 WHERE ID_CENTRO=19 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=9 WHERE ID_CENTRO=19 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=19 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=19 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=19 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=19 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=19 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=5 WHERE ID_CENTRO=19 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=19 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=19 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=36 WHERE ID_CENTRO=20 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=30 WHERE ID_CENTRO=20 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=8 WHERE ID_CENTRO=20 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=20 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=20 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=19 WHERE ID_CENTRO=20 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=20 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=20 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=20 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=20 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=20 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=17 WHERE ID_CENTRO=21 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=21 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=21 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=21 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=21 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=21 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=21 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=21 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=22 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=13 WHERE ID_CENTRO=22 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=22 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=6 WHERE ID_CENTRO=22 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=22 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=2 WHERE ID_CENTRO=22 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=22 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=22 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=22 AND ID_INSUMO=211;
UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=156;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=157;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=158;	UPDATE INVENTARIO SET CANTIDAD=17 WHERE ID_CENTRO=23 AND ID_INSUMO=159;	UPDATE INVENTARIO SET CANTIDAD=19 WHERE ID_CENTRO=23 AND ID_INSUMO=160;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=161;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=162;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=163;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=164;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=165;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=23 AND ID_INSUMO=166;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=167;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=168;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=169;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=170;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=171;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=172;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=173;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=174;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=175;	UPDATE INVENTARIO SET CANTIDAD=10 WHERE ID_CENTRO=23 AND ID_INSUMO=176;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=177;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=178;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=179;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=180;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=181;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=23 AND ID_INSUMO=182;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=183;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=184;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=185;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=186;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=187;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=188;	UPDATE INVENTARIO SET CANTIDAD=3 WHERE ID_CENTRO=23 AND ID_INSUMO=189;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=190;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=23 AND ID_INSUMO=191;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=192;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=193;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=194;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=23 AND ID_INSUMO=195;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=196;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=197;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=198;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=199;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=200;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=201;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=202;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=203;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=204;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=205;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=206;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=207;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=208;	UPDATE INVENTARIO SET CANTIDAD=0 WHERE ID_CENTRO=23 AND ID_INSUMO=209;	UPDATE INVENTARIO SET CANTIDAD=1 WHERE ID_CENTRO=23 AND ID_INSUMO=210;	UPDATE INVENTARIO SET CANTIDAD=4 WHERE ID_CENTRO=23 AND ID_INSUMO=211;

ALTER TABLE INVENTARIO ADD COLUMN CANTIDAD_BAJA INT DEFAULT(CANTIDAD_MINIMA * 2);
SELECT * FROM CENTRO WHERE ID = '1';
SELECT * FROM TRANSACCION WHERE ID_CENTRO = '1';
SELECT * FROM VISTA_TRANSACCION WHERE FECHA > CURDATE() - INTERVAL 2 DAY ORDER BY FECHA DESC;
SELECT * FROM VISTA_TRANSACCION WHERE FECHA > (CURDATE() - INTERVAL 2 DAY) ORDER BY FECHA DESC;
