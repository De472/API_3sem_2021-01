DROP TABLE IF EXISTS MOM_DOCUMENTO CASCADE;
DROP TABLE IF EXISTS MOM_BLOCO CASCADE;
DROP TABLE IF EXISTS MOM_BLOCO_DOC CASCADE;
DROP TABLE IF EXISTS MOM_REVISAO CASCADE;
DROP TABLE IF EXISTS MOM_REVISAO_BLOCO CASCADE;
DROP TABLE IF EXISTS MOM_BLOCO_LINK CASCADE;
DROP TABLE IF EXISTS MOM_TAG_TIPO CASCADE;
DROP TABLE IF EXISTS MOM_TAG CASCADE;
DROP TABLE IF EXISTS MOM_TAG_DOC CASCADE;
DROP TABLE IF EXISTS MOM_TAG_BLC CASCADE;
DROP TABLE IF EXISTS MOM_TRACO CASCADE;
DROP TABLE IF EXISTS MOM_BLOCK_PAGES CASCADE;
DROP TABLE IF EXISTS MOM_UPLOADED_FILES CASCADE;

DROP SEQUENCE IF EXISTS MOM_DOCUMENTO_SQ;
DROP SEQUENCE IF EXISTS MOM_BLOCO_SQ;
DROP SEQUENCE IF EXISTS MOM_BLOCO_LINK_SQ;
DROP SEQUENCE IF EXISTS MOM_REVISAO_SQ;
DROP SEQUENCE IF EXISTS MOM_TAG_TIPO_SQ;
DROP SEQUENCE IF EXISTS MOM_TAG_SQ;
DROP SEQUENCE IF EXISTS MOM_TRACO_SQ;
DROP SEQUENCE IF EXISTS MOM_BLOCK_PAGES_SQ;
DROP SEQUENCE IF EXISTS MOM_UPLOADED_FILES_SQ;


CREATE TABLE MOM_DOCUMENTO (
    DOC_COD NUMBER(10) PRIMARY KEY,
    DOC_DATA_CRIA DATE DEFAULT CURRENT_DATE,
    DOC_NOME VARCHAR(30),
    DOC_PN INTEGER,

    UNIQUE (DOC_NOME, DOC_PN)
);
CREATE SEQUENCE MOM_DOCUMENTO_SQ;

--comment: Create table MOM_BLOCO
CREATE TABLE MOM_BLOCO (
    BLC_COD NUMBER(10) PRIMARY KEY,
    BLC_SECAO VARCHAR(10) NOT NULL,
    BLC_SUB_SECAO VARCHAR(10),
    BLC_NUMERO INTEGER NOT NULL,
    BLC_NOME VARCHAR(30),
    BLC_CODIGO INTEGER NOT NULL,
    BLC_ORDER INTEGER,
    BLC_STATUS VARCHAR(11),
    BLC_BASEPATH VARCHAR(256),
    DOC_COD NUMBER(10) CONSTRAINT MOM_BLOCO_DOC_COD REFERENCES MOM_DOCUMENTO(DOC_COD)
);
CREATE SEQUENCE MOM_BLOCO_SQ;

CREATE TABLE MOM_REVISAO(
    REV_COD NUMBER(10) CONSTRAINT PK_MOM_REVISAO_COD PRIMARY KEY,
    REV_NAME VARCHAR(10) DEFAULT 'ORIGINAL',
    DOC_COD NUMBER(10) CONSTRAINT FK_MOM_REVISAO_DOC_COD REFERENCES MOM_DOCUMENTO(DOC_COD),
    REV_STATUS VARCHAR(15) DEFAULT 'FINISHED',
    REV_CREATED_DATE DATE,
    REV_ULTIMA_ATUALIZACAO DATE
);
CREATE SEQUENCE MOM_REVISAO_SQ;

CREATE TABLE MOM_REVISAO_BLOCO(
    REV_COD NUMBER(10) CONSTRAINT FK_MOM_REV_BLC_REV REFERENCES MOM_REVISAO(REV_COD),
    BLC_COD NUMBER(10) CONSTRAINT FK_MOM_REV_BLC_COD REFERENCES MOM_BLOCO(BLC_COD)
);

