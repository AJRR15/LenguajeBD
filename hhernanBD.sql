--SELECT * FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_NUMERIC_CHARACTERS';
--ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
--:app_user
--------------------------------------------------------
--  DDL for Table CATEGORIA
--------------------------------------------------------
  /*CREATE SEQUENCE CATEGORIA_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

  CREATE TABLE CATEGORIA 
   (	ID_CATEGORIA NUMBER, 
	DESCRIPCION VARCHAR2(30)NOT NULL, 
	RUTA_IMAGEN VARCHAR2(1024)NOT NULL, 
	ESTADO NUMBER(1) NOT NULL,
    CONSTRAINT CATE_PK PRIMARY KEY (ID_CATEGORIA)USING INDEX (CREATE INDEX CATEG_ID_IDX ON CATEGORIA (ID_CATEGORIA)) 
   );
   
   CREATE OR REPLACE TRIGGER CATEGORIA_BEFORE_INSERT
    BEFORE INSERT ON CATEGORIA
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_CATEGORIA IS NULL THEN
            SELECT CATEGORIA_SEQ.NEXTVAL
            INTO :NEW.ID_CATEGORIA
            FROM DUAL;
        END IF;
    END;
   
   ALTER TABLE CATEGORIA
   ADD CONSTRAINT FK_CATE FOREIGN KEY (ESTADO)
   REFERENCES ESTADO (ID_ESTADO);*/

--------------------------------------------------------
--  DDL for Table CONTACTO
--------------------------------------------------------
   /*CREATE SEQUENCE CONTACTO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

  CREATE TABLE CONTACTO
   (	ID_CONTACTO NUMBER, 
	NOMBRE VARCHAR2(100)NOT NULL, 
	APELLIDO VARCHAR2(100)NOT NULL, 
	NUMERO NUMBER NOT NULL, 
	MENSAJE VARCHAR2(1200)NOT NULL,
    CONSTRAINT CONT_PK PRIMARY KEY (ID_CONTACTO)USING INDEX (CREATE INDEX CONT_ID_IDX ON CONTACTO (ID_CONTACTO))
   );
   
   CREATE OR REPLACE TRIGGER CONTACTO_BEFORE_INSERT
    BEFORE INSERT ON CONTACTO
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_CONTACTO IS NULL THEN
            SELECT CONTACTO_SEQ.NEXTVAL
            INTO :NEW.ID_CONTACTO
            FROM DUAL;
        END IF;
    END;*/
--------------------------------------------------------
--  DDL for Table DETALLE_FACTURA
--------------------------------------------------------
  /*CREATE SEQUENCE DETALLE_FACTURA_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
  CREATE TABLE DETALLE_FACTURA 
   (	ID_DETALLE_FACTURA NUMBER, 
	ID_FACTURA NUMBER NOT NULL, 
	ID_JUEGO NUMBER NOT NULL, 
	PRECIO NUMBER NOT NULL, 
	CANTIDAD NUMBER NOT NULL,
    CONSTRAINT DETALLE_FACTURA_PK PRIMARY KEY (ID_DETALLE_FACTURA)
  USING INDEX (CREATE INDEX DETALLE_FACTURA_ID_IDX ON DETALLE_FACTURA (ID_DETALLE_FACTURA)),
  CONSTRAINT DETALLE_FACTURA_FK1 FOREIGN KEY (ID_FACTURA)REFERENCES FACTURA (ID_FACTURA),
  CONSTRAINT DETALLE_FACTURA_FK2 FOREIGN KEY (ID_JUEGO)REFERENCES JUEGO (ID_JUEGO) 
   ); 
   
   CREATE OR REPLACE TRIGGER DETALLE_FACTURA_BEFORE_INSERT
    BEFORE INSERT ON DETALLE_FACTURA
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_DETALLE_FACTURA IS NULL THEN
            SELECT DETALLE_FACTURA_SEQ.NEXTVAL
            INTO :NEW.ID_DETALLE_FACTURA
            FROM DUAL;
        END IF;
    END;*/
--------------------------------------------------------
--  DDL for Table FACTURA
--------------------------------------------------------
/*CREATE SEQUENCE FACTURA_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
  CREATE TABLE FACTURA 
   (	ID_FACTURA NUMBER, 
	ID_USUARIO NUMBER NOT NULL, 
	FECHA DATE NOT NULL, 
	TOTAL NUMBER NOT NULL, 
	ESTADO NUMBER NOT NULL,
     CONSTRAINT FACT_PK PRIMARY KEY (ID_FACTURA)USING INDEX (CREATE INDEX FACT_ID_IDX ON FACTURA (ID_FACTURA)),
     CONSTRAINT FACT_FK FOREIGN KEY (ID_USUARIO)REFERENCES USUARIO (ID_USUARIO)
   ); 
   
   CREATE OR REPLACE TRIGGER FACTURA_BEFORE_INSERT
    BEFORE INSERT ON FACTURA
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_FACTURA IS NULL THEN
            SELECT FACTURA_SEQ.NEXTVAL
            INTO :NEW.ID_FACTURA
            FROM DUAL;
        END IF;
    END;
   
    ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACT FOREIGN KEY (ESTADO)
   REFERENCES ESTADO (ID_ESTADO);*/
