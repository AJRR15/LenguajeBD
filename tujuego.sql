--------------------------------------------------------
--  File created - lunes-julio-01-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CATEGORIA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."CATEGORIA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CONTACTO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."CONTACTO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence FACTURA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."FACTURA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence JUEGO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."JUEGO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ROL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."ROL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USUARIO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."USUARIO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VENTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINISTRADOR"."VENTA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORIA
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."CATEGORIA" 
   (	"ID_CATEGORIA" NUMBER, 
	"DESCRIPCION" VARCHAR2(30 BYTE), 
	"RUTA_IMAGEN" VARCHAR2(1024 BYTE), 
	"ACTIVO" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table CONTACTO
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."CONTACTO" 
   (	"ID_CONTACTO" NUMBER, 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"APELLIDO" VARCHAR2(100 BYTE), 
	"NUMERO" NUMBER, 
	"MENSAJE" VARCHAR2(1200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table FACTURA
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."FACTURA" 
   (	"ID_FACTURA" NUMBER, 
	"ID_USUARIO" NUMBER DEFAULT NULL, 
	"FECHA" DATE DEFAULT NULL, 
	"TOTAL" FLOAT(126) DEFAULT NULL, 
	"ESTADO" NUMBER DEFAULT NULL
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table JUEGO
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."JUEGO" 
   (	"ID_JUEGO" NUMBER, 
	"IMAGEN" VARCHAR2(1024 BYTE), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"EMPRESA" VARCHAR2(45 BYTE), 
	"PRECIO" FLOAT(126), 
	"EXISTENCIAS" NUMBER, 
	"ACTIVO" NUMBER(1,0), 
	"ID_CATEGORIA" NUMBER DEFAULT NULL
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table ROL
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."ROL" 
   (	"ID_ROL" NUMBER, 
	"NOMBRE" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"ID_USUARIO" NUMBER DEFAULT NULL
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."USUARIO" 
   (	"ID_USUARIO" NUMBER, 
	"USERNAME" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"CONTRASENA" VARCHAR2(512 BYTE) DEFAULT NULL, 
	"NOMBRE" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"APELLIDOS" VARCHAR2(30 BYTE) DEFAULT NULL, 
	"CORREO" VARCHAR2(25 BYTE) DEFAULT NULL, 
	"TELEFONO" VARCHAR2(15 BYTE) DEFAULT NULL, 
	"RUTA_IMAGEN" VARCHAR2(1024 BYTE) DEFAULT NULL, 
	"ACTIVO" NUMBER(1,0) DEFAULT NULL
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
--------------------------------------------------------
--  DDL for Table VENTA
--------------------------------------------------------

  CREATE TABLE "ADMINISTRADOR"."VENTA" 
   (	"ID_VENTA" NUMBER, 
	"ID_FACTURA" NUMBER DEFAULT NULL, 
	"ID_JUEGO" NUMBER DEFAULT NULL, 
	"PRECIO" FLOAT(126) DEFAULT NULL, 
	"CANTIDAD" NUMBER DEFAULT NULL
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "PROYECTO_LENGUAJES" ;
REM INSERTING into ADMINISTRADOR.CATEGORIA
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.CONTACTO
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.FACTURA
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.JUEGO
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.ROL
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.USUARIO
SET DEFINE OFF;
REM INSERTING into ADMINISTRADOR.VENTA
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Trigger CATEGORIA_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."CATEGORIA_BEFORE_INSERT" 
BEFORE INSERT ON categoria
FOR EACH ROW
BEGIN
  :NEW.id_categoria := categoria_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."CATEGORIA_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CONTACTO_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."CONTACTO_BEFORE_INSERT" 
BEFORE INSERT ON contacto
FOR EACH ROW
BEGIN
  :NEW.id_contacto := contacto_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."CONTACTO_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FACTURA_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."FACTURA_BEFORE_INSERT" 
BEFORE INSERT ON factura
FOR EACH ROW
BEGIN
  :NEW.id_factura := factura_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."FACTURA_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JUEGO_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."JUEGO_BEFORE_INSERT" 
BEFORE INSERT ON juego
FOR EACH ROW
BEGIN
  :NEW.id_juego := juego_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."JUEGO_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ROL_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."ROL_BEFORE_INSERT" 
BEFORE INSERT ON rol
FOR EACH ROW
BEGIN
  :NEW.id_rol := rol_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."ROL_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USUARIO_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."USUARIO_BEFORE_INSERT" 
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
  :NEW.id_usuario := usuario_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."USUARIO_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VENTA_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMINISTRADOR"."VENTA_BEFORE_INSERT" 
BEFORE INSERT ON venta
FOR EACH ROW
BEGIN
  :NEW.id_venta := venta_seq.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINISTRADOR"."VENTA_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  Constraints for Table JUEGO
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("IMAGEN" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("EMPRESA" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("EXISTENCIAS" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" MODIFY ("ACTIVO" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."JUEGO" ADD PRIMARY KEY ("ID_JUEGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORIA
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."CATEGORIA" ADD PRIMARY KEY ("ID_CATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."USUARIO" ADD PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."FACTURA" ADD PRIMARY KEY ("ID_FACTURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VENTA
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."VENTA" ADD PRIMARY KEY ("ID_VENTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONTACTO
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."CONTACTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."CONTACTO" MODIFY ("APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."CONTACTO" MODIFY ("NUMERO" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."CONTACTO" MODIFY ("MENSAJE" NOT NULL ENABLE);
  ALTER TABLE "ADMINISTRADOR"."CONTACTO" ADD PRIMARY KEY ("ID_CONTACTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROL
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."ROL" ADD PRIMARY KEY ("ID_ROL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "PROYECTO_LENGUAJES"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."FACTURA" ADD CONSTRAINT "FACTURA_IBFK_1" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADMINISTRADOR"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JUEGO
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."JUEGO" ADD CONSTRAINT "FK_JUEGO_CATEGORIA" FOREIGN KEY ("ID_CATEGORIA")
	  REFERENCES "ADMINISTRADOR"."CATEGORIA" ("ID_CATEGORIA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ROL
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."ROL" ADD CONSTRAINT "ROL_IBFK_1" FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADMINISTRADOR"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VENTA
--------------------------------------------------------

  ALTER TABLE "ADMINISTRADOR"."VENTA" ADD CONSTRAINT "VENTA_IBFK_1" FOREIGN KEY ("ID_FACTURA")
	  REFERENCES "ADMINISTRADOR"."FACTURA" ("ID_FACTURA") ENABLE;
  ALTER TABLE "ADMINISTRADOR"."VENTA" ADD CONSTRAINT "VENTA_IBFK_2" FOREIGN KEY ("ID_JUEGO")
	  REFERENCES "ADMINISTRADOR"."JUEGO" ("ID_JUEGO") ENABLE;
