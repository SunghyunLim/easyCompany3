CREATE DATABASE EASYCOMPANY;

DROP TABLE IDS;
CREATE TABLE IDS
(

	TABLE_NAME               VARCHAR2(20) NOT NULL,
	NEXT_ID                    NUMBER(30) NOT NULL
)
;

ALTER TABLE IDS
	ADD  PRIMARY KEY (TABLE_NAME)         
;

DROP TABLE RTETNAUTH;
CREATE TABLE RTETNAUTH
(
	URL                   VARCHAR2(100) NOT NULL,
	MNGR_SE               VARCHAR2(6) NULL
)
;

ALTER TABLE RTETNAUTH
	ADD  PRIMARY KEY (URL)
;

DROP TABLE RTETNBBS;
CREATE TABLE RTETNBBS
(
	NO                    CHAR(20) NOT NULL,
	SJ                    VARCHAR2(60) NULL,
	CN                    VARCHAR2(4000) NULL,
	REGIST_DT                  DATE NULL,
	MBER_NO               CHAR(20) NULL,
	MBER_ID				VARCHAR2(20) NULL
)
;

ALTER TABLE RTETNBBS
	ADD  PRIMARY KEY (NO)
;

DROP TABLE RTETNCART;
CREATE TABLE RTETNCART
(
	CART_ID               CHAR(20) NOT NULL,
	MBER_NO               CHAR(20) NULL,
	GOODS_ID              CHAR(20) NULL,
	QY                    NUMBER(20) NULL
)
;

ALTER TABLE RTETNCART
	ADD  PRIMARY KEY (CART_ID)
;

DROP TABLE RTETNPURCHSLIST;
CREATE TABLE RTETNPURCHSLIST
(
	PURCHS_ID             CHAR(20) NOT NULL,
	GOODS_ID              CHAR(20) NOT NULL,
	MBER_NO               CHAR(20) NOT NULL,
	QY                    NUMBER(20) NULL,
	PURCHS_DE             CHAR(8) NULL,
	DLVY_SE               CHAR(2) NULL
)
;

ALTER TABLE RTETNPURCHSLIST
	ADD  PRIMARY KEY (PURCHS_ID)
;

DROP TABLE RTETNDLVYINFO;
CREATE TABLE RTETNDLVYINFO
(
	DLVY_SE               CHAR(2) NOT NULL,
	DLVY_STTUS            VARCHAR2(10) NULL
)
;

ALTER TABLE RTETNDLVYINFO
	ADD  PRIMARY KEY (DLVY_SE)
;

DROP TABLE RTETNGOODS;
CREATE TABLE RTETNGOODS
(
	GOODS_ID              CHAR(20) NOT NULL,
	GOODS_NM              VARCHAR2(255) NULL,
	PRICE                 NUMBER(16) NULL,
	CTGRY_ID              VARCHAR2(20) NULL,
	MAKR                  VARCHAR2(20) NULL,
	DETAIL_INFO_IMAGE_ID  CHAR(20) NULL,
	GOODS_IMAGE_ID        CHAR(20) NULL,
	USE_AT 						CHAR(1) NULL
)
;

ALTER TABLE RTETNGOODS
	ADD  PRIMARY KEY (GOODS_ID)
;

DROP TABLE RTETNCTGRY;
CREATE TABLE RTETNCTGRY
(
	CTGRY_ID              VARCHAR2(20) NOT NULL,
	CTGRY_NM              VARCHAR2(100) NULL,
	DC                    VARCHAR2(200) NULL
)
;

ALTER TABLE RTETNCTGRY
	ADD  PRIMARY KEY (CTGRY_ID)
;

DROP TABLE RTETNGOODSIMAGE;
CREATE TABLE RTETNGOODSIMAGE
(
	GOODS_IMAGE_ID        CHAR(20) NOT NULL,
	FILE_NM               VARCHAR2(100) NULL
)
;

ALTER TABLE RTETNGOODSIMAGE
	ADD  PRIMARY KEY (GOODS_IMAGE_ID)
;