--------------------------------------------------------
--  DDL for Table JUEGO
--------------------------------------------------------
  /*CREATE SEQUENCE JUEGO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
  CREATE TABLE JUEGO
   (	ID_JUEGO NUMBER, 
	IMAGEN VARCHAR2(1024)NOT NULL, 
	NOMBRE VARCHAR2(50)NOT NULL, 
	EMPRESA VARCHAR2(50)NOT NULL, 
	PRECIO NUMBER NOT NULL, 
	EXISTENCIAS NUMBER NOT NULL, 
	ESTADO NUMBER(1)NOT NULL, 
	ID_CATEGORIA NUMBER NOT NULL,
    CONSTRAINT JUEGO_PK PRIMARY KEY (ID_JUEGO)USING INDEX (CREATE INDEX JUEGO_ID_IDX ON JUEGO (ID_JUEGO)),
    CONSTRAINT JUEGO_FK FOREIGN KEY (ID_CATEGORIA)REFERENCES CATEGORIA (ID_CATEGORIA)
   );
   
   CREATE OR REPLACE TRIGGER JUEGO_BEFORE_INSERT
    BEFORE INSERT ON JUEGO
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_JUEGO IS NULL THEN
            SELECT JUEGO_SEQ.NEXTVAL
            INTO :NEW.ID_JUEGO
            FROM DUAL;
        END IF;
    END;
    
   ALTER TABLE JUEGO
   ADD CONSTRAINT FK_JUEGO FOREIGN KEY (ESTADO)
   REFERENCES ESTADO (ID_ESTADO);*/
--------------------------------------------------------
--  DDL for Table ROL
--------------------------------------------------------
  /*CREATE SEQUENCE ROL_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
  CREATE TABLE ROL 
   (	ID_ROL NUMBER, 
	NOMBRE VARCHAR2(50) NOT NULL, 
	ID_USUARIO NUMBER NOT NULL,
    CONSTRAINT ROL_PK PRIMARY KEY (ID_ROL)USING INDEX (CREATE INDEX ROL_ID_IDX ON ROL (ID_ROL)),
    CONSTRAINT ROL_FK FOREIGN KEY (ID_USUARIO)REFERENCES USUARIO (ID_USUARIO)
   ); 
   
    CREATE OR REPLACE TRIGGER ROL_BEFORE_INSERT
    BEFORE INSERT ON ROL
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_ROL IS NULL THEN
            SELECT ROL_SEQ.NEXTVAL
            INTO :NEW.ID_ROL
            FROM DUAL;
        END IF;
    END;*/
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  /*CREATE SEQUENCE USUARIO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

  CREATE TABLE USUARIO
   (	ID_USUARIO NUMBER, 
	USERNAME VARCHAR2(30) NOT NULL, 
	PASSWORD VARCHAR2(50) NOT NULL, 
	NOMBRE VARCHAR2(30) NOT NULL, 
	APELLIDOS VARCHAR2(60) NOT NULL, 
	CORREO VARCHAR2(50) NOT NULL, 
	TELEFONO VARCHAR2(30)NOT NULL, 
	ESTADO NUMBER(1)NOT NULL,
    CONSTRAINT USU_PK PRIMARY KEY (ID_USUARIO)USING INDEX (CREATE INDEX USU_ID_IDX ON USUARIO (ID_USUARIO))
   );
   

   
   CREATE OR REPLACE TRIGGER USUARIO_BEFORE_INSERT
    BEFORE INSERT ON USUARIO
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_USUARIO IS NULL THEN
            SELECT USUARIO_SEQ.NEXTVAL
            INTO :NEW.ID_USUARIO
            FROM DUAL;
        END IF;
    END;
   
   ALTER TABLE USUARIO
   ADD CONSTRAINT FK_USER FOREIGN KEY (ESTADO)
   REFERENCES ESTADO (ID_ESTADO);*/

--------------------------------------------------------
--  DDL for Table ESTADO
--------------------------------------------------------
  /*CREATE SEQUENCE ESTADO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

  CREATE TABLE ESTADO
   (ID_ESTADO NUMBER, 
	DESCRIPCION VARCHAR2(50) NOT NULL,  
	ESTADO NUMBER(1)NOT NULL,
    CONSTRAINT EST_PK PRIMARY KEY (ID_ESTADO)USING INDEX (CREATE INDEX EST_ID_IDX ON ESTADO (ID_ESTADO))
   );
   
   CREATE OR REPLACE TRIGGER ESTADO_BEFORE_INSERT
    BEFORE INSERT ON ESTADO
    FOR EACH ROW
    BEGIN
        IF :NEW.ID_ESTADO IS NULL THEN
            SELECT ESTADO_SEQ.NEXTVAL
            INTO :NEW.ID_ESTADO
            FROM DUAL;
        END IF;
    END;*/

-----------------------------------------------------------------------------------------------------------------------------------------------------------  