CREATE TABLE MOM_BLOCO_LINK(
    LNK_COD NUMBER(10) CONSTRAINT PK_MOM_BLOCO_LNK_COD PRIMARY KEY,
    LNK_FILENAME VARCHAR(100),
    LNK_EXT VARCHAR(5),
    LNK_UPLOAD_DATE DATE,
    BLC_COD NUMBER(10) CONSTRAINT FK_MOM_BLOCO_LNK_BLC REFERENCES MOM_BLOCO(BLC_COD)
);
CREATE SEQUENCE MOM_BLOCO_LINK_SQ;

CREATE TABLE MOM_TAG_TIPO(
    TIP_COD NUMBER(10) CONSTRAINT PK_MOM_TAG_TIPO_COD PRIMARY KEY,
    TIP_NOM VARCHAR(30)
);
CREATE SEQUENCE MOM_TAG_TIPO_SQ;

CREATE TABLE MOM_TAG(
    TAG_COD NUMBER(10) CONSTRAINT PK_MOM_TAG_COD PRIMARY KEY,
    TAG_NOM VARCHAR(30),
    TAG_CREATED DATE DEFAULT SYSDATE,
    TIP_COD NUMBER(10) CONSTRAINT FK_MOM_TAG_TYPE REFERENCES MOM_TAG_TIPO(TIP_COD)
);
CREATE SEQUENCE MOM_TAG_SQ;

CREATE TABLE MOM_TAG_DOC(
    TAG_COD NUMBER(10) CONSTRAINT FK_MOM_TAG_DOC_TAG REFERENCES MOM_TAG(TAG_COD),
    DOC_COD NUMBER(10) CONSTRAINT FK_MOM_TAG_DOC_DOC REFERENCES MOM_DOCUMENTO(DOC_COD)
);

CREATE TABLE MOM_TAG_BLC(
    TAG_COD NUMBER(10) CONSTRAINT FK_MOM_TAG_BLC_TAG REFERENCES MOM_TAG(TAG_COD),
    BLC_COD NUMBER(10) CONSTRAINT FK_MOM_TAG_BLC_BLC REFERENCES MOM_BLOCO(BLC_COD)
);

CREATE TABLE MOM_TRACO(
    TRA_COD NUMBER(10) CONSTRAINT PK_MOM_TRA_COD PRIMARY KEY,
    TRA_NUM NUMBER(4),
    DOC_COD NUMBER(10) CONSTRAINT FK_MOM_TRACO_DOC_DOC REFERENCES MOM_DOCUMENTO(DOC_COD),
    BLC_COD NUMBER(10) CONSTRAINT FK_MOM_TRACO_BLC_BLC REFERENCES MOM_BLOCO(BLC_COD)
);
CREATE SEQUENCE MOM_TRACO_SQ;


CREATE TABLE MOM_BLOCK_PAGES(
    PAG_COD NUMBER(10) CONSTRAINT MOM_BLOCK_PAGES_COD PRIMARY KEY,
    BLC_COD NUMBER(10) CONSTRAINT MOM_BLOCK_PAGES_BLC REFERENCES MOM_BLOCO(BLC_COD),
    PAG_NUMBER NUMBER(4) NOT NULL,
    REV_COD NUMBER(10) CONSTRAINT MOM_BLOCK_PAGES_REV REFERENCES MOM_REVISAO(REV_COD)
);

CREATE SEQUENCE MOM_BLOCK_PAGES_SQ;


CREATE TABLE MOM_UPLOADED_FILES (
    UPL_COD NUMBER(10) CONSTRAINT PK_MOM_UPLOADED_DOCS_COD PRIMARY KEY,
    UPL_TYPE VARCHAR(256) NOT NULL,
    UPL_EXT VARCHAR(10),
    UPL_ORIGINAL_NAME VARCHAR(256) NOT NULL,
    UPL_FILE_NAME VARCHAR(256),
    UPL_PATH VARCHAR(256) NOT NULL
);

CREATE SEQUENCE MOM_UPLOADED_FILES_SQ;