DROP TABLE RTETNMBER;
CREATE TABLE RTETNMBER
(
	MBER_NO               CHAR(20) NOT NULL,
	MBER_ID               VARCHAR2(20) NULL,
	NM                    VARCHAR2(60) NULL,
	PASSWORD              VARCHAR2(200) NULL,
	EMAIL                 VARCHAR2(50) NULL,
	TELNO                 VARCHAR2(20) NULL,
	MBTLNUM               VARCHAR2(20) NULL,
	ZIP                   CHAR(6) NULL,
	ADRES                 VARCHAR2(100) NULL,
	DETAIL_ADRES          VARCHAR2(100) NULL,
	LAST_CHANGE_DT        DATE NULL,
	MNGR_SE               VARCHAR2(6) NULL
)
;

ALTER TABLE RTETNMBER
	ADD  PRIMARY KEY (MBER_NO)
;

DROP TABLE RTETCCODE;
CREATE TABLE RTETCCODE
(
	CODE_ID               VARCHAR2(6) NOT NULL,
	CODE_NM               VARCHAR2(60) NULL,
	DC                    VARCHAR2(200) NULL
)
;

ALTER TABLE RTETCCODE
	ADD  PRIMARY KEY (CODE_ID)
;

ALTER TABLE RTETNAUTH
	ADD FOREIGN KEY (MNGR_SE) REFERENCES RTETCCODE(CODE_ID)
;

ALTER TABLE RTETNCART
	ADD FOREIGN KEY (MBER_NO) REFERENCES RTETNMBER(MBER_NO) ON DELETE CASCADE
;

ALTER TABLE RTETNCART
	ADD FOREIGN KEY (GOODS_ID) REFERENCES RTETNGOODS(GOODS_ID) ON DELETE CASCADE
;

ALTER TABLE RTETNGOODS
	ADD FOREIGN KEY  (CTGRY_ID) REFERENCES RTETNCTGRY(CTGRY_ID)
;

ALTER TABLE RTETNGOODS
	ADD FOREIGN KEY  (DETAIL_INFO_IMAGE_ID) REFERENCES RTETNGOODSIMAGE(GOODS_IMAGE_ID)
;

ALTER TABLE RTETNGOODS
	ADD FOREIGN KEY  (GOODS_IMAGE_ID) REFERENCES RTETNGOODSIMAGE(GOODS_IMAGE_ID)
;

ALTER TABLE RTETNMBER
	ADD FOREIGN KEY  (MNGR_SE) REFERENCES RTETCCODE(CODE_ID)
;

ALTER TABLE RTETNPURCHSLIST
	ADD FOREIGN KEY  (GOODS_ID) REFERENCES RTETNGOODS(GOODS_ID)
;

ALTER TABLE RTETNPURCHSLIST
	ADD FOREIGN KEY  (MBER_NO) REFERENCES RTETNMBER(MBER_NO) ON DELETE CASCADE
;

ALTER TABLE RTETNPURCHSLIST
	ADD FOREIGN KEY  (DLVY_SE) REFERENCES RTETNDLVYINFO(DLVY_SE)
;
CREATE INDEX "rtetnmber_ibfk_1" ON "RTETNMBER"
  (
    "MNGR_SE"
  );

  CREATE INDEX "rtetnauth_ibfk_1" ON "RTETNAUTH"
  (
    "MNGR_SE"
  );

  CREATE INDEX "rtetngoods_ibfk_1" ON "RTETNGOODS"
  (
    "CTGRY_ID"
  );
  CREATE INDEX "rtetngoods_ibfk_2" ON "RTETNGOODS"
  (
    "DETAIL_INFO_IMAGE_ID"
  );
  CREATE INDEX "rtetngoods_ibfk_3" ON "RTETNGOODS"
  (
    "GOODS_IMAGE_ID"
  );
  CREATE INDEX "rtetncart_ibfk_1" ON "RTETNCART"
  (
    "MBER_NO"
  );
  CREATE INDEX "rtetncart_ibfk_2" ON "RTETNCART"
  (
    "GOODS_ID"
  );
  CREATE INDEX "rtetnpurchslist_ibfk_1" ON "RTETNPURCHSLIST"
  (
    "GOODS_ID"
  );
  CREATE INDEX "rtetnpurchslist_ibfk_2" ON "RTETNPURCHSLIST"
  (
    "MBER_NO"
  );

    CREATE INDEX "rtetnpurchslist_ibfk_3" ON "RTETNPURCHSLIST"
  (
    "DLVY_SE"
  );
  
commit;