/*Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('Accion','https://wallpaperaccess.com/full/5485133.jpg',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('Aventura','https://miracomosehace.com/wp-content/uploads/2021/06/rayman-adventures.jpg',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('Deporte','https://www.fantasymundo.com/wp-content/uploads/2021/02/videosjuegos-deporte-696x380.jpg',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('Estrategia','https://media.vandal.net/m/1-2019/2019181558171_1.jpg',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('RPG','https://www.mundodeportivo.com/alfabeta/hero/2020/09/juegos-rpg-pc-2.jpg?width=1200',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('Puzzle','https://i.blogs.es/50cfcf/juegos-de-puzzles/1366_2000.jpg',1);
Insert into CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) values ('ajedrez','https://prueba.jpg',1);*/

/*Insert into CONTACTO (NOMBRE,APELLIDO,NUMERO,MENSAJE) values ('Hector','Hernandez',72063542,'Tienen COD?');
Insert into CONTACTO (NOMBRE,APELLIDO,NUMERO,MENSAJE) values ('Ana','Vargas',88114617,'Quiero Elder Ring, please');*/

/*Insert into DETALLE_FACTURA (ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD) values (1,16,59.99,1);
Insert into DETALLE_FACTURA (ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD) values (1,18,80.99,1);*/

/*Insert into FACTURA (ID_USUARIO,FECHA,TOTAL,ESTADO) values (2,'27/JUL/24',140.98,1);*/

/*Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://metodologic.net/wp-content/uploads/2017/11/Mario_Odyssey_portada.jpg','Super Mario Odyssey','Nintendo',59.99,4,1,2);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://media.vandal.net/i/1440x1080/5-2023/20235223395250_1.jpg','The Legend of Zelda: Breath of the Wild','Nintendo',59.99,4,1,2);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://e1.pngegg.com/pngimages/517/222/png-clipart-grand-theft-auto-v-game-icon-gta-5-7-gta-v-game-cover-thumbnail.png','Grand Theft Auto V','Rockstar Games',29.99,2,1,1);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://futbolete.com/apuestas/wp-content/uploads/2021/09/FIFA-22-Esta-es-la-valoracion-de-Kylian-Mbappe-portada-del-juego-1200x900.jpg','FIFA 22','EA Sports',49.99,7,1,3);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://img.zonared.com/images/noticias/portada/47000/47269-h2.jpg','Minecraft','Mojang Studios',29.99,2,1,2);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://media.vandal.net/i/640x360/12-2022/202212111754215_1.jpg','The Witcher 3: Wild Hunt','CD Projekt',39.99,4,1,4);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://i.blogs.es/88d2ec/cod_mw/450_1000.webp','Call of Duty: Modern Warfare','Activision',59.99,8,1,1);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_AmongUs_image1600w.jpg','Among Us','InnerSloth',4.99,5,1,5);
Insert into JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) values ('https://e00-marca.uecdn.es/assets/multimedia/imagenes/2023/08/29/16933298615638.jpg','League of Legends','Riot Games',80.99,9,1,4);*/

/*Insert into ROL (NOMBRE,ID_USUARIO) values ('ROLE_ADMIN',1);
Insert into ROL (NOMBRE,ID_USUARIO) values ('ROLE_USER',1);
Insert into ROL (NOMBRE,ID_USUARIO) values ('ROLE_USER',3);*/

/*Insert into USUARIO (USERNAME,PASSWORD,NOMBRE,APELLIDOS,CORREO,TELEFONO,ESTADO) values ('hhernan','B2BC1FCE7E4FCC943D1B3C7C6B41C580','Hector','Hernandez','hhernan93vargas@gmail.com','72063542',1);
Insert into USUARIO (USERNAME,PASSWORD,NOMBRE,APELLIDOS,CORREO,TELEFONO,ESTADO) values ('ann','7D089506B8B03F3A720E037F126C40AE','Ana','Vargas','annv@gmail.com','88114617',1);
Insert into USUARIO (USERNAME,PASSWORD,NOMBRE,APELLIDOS,CORREO,TELEFONO,ESTADO) values ('hcin','6F8849611B29EAA80890A9C5767A022C','Cindy','Hernandez','cin@gmail.com','88888888',1);*/

/*Insert into ESTADO (DESCRIPCION,ESTADO) values ('Activo',1);
Insert into ESTADO (DESCRIPCION,ESTADO) values ('Inactivo',0);*/


--------------------------------------------------------
--  DDL for Procedure ADD_CATEGORIA
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE ADD_CATEGORIA (DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER ) AS

BEGIN
    INSERT INTO CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) VALUES (DESCRIP,IMG,ACT);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_CONTACTO
