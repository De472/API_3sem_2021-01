--liquibase formatted sql

--changeset tslino:1
--comment: Create table MOM.MOM_USER
CREATE TABLE MOM.MOM_USER (
    COD_USER NUMBER(10) CONSTRAINT PK_MOM_USER_COD_USER PRIMARY KEY,
    NAME VARCHAR(100),
    EMAIL VARCHAR(100) CONSTRAINT UK_MOM_USER_NAME UNIQUE,
    USERNAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(100) NOT NULL,
    ACTIVE NUMBER(1) NOT NULL
);

--changeset tslino:2
--comment: Create table MOM.MOM_PERM
CREATE TABLE MOM.MOM_PERM (
    COD_PERM NUMBER(10) CONSTRAINT PK_MOM_PERM_COD_PERM PRIMARY KEY,
    PERM VARCHAR(30) NOT NULL,
    COD_USER NUMBER(10) CONSTRAINT FK_MOM_PERM_COD_USER REFERENCES MOM_USER(COD_USER) NOT NULL
);

--changeset tslino:3
--comment: Create sequence MOM.MOM_SQ_USER
CREATE SEQUENCE MOM.MOM_SQ_USER INCREMENT BY 1 START WITH 9 MAXVALUE 9999999999 NOCYCLE;

--changeset tslino:4
--comment: Create sequence MOM.MOM_SQ_PERM
CREATE SEQUENCE MOM.MOM_SQ_PERM INCREMENT BY 1 START WITH 10 MAXVALUE 9999999999 NOCYCLE;