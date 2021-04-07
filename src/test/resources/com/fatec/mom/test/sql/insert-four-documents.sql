DROP TABLE IF EXISTS MOM_DOC_BLOCO CASCADE ;
DROP TABLE IF EXISTS MOM_DOCUMENTO CASCADE ;
DROP TABLE IF EXISTS MOM_BLOCO CASCADE ;

DROP SEQUENCE IF EXISTS MOM_DOCUMENTO_SQ;
DROP SEQUENCE IF EXISTS MOM_BLOCO_SQ;

--comment: Create table MOM_DOC
CREATE TABLE MOM_DOCUMENTO (
                               DOC_COD NUMBER(10) CONSTRAINT PK_DOC_COD PRIMARY KEY,
                               DOC_DATA_CRIA DATE DEFAULT CURRENT_DATE,
                               DOC_NOME VARCHAR(30) NOT NULL,
                               DOC_PN INTEGER NOT NULL,
                               DOC_TRACO INTEGER NOT NULL,

                               CONSTRAINT UK_DOC_PN_TRACO_NOM UNIQUE (DOC_NOME, DOC_PN, DOC_TRACO)
);
CREATE SEQUENCE MOM_DOCUMENTO_SQ;


--comment: Create table MOM_BLOCO
CREATE TABLE MOM_BLOCO (
                           BLC_COD NUMBER(10) CONSTRAINT PK_BLOCO_COD PRIMARY KEY,
                           BLC_SECAO VARCHAR(10) NOT NULL,
                           BLC_SUB_SECAO VARCHAR(10),
                           BLC_NUMERO INTEGER NOT NULL,
                           BLC_NOME VARCHAR(30),
                           BLC_CODIGO INTEGER NOT NULL,
                           BLC_ORDER INTEGER
);
CREATE SEQUENCE MOM_BLOCO_SQ;

--comment: Create intermediate table between MOM_DOCUMENT and MOM_BLOCO as MOM_DOC_BLOCO
CREATE TABLE MOM_DOC_BLOCO (
                               DOC_COD NUMBER(10) CONSTRAINT FK_DOC_BLOCO_DOC_COD REFERENCES MOM_DOCUMENTO(DOC_COD),
                               BLC_COD NUMBER(10) CONSTRAINT FK_DOC_BLOCO_BLC_COD REFERENCES MOM_BLOCO(BLC_COD)
);

--comment: Inserts documents based on the model codelist
INSERT INTO MOM_DOCUMENTO(doc_cod, doc_data_cria, doc_nome, doc_pn, doc_traco) VALUES (1, DATE'2021-06-23', 'Documento_Teste', 1111, 50);
INSERT INTO MOM_DOCUMENTO(doc_cod, doc_data_cria, doc_nome, doc_pn, doc_traco) VALUES (2, DATE'2021-06-23', 'Documento_Teste', 1111, 55);
INSERT INTO MOM_DOCUMENTO(doc_cod, doc_data_cria, doc_nome, doc_pn, doc_traco) VALUES (3, DATE'2021-06-23', 'Modelo_1', 1234, 60);
INSERT INTO MOM_DOCUMENTO(doc_cod, doc_data_cria, doc_nome, doc_pn, doc_traco) VALUES (4, DATE'2021-06-23', 'Modelo_1', 1234, 40);