--------------------------------------------------------
/*CREATE OR REPLACE EDITIONABLE PROCEDURE ADD_CONTACTO (NOMBRE IN VARCHAR2,APELLIDO IN VARCHAR2,NUMERO IN NUMBER,MENSAJE IN VARCHAR2 ) AS

BEGIN
    INSERT INTO CONTACTO (NOMBRE,APELLIDO,NUMERO,MENSAJE) VALUES (NOMBRE,APELLIDO,NUMERO,MENSAJE);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_DETALLE_FACTURA
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE ADD_DETALLE_FACTURA (IDFACT IN NUMBER,IDJUEGO IN NUMBER,PRECIO IN NUMBER,CANTIDAD IN NUMBER ) AS
BEGIN
    INSERT INTO DETALLE_FACTURA (ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD) VALUES (IDFACT,IDJUEGO,PRECIO,CANTIDAD);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_FACTURA
--------------------------------------------------------
/*CREATE OR REPLACE  PROCEDURE ADD_FACTURA (USID IN NUMBER,FECHA IN DATE,TOTAL IN NUMBER) AS

BEGIN
    INSERT INTO FACTURA (ID_USUARIO,FECHA,TOTAL) VALUES (USID,FECHA,TOTAL);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_JUEGO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE ADD_JUEGO (IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER ) AS 
BEGIN
    INSERT INTO JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) VALUES (IMG,NOM,EMP,PREC,EXI,EST,ID_CAT);
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_ROL
--------------------------------------------------------
/*CREATE OR REPLACE  PROCEDURE ADD_ROL (RNAME IN VARCHAR2,IDUSER IN NUMBER) AS
    VCOD NUMBER;
    VMES VARCHAR2(500);
BEGIN
    INSERT INTO ROL (NOMBRE,ID_USUARIO) VALUES (RNAME,IDUSER);
EXCEPTION
    WHEN VALUE_ERROR THEN
        VMES := SQLERRM;
        VCOD := SQLCODE;
        INSERT INTO ERRORES_AUDIT VALUES (USER,'ADD_ROL',SYSDATE, VCOD || ' - '|| VMES );
END;*/
--------------------------------------------------------
--  DDL for Procedure ADD_USUARIO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE ADD_USUARIO (UNAME IN VARCHAR2,PASS IN VARCHAR2,UNOM IN VARCHAR2,APELL IN VARCHAR2,CORRE IN VARCHAR2,TEL IN VARCHAR2,EST IN NUMBER ) AS
    VCOD NUMBER;
    VMES VARCHAR2(500);
BEGIN
    INSERT INTO USUARIO (USERNAME, PASSWORD,NOMBRE, APELLIDOS,CORREO, TELEFONO,ESTADO) VALUES (UNAME,PASS,UNOM, APELL,CORRE, TEL,EST);
EXCEPTION
    WHEN VALUE_ERROR THEN
        VMES := SQLERRM;
        VCOD := SQLCODE;
        INSERT INTO ERRORES_AUDIT VALUES (USER,'ADD_ROL',SYSDATE, VCOD || ' - '|| VMES );
END;*/
--------------------------------------------------------
--  DDL for Procedure DELETE_CATEGORIA
--------------------------------------------------------

/*CREATE OR REPLACE PROCEDURE DELETE_CATEGORIA (CID IN NUMBER ) AS
BEGIN
    DELETE FROM CATEGORIA WHERE ID_CATEGORIA=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/

--------------------------------------------------------
--  DDL for Procedure DELETE_CONTACTO
--------------------------------------------------------
/*CREATE OR REPLACE EDITIONABLE PROCEDURE DELETE_CONTACTO (CID IN NUMBER ) AS
BEGIN
    DELETE FROM CONTACTO WHERE ID_CONTACTO=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure DELETE_JUEGO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE DELETE_JUEGO (JID IN NUMBER ) AS
BEGIN
    DELETE FROM JUEGO WHERE ID_JUEGO=JID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure DELETE_ROL
--------------------------------------------------------
/*CREATE OR REPLACE EDITIONABLE PROCEDURE DELETE_ROL (IDU IN NUMBER ) AS
BEGIN
    DELETE FROM ROL WHERE ID_USUARIO=IDU;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/ 
--------------------------------------------------------
--  DDL for Procedure DELETE_USUARIO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE DELETE_USUARIO (USEID IN NUMBER ) AS
BEGIN
    PACKAGE_ROL.DELETE_ROL(USEID);
    DELETE FROM USUARIO WHERE ID_USUARIO=USEID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  GET_CONTACTO
--------------------------------------------------------
/*create or replace PROCEDURE GET_CONTACTO (DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_CONTACTO,NOMBRE,APELLIDO,NUMERO,MENSAJE FROM CONTACTO;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
-------------------------------------------------------
--  GET_CATEGORIA
--------------------------------------------------------
/*create or replace PROCEDURE GET_CATEGORIA (DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION,RUTA_IMAGEN,ESTADO FROM CATEGORIA;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
 --------------------------------------------------------
--  GET_CATEGORIA_ONE
--------------------------------------------------------
/*create or replace PROCEDURE GET_ONE_CATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION,RUTA_IMAGEN,ESTADO FROM CATEGORIA WHERE ID_CATEGORIA=CID;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  GET_CATEGORIA_DESC
--------------------------------------------------------
/*create or replace PROCEDURE GET_CATEGORIA_DESC (DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION FROM CATEGORIA;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
 --------------------------------------------------------
--  GET_CATEGORIAS
--------------------------------------------------------
/*create or replace PROCEDURE GET_CATEGORIAS (DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_CATEGORIA, DESCRIPCION FROM CATEGORIA;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  GET_FACTURA
--------------------------------------------------------
/*create or replace PROCEDURE GET_FACTURA_ID (FECH IN DATE,DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_FACTURA FROM FACTURA WHERE FECHA=FECH;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
--------------------------------------------------------
--  GET_JUEGOS
--------------------------------------------------------
/*create or replace PROCEDURE GET_JUEGOS (DATOS OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
END;*/

/*create or replace PROCEDURE GET_JUEGOSBYCATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO WHERE ID_CATEGORIA=CID;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
END;*/
--------------------------------------------------------
--  DDL for Procedure UPDATE_CATEGORIA
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE UPDATE_CATEGORIA (CID IN NUMBER,DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER ) AS
BEGIN
    UPDATE CATEGORIA SET DESCRIPCION = DESCRIP ,RUTA_IMAGEN = IMG,ESTADO = ACT WHERE ID_CATEGORIA=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure UPDATE_JUEGO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE UPDATE_JUEGO (JID IN NUMBER,IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER ) AS
BEGIN
    UPDATE JUEGO SET IMAGEN = IMG ,NOMBRE = NOM,EMPRESA = EMP,PRECIO = PREC ,EXISTENCIAS = EXI ,ESTADO = EST,ID_CATEGORIA=ID_CAT  WHERE ID_JUEGO=JID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;

create or replace PROCEDURE GET_ONE_JUEGO (JID IN NUMBER,DATOS OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO WHERE ID_JUEGO=JID;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
END;*/
--------------------------------------------------------
--  DDL for Procedure UPDATE_USUARIO
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE UPDATE_USUARIO (USERID IN NUMBER,USNAM IN VARCHAR2,CONTRAS IN VARCHAR2,NOMBR IN VARCHAR2,APELLI IN VARCHAR2,MAIL IN VARCHAR2,PHONE IN VARCHAR2,ACTV IN NUMBER) AS
BEGIN
    UPDATE USUARIO SET USERNAME=USNAM, PASSWORD=CONTRAS,NOMBRE=NOMBR, APELLIDOS=APELLI,CORREO=MAIL, TELEFONO=PHONE,ESTADO=ACTV WHERE ID_USUARIO=USERID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/
--------------------------------------------------------
--  DDL for Procedure UPDATE_FACTURA
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE UPDATE_FACTURA (FID IN NUMBER,TOTL IN NUMBER) AS

BEGIN
    UPDATE FACTURA SET TOTAL=TOTL WHERE ID_FACTURA=FID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
END;*/

 --------------------------------------------------------
--  GET_USUARIOS
--------------------------------------------------------
/*Create or replace PROCEDURE GET_USUARIOS (DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
 --------------------------------------------------------
--  GET_USUARIOBYID
--------------------------------------------------------
/*Create or replace PROCEDURE GET_USUARIOBYID (UID IN NUMBER, DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
   WHERE ID_USUARIO = UID;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  GET_USUARIOBYUSERNAME
--------------------------------------------------------
/*Create or replace PROCEDURE GET_USUARIOBYUSERNAME (UNAME IN VARCHAR2, DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
   WHERE USERNAME = UNAME;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  GET_USERNAMEANDPASSWORD
--------------------------------------------------------
/*Create or replace PROCEDURE GET_USERNAMEANDPASSWORD(UNAME IN VARCHAR2, PASS IN VARCHAR2, DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
   WHERE USERNAME = UNAME and PASSWORD = PASS;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  GET_USERNAMEANDCORREO
--------------------------------------------------------
/*Create or replace PROCEDURE GET_USERNAMEORCORREO(UNAME IN VARCHAR2, CORRE IN VARCHAR2, DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
   WHERE USERNAME = UNAME OR CORREO = CORRE;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--  USUARIO_EXISTE
--------------------------------------------------------
/*CREATE OR REPLACE FUNCTION USUARIO_EXISTE (UNAME IN VARCHAR2, CORRE IN VARCHAR2) RETURN NUMBER
IS
BEGIN
    FOR DATOS IN (SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO 
                  FROM USUARIO) LOOP
        IF DATOS.USERNAME = UNAME OR DATOS.CORREO = CORRE THEN
            RETURN 1; -- TRUE
        END IF;
    END LOOP;
    RETURN 0; -- FALSE
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Datos de entrada no válidos.');
        RETURN -1;

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se encontró la tabla o los datos.');
        RETURN -1;
END;*/

  --------------------------------------------------------
--GET_ROLES
--------------------------------------------------------
/*Create or replace PROCEDURE GET_ROLES(UID IN NUMBER, DATOS OUT SYS_REFCURSOR)
 AS
 BEGIN
   OPEN DATOS FOR SELECT NOMBRE FROM ROL
   WHERE ID_USUARIO = UID;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
 END;*/
  --------------------------------------------------------
--GET_FACTURAS
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE GET_FACTURAS (DATOS OUT SYS_REFCURSOR)
AS  
    VSQL VARCHAR2(1024);
BEGIN
    VSQL := 'SELECT ID_FACTURA, ID_USUARIO,FECHA,TOTAL
             FROM FACTURA';
    OPEN DATOS FOR VSQL;
EXCEPTION    
   WHEN TOO_MANY_ROWS THEN
     DBMS_OUTPUT.PUT_LINE('***   ERROR DE FILAS MULTIPLES  ****');       
 WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('***   NO HAY DATOS  ****');      
END;*/
  --------------------------------------------------------
--GET_DETALLES
--------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE GET_DETALLES (DATOS OUT SYS_REFCURSOR)
AS  
    VSQL VARCHAR2(1024);
BEGIN
    VSQL := 'SELECT ID_DETALLE_FACTURA,ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD
             FROM DETALLE_FACTURA';
    OPEN DATOS FOR VSQL;
EXCEPTION    
   WHEN TOO_MANY_ROWS THEN
     DBMS_OUTPUT.PUT_LINE('***   ERROR DE FILAS MULTIPLES  ****');       
 WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('***   NO HAY DATOS  ****');      
END;*/
--------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_CATEGORIA AS
    PROCEDURE ADD_CATEGORIA (DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER );
    PROCEDURE GET_CATEGORIA (DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_ONE_CATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR);
    PROCEDURE DELETE_CATEGORIA (CID IN NUMBER );
    PROCEDURE UPDATE_CATEGORIA (CID IN NUMBER,DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER );
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_CATEGORIA AS
    PROCEDURE ADD_CATEGORIA (DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER ) AS
    BEGIN
    INSERT INTO CATEGORIA (DESCRIPCION,RUTA_IMAGEN,ESTADO) VALUES (DESCRIP,IMG,ACT);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE GET_CATEGORIA (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION,RUTA_IMAGEN,ESTADO FROM CATEGORIA;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_ONE_CATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION,RUTA_IMAGEN,ESTADO FROM CATEGORIA WHERE ID_CATEGORIA=CID;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE DELETE_CATEGORIA (CID IN NUMBER ) AS
    BEGIN
    DELETE FROM CATEGORIA WHERE ID_CATEGORIA=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la categoría con ID para eliminar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE UPDATE_CATEGORIA (CID IN NUMBER,DESCRIP IN VARCHAR2,IMG IN VARCHAR2,ACT IN NUMBER ) AS
    BEGIN
    UPDATE CATEGORIA SET DESCRIPCION = DESCRIP ,RUTA_IMAGEN = IMG,ESTADO = ACT WHERE ID_CATEGORIA=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
END;*/
----------------------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_CONTACTO AS
    PROCEDURE GET_CONTACTO (DATOS OUT SYS_REFCURSOR);
    PROCEDURE ADD_CONTACTO (NOMBRE IN VARCHAR2,APELLIDO IN VARCHAR2,NUMERO IN NUMBER,MENSAJE IN VARCHAR2);
    PROCEDURE DELETE_CONTACTO (CID IN NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_CONTACTO AS
    PROCEDURE GET_CONTACTO (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_CONTACTO,NOMBRE,APELLIDO,NUMERO,MENSAJE FROM CONTACTO;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE ADD_CONTACTO (NOMBRE IN VARCHAR2,APELLIDO IN VARCHAR2,NUMERO IN NUMBER,MENSAJE IN VARCHAR2 ) AS
    BEGIN
    INSERT INTO CONTACTO (NOMBRE,APELLIDO,NUMERO,MENSAJE) VALUES (NOMBRE,APELLIDO,NUMERO,MENSAJE);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE DELETE_CONTACTO (CID IN NUMBER ) AS
    BEGIN
    DELETE FROM CONTACTO WHERE ID_CONTACTO=CID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la categoría con ID para eliminar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
END;*/
------------------------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_DETALLE_FACTURA AS
    PROCEDURE ADD_DETALLE_FACTURA (IDFACT IN NUMBER,IDJUEGO IN NUMBER,PRECIO IN NUMBER,CANTIDAD IN NUMBER);
    PROCEDURE GET_DETALLES (DATOS OUT SYS_REFCURSOR);
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_DETALLE_FACTURA AS
    PROCEDURE ADD_DETALLE_FACTURA (IDFACT IN NUMBER,IDJUEGO IN NUMBER,PRECIO IN NUMBER,CANTIDAD IN NUMBER ) AS
    BEGIN
    INSERT INTO DETALLE_FACTURA (ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD) VALUES (IDFACT,IDJUEGO,PRECIO,CANTIDAD);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE GET_DETALLES (DATOS OUT SYS_REFCURSOR)
    AS  
    VSQL VARCHAR2(1024);
    BEGIN
    VSQL := 'SELECT ID_DETALLE_FACTURA,ID_FACTURA,ID_JUEGO,PRECIO,CANTIDAD
             FROM DETALLE_FACTURA';
    OPEN DATOS FOR VSQL;
    EXCEPTION    
    WHEN TOO_MANY_ROWS THEN
     DBMS_OUTPUT.PUT_LINE('***   ERROR DE FILAS MULTIPLES  ****');       
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('***   NO HAY DATOS  ****');      
    END;
END;*/
-------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_FACTURA AS
    PROCEDURE ADD_FACTURA (USID IN NUMBER,FECHA IN DATE,TOTAL IN NUMBER);
    PROCEDURE UPDATE_FACTURA (FID IN NUMBER,TOTL IN NUMBER);
    PROCEDURE GET_FACTURA_ID (FECH IN DATE,DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_FACTURAS (DATOS OUT SYS_REFCURSOR);
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_FACTURA AS
    PROCEDURE ADD_FACTURA (USID IN NUMBER,FECHA IN DATE,TOTAL IN NUMBER) AS
    BEGIN
    INSERT INTO FACTURA (ID_USUARIO,FECHA,TOTAL) VALUES (USID,FECHA,TOTAL);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE UPDATE_FACTURA (FID IN NUMBER,TOTL IN NUMBER) AS
    BEGIN
    UPDATE FACTURA SET TOTAL=TOTL WHERE ID_FACTURA=FID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE GET_FACTURA_ID (FECH IN DATE,DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_FACTURA FROM FACTURA WHERE FECHA=FECH;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_FACTURAS (DATOS OUT SYS_REFCURSOR)
    AS  
    VSQL VARCHAR2(1024);
    BEGIN
    VSQL := 'SELECT ID_FACTURA, ID_USUARIO,FECHA,TOTAL
             FROM FACTURA';
    OPEN DATOS FOR VSQL;
    EXCEPTION    
    WHEN TOO_MANY_ROWS THEN
     DBMS_OUTPUT.PUT_LINE('***   ERROR DE FILAS MULTIPLES  ****');       
    WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('***   NO HAY DATOS  ****');      
    END;
END;*/
----------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_JUEGO AS
    PROCEDURE GET_JUEGOS (DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_ONE_JUEGO (JID IN NUMBER,DATOS OUT SYS_REFCURSOR);
    PROCEDURE ADD_JUEGO (IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER);
    PROCEDURE DELETE_JUEGO (JID IN NUMBER);
    PROCEDURE UPDATE_JUEGO (JID IN NUMBER,IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER);
    PROCEDURE GET_CATEGORIAS (DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_JUEGOSBYCATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_CATEGORIA_DESC (DATOS OUT SYS_REFCURSOR);
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_JUEGO AS
    PROCEDURE GET_JUEGOS (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_ONE_JUEGO (JID IN NUMBER,DATOS OUT SYS_REFCURSOR) AS
    BEGIN
    OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO WHERE ID_JUEGO=JID;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE ADD_JUEGO (IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER ) AS 
    BEGIN
    INSERT INTO JUEGO (IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA) VALUES (IMG,NOM,EMP,PREC,EXI,EST,ID_CAT);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE DELETE_JUEGO (JID IN NUMBER ) AS
    BEGIN
    DELETE FROM JUEGO WHERE ID_JUEGO=JID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la categoría con ID para eliminar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE UPDATE_JUEGO (JID IN NUMBER,IMG IN VARCHAR2,NOM IN VARCHAR2,EMP IN VARCHAR2,PREC IN NUMBER,EXI IN NUMBER,EST IN NUMBER,ID_CAT IN NUMBER ) AS
    BEGIN
    UPDATE JUEGO SET IMAGEN = IMG ,NOMBRE = NOM,EMPRESA = EMP,PRECIO = PREC ,EXISTENCIAS = EXI ,ESTADO = EST,ID_CATEGORIA=ID_CAT  WHERE ID_JUEGO=JID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE GET_CATEGORIAS (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_CATEGORIA, DESCRIPCION FROM CATEGORIA;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_JUEGOSBYCATEGORIA (CID IN NUMBER,DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_JUEGO,IMAGEN,NOMBRE,EMPRESA,PRECIO,EXISTENCIAS,ESTADO,ID_CATEGORIA FROM JUEGO WHERE ID_CATEGORIA=CID;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_CATEGORIA_DESC (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_CATEGORIA,DESCRIPCION FROM CATEGORIA;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
END;*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_ROL AS
    PROCEDURE ADD_ROL (RNAME IN VARCHAR2,IDUSER IN NUMBER);
    PROCEDURE DELETE_ROL (IDU IN NUMBER);
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_ROL AS
    PROCEDURE ADD_ROL (RNAME IN VARCHAR2,IDUSER IN NUMBER) AS
    VCOD NUMBER;
    VMES VARCHAR2(500);
    BEGIN
    INSERT INTO ROL (NOMBRE,ID_USUARIO) VALUES (RNAME,IDUSER);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        VMES := SQLERRM;
        VCOD := SQLCODE;
        INSERT INTO ERRORES_AUDIT VALUES (USER,'ADD_ROL',SYSDATE, VCOD || ' - '|| VMES );
    END;
    
    PROCEDURE DELETE_ROL (IDU IN NUMBER ) AS
    BEGIN
    DELETE FROM ROL WHERE ID_USUARIO=IDU;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el ID para eliminar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END; 
END;*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PACKAGE PACKAGE_USUARIO AS
    PROCEDURE GET_USUARIOS (DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_USUARIOBYID (UID IN NUMBER, DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_USUARIOBYUSERNAME (UNAME IN VARCHAR2, DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_USERNAMEANDPASSWORD(UNAME IN VARCHAR2, PASS IN VARCHAR2, DATOS OUT SYS_REFCURSOR);
    PROCEDURE GET_USERNAMEORCORREO(UNAME IN VARCHAR2, CORRE IN VARCHAR2, DATOS OUT SYS_REFCURSOR);
    PROCEDURE ADD_USUARIO (UNAME IN VARCHAR2,PASS IN VARCHAR2,UNOM IN VARCHAR2,APELL IN VARCHAR2,CORRE IN VARCHAR2,TEL IN VARCHAR2,EST IN NUMBER);
    PROCEDURE GET_ROLES(UID IN NUMBER, DATOS OUT SYS_REFCURSOR);
    PROCEDURE UPDATE_USUARIO (USERID IN NUMBER,USNAM IN VARCHAR2,CONTRAS IN VARCHAR2,NOMBR IN VARCHAR2,APELLI IN VARCHAR2,MAIL IN VARCHAR2,PHONE IN VARCHAR2,ACTV IN NUMBER);
    PROCEDURE DELETE_USUARIO (USEID IN NUMBER);
    FUNCTION USUARIO_EXISTE (UNAME IN VARCHAR2, CORRE IN VARCHAR2)RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY PACKAGE_USUARIO AS
    PROCEDURE GET_USUARIOS (DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO;
    EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_USUARIOBYID (UID IN NUMBER, DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
    WHERE ID_USUARIO = UID;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_USUARIOBYUSERNAME (UNAME IN VARCHAR2, DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
    WHERE USERNAME = UNAME;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_USERNAMEANDPASSWORD(UNAME IN VARCHAR2, PASS IN VARCHAR2, DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
    WHERE USERNAME = UNAME and PASSWORD = PASS;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE GET_USERNAMEORCORREO(UNAME IN VARCHAR2, CORRE IN VARCHAR2, DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO
    WHERE USERNAME = UNAME OR CORREO = CORRE;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE ADD_USUARIO (UNAME IN VARCHAR2,PASS IN VARCHAR2,UNOM IN VARCHAR2,APELL IN VARCHAR2,CORRE IN VARCHAR2,TEL IN VARCHAR2,EST IN NUMBER ) AS
    VCOD NUMBER;
    VMES VARCHAR2(500);
    BEGIN
    INSERT INTO USUARIO (USERNAME, PASSWORD,NOMBRE, APELLIDOS,CORREO, TELEFONO,ESTADO) VALUES (UNAME,PASS,UNOM, APELL,CORRE, TEL,EST);
    EXCEPTION
    WHEN VALUE_ERROR THEN
        VMES := SQLERRM;
        VCOD := SQLCODE;
        INSERT INTO ERRORES_AUDIT VALUES (USER,'ADD_ROL',SYSDATE, VCOD || ' - '|| VMES );
    END;
    
    PROCEDURE DELETE_USUARIO (USEID IN NUMBER ) AS
    BEGIN
    PACKAGE_ROL.DELETE_ROL(USEID);
    DELETE FROM USUARIO WHERE ID_USUARIO=USEID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró la categoría con ID para eliminar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    PROCEDURE GET_ROLES(UID IN NUMBER, DATOS OUT SYS_REFCURSOR)AS
    BEGIN
    OPEN DATOS FOR SELECT NOMBRE FROM ROL
    WHERE ID_USUARIO = UID;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera un tipo de dato diferente en los parámetros de entrada.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado al abrir el cursor: ' || SQLERRM);
    END;
    
    PROCEDURE UPDATE_USUARIO (USERID IN NUMBER,USNAM IN VARCHAR2,CONTRAS IN VARCHAR2,NOMBR IN VARCHAR2,APELLI IN VARCHAR2,MAIL IN VARCHAR2,PHONE IN VARCHAR2,ACTV IN NUMBER) AS
    BEGIN
    UPDATE USUARIO SET USERNAME=USNAM, PASSWORD=CONTRAS,NOMBRE=NOMBR, APELLIDOS=APELLI,CORREO=MAIL, TELEFONO=PHONE,ESTADO=ACTV WHERE ID_USUARIO=USERID;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar.');
    END IF;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Se espera otro tipo de dato de entrada.');
    END;
    
    FUNCTION USUARIO_EXISTE (UNAME IN VARCHAR2, CORRE IN VARCHAR2) RETURN NUMBER
    IS
    BEGIN
        FOR DATOS IN (SELECT ID_USUARIO, USERNAME, PASSWORD, NOMBRE, APELLIDOS, CORREO, TELEFONO, ESTADO FROM USUARIO) LOOP
            IF DATOS.USERNAME = UNAME OR DATOS.CORREO = CORRE THEN
                RETURN 1; -- TRUE
            END IF;
        END LOOP;
        RETURN 0; -- FALSE
    EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Error: Datos de entrada no válidos.');
            RETURN -1;

        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No se encontró la tabla o los datos.');
            RETURN -1;
    END;
END;*/




