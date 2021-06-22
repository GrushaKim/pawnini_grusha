--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-18-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CART_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PAWNINI"."CART_SEQ"  MINVALUE 1 MAXVALUE 99 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence REV_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PAWNINI"."REV_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1020 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."CART" 
   (	"CART_ID" NUMBER, 
	"CART_AMOUNT" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"MEMBER_ID" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_PWD" VARCHAR2(512 BYTE), 
	"MEMBER_NAME" VARCHAR2(20 BYTE), 
	"MEMBER_REGDATE" DATE DEFAULT SYSDATE, 
	"MEMBER_GRADE" NUMBER DEFAULT 1, 
	"MEMBER_NICKNAME" VARCHAR2(20 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(40 BYTE), 
	"MEMBER_PHONE" VARCHAR2(20 BYTE), 
	"MEMBER_MILEAGE" NUMBER, 
	"MEMBER_POSTCODE" NUMBER, 
	"MEMBER_F_ADDR" VARCHAR2(200 BYTE), 
	"MEMBER_S_ADDR" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."PRODUCT" 
   (	"PRODUCT_ID" NUMBER, 
	"PRODUCT_F_CODE" VARCHAR2(20 BYTE), 
	"PRODUCT_S_CODE" VARCHAR2(20 BYTE), 
	"PRODUCT_T_CODE" VARCHAR2(20 BYTE), 
	"PRODUCT_T_CODE2" VARCHAR2(20 BYTE), 
	"PRODUCT_BRAND" VARCHAR2(50 BYTE), 
	"PRODUCT_NAME" VARCHAR2(50 BYTE), 
	"PRODUCT_IMG" VARCHAR2(200 BYTE), 
	"PRODUCT_THUMB_IMG" VARCHAR2(200 BYTE), 
	"PRODUCT_DESC" VARCHAR2(4000 BYTE), 
	"PRODUCT_STOCK" NUMBER, 
	"PRODUCT_PRICE" NUMBER, 
	"PRODUCT_DATE" DATE DEFAULT sysdate, 
	"PRODUCT_HITS" NUMBER, 
	"PRODUCT_C_PRICE" NUMBER, 
	"PRODUCT_OPTION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."REVIEW" 
   (	"REV_ID" NUMBER, 
	"REV_TITLE" VARCHAR2(200 BYTE), 
	"REV_CONTENT" VARCHAR2(4000 BYTE), 
	"REV_F_CATEGORY" VARCHAR2(20 BYTE), 
	"REV_DATE" DATE DEFAULT sysdate, 
	"REV_SHOW" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"PRODUCT_ID" NUMBER, 
	"REV_STARS" NUMBER, 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"REV_LIKE_CNT" NUMBER DEFAULT 0, 
	"REV_COM_CNT" NUMBER DEFAULT 0, 
	"REV_WRITER" VARCHAR2(30 BYTE), 
	"REV_F_IMG" VARCHAR2(500 BYTE), 
	"REV_THUMB_IMG" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REV_COM
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."REV_COM" 
   (	"REV_COM_ID" NUMBER, 
	"REV_COM_WRITER" VARCHAR2(20 BYTE), 
	"REV_COM_CONTENT" VARCHAR2(1000 BYTE), 
	"REV_COM_DATE" DATE DEFAULT sysdate, 
	"REV_COM_SHOW" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"REV_COM_MODDATE" DATE DEFAULT sysdate, 
	"REV_ID" NUMBER, 
	"MEMBER_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REV_LIKE
--------------------------------------------------------

  CREATE TABLE "PAWNINI"."REV_LIKE" 
   (	"REV_LIKE_ID" NUMBER, 
	"REV_ID" NUMBER, 
	"MEMBER_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into PAWNINI.CART
SET DEFINE OFF;
Insert into PAWNINI.CART (CART_ID,CART_AMOUNT,PRODUCT_ID,MEMBER_ID) values (21061804,1,3,'user5');
Insert into PAWNINI.CART (CART_ID,CART_AMOUNT,PRODUCT_ID,MEMBER_ID) values (21061805,1,2,'user5');
Insert into PAWNINI.CART (CART_ID,CART_AMOUNT,PRODUCT_ID,MEMBER_ID) values (21061806,1,4,'user5');
Insert into PAWNINI.CART (CART_ID,CART_AMOUNT,PRODUCT_ID,MEMBER_ID) values (21061807,2,1,'user5');
REM INSERTING into PAWNINI.MEMBER
SET DEFINE OFF;
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user1','12345','ȸ��1',to_date('21/06/14','RR/MM/DD'),1,'ȸ��1',null,null,null,null,null,null);
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user2','12345','ȸ��2',to_date('21/06/14','RR/MM/DD'),1,'ȸ��2',null,null,null,null,null,null);
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user5','0a2a1719bf3ce682afdbedf3b23857818d526efbe7fcb372b31347c26239a0f916c398b7ad8dd0ee76e8e388604d0b0f925d5e913ad2d3165b9b35b3844cd5e6','user5',to_date('21/06/16','RR/MM/DD'),1,'�����','grushenka.k18@gmail.com','010-1111-1234',null,6035,'���� ������ ���μ��� 5(�Ż絿)','3');
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user6','0a2a1719bf3ce682afdbedf3b23857818d526efbe7fcb372b31347c26239a0f916c398b7ad8dd0ee76e8e388604d0b0f925d5e913ad2d3165b9b35b3844cd5e6','user6',to_date('21/06/16','RR/MM/DD'),1,'�����','grushenka.k18@gmail.com','010-3333-3333',null,27013,'��� �ܾ籺 �ܾ��� ����� 141(������, �������ڳ���)','3');
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('admin4','0a2a1719bf3ce682afdbedf3b23857818d526efbe7fcb372b31347c26239a0f916c398b7ad8dd0ee76e8e388604d0b0f925d5e913ad2d3165b9b35b3844cd5e6','admin4',to_date('21/06/16','RR/MM/DD'),2,'������4','grushenka.k18@gmail.com','010-3333-5555',null,11759,'��� �����ν� �źϷ� 7(�ݿ���, ������ī��)','3');
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user4','0a2a1719bf3ce682afdbedf3b23857818d526efbe7fcb372b31347c26239a0f916c398b7ad8dd0ee76e8e388604d0b0f925d5e913ad2d3165b9b35b3844cd5e6','�۸�',to_date('21/06/16','RR/MM/DD'),1,'�۸۸�','grushenka.k18@naver.com','010-2754-5467',null,58663,'���� ������ ����� 383(���ϵ�, �̷������ɷ°����п�)','33');
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('admin3','0a2a1719bf3ce682afdbedf3b23857818d526efbe7fcb372b31347c26239a0f916c398b7ad8dd0ee76e8e388604d0b0f925d5e913ad2d3165b9b35b3844cd5e6','������3',to_date('21/06/16','RR/MM/DD'),2,'��Ʈ����','grushenka.k18@gmail.com','010-1111-1111',null,34610,'���� ���� �̷��� 2(�ھ絿)','33');
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('admin1','12345','������1',to_date('21/06/14','RR/MM/DD'),2,'�����',null,null,null,null,null,null);
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('admin2','12345','������2',to_date('21/06/14','RR/MM/DD'),2,'��Ʈ����',null,null,null,null,null,null);
Insert into PAWNINI.MEMBER (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_REGDATE,MEMBER_GRADE,MEMBER_NICKNAME,MEMBER_EMAIL,MEMBER_PHONE,MEMBER_MILEAGE,MEMBER_POSTCODE,MEMBER_F_ADDR,MEMBER_S_ADDR) values ('user3','12345','ȸ��3',to_date('21/06/16','RR/MM/DD'),1,'������',null,null,null,null,null,null);
REM INSERTING into PAWNINI.PRODUCT
SET DEFINE OFF;
Insert into PAWNINI.PRODUCT (PRODUCT_ID,PRODUCT_F_CODE,PRODUCT_S_CODE,PRODUCT_T_CODE,PRODUCT_T_CODE2,PRODUCT_BRAND,PRODUCT_NAME,PRODUCT_IMG,PRODUCT_THUMB_IMG,PRODUCT_DESC,PRODUCT_STOCK,PRODUCT_PRICE,PRODUCT_DATE,PRODUCT_HITS,PRODUCT_C_PRICE,PRODUCT_OPTION) values (1,'DOG','MEAL','�ǽ�','1-7��','���ϸ޵�','����Ƽ��','\imgUpload\2021\06\17\f317acaa-45cf-48c0-908a-0bc0b8e7aa14_1. ���ϸ޵� ����Ƽ��.jpg','\imgUpload\2021\06\17\s\s_f317acaa-45cf-48c0-908a-0bc0b8e7aa14_1. ���ϸ޵� ����Ƽ��.jpg','���ϸ޵� ����Ƽ�� �����',10,72000,to_date('21/06/17','RR/MM/DD'),null,45000,'7.5kg');
Insert into PAWNINI.PRODUCT (PRODUCT_ID,PRODUCT_F_CODE,PRODUCT_S_CODE,PRODUCT_T_CODE,PRODUCT_T_CODE2,PRODUCT_BRAND,PRODUCT_NAME,PRODUCT_IMG,PRODUCT_THUMB_IMG,PRODUCT_DESC,PRODUCT_STOCK,PRODUCT_PRICE,PRODUCT_DATE,PRODUCT_HITS,PRODUCT_C_PRICE,PRODUCT_OPTION) values (2,'DOG','SNACK','������','�ôϾ�','������Űģ','�����ǽ�Ʈ','\imgUpload\2021\06\17\e6855f1a-079e-4898-9fc2-43734a32559d_17. ������Űģ �����ǽ�Ʈ.png','\imgUpload\2021\06\17\s\s_e6855f1a-079e-4898-9fc2-43734a32559d_17. ������Űģ �����ǽ�Ʈ.png','������',5,9800,to_date('21/06/17','RR/MM/DD'),null,5000,'400g');
Insert into PAWNINI.PRODUCT (PRODUCT_ID,PRODUCT_F_CODE,PRODUCT_S_CODE,PRODUCT_T_CODE,PRODUCT_T_CODE2,PRODUCT_BRAND,PRODUCT_NAME,PRODUCT_IMG,PRODUCT_THUMB_IMG,PRODUCT_DESC,PRODUCT_STOCK,PRODUCT_PRICE,PRODUCT_DATE,PRODUCT_HITS,PRODUCT_C_PRICE,PRODUCT_OPTION) values (3,'DOG','SNACK','1��',null,'������Űģ','���Ƿ�����','\imgUpload\2021\06\17\41c5fae7-e046-44d1-9442-e3f10c051da8_16. ������Űģ ���Ƿ�����.png','\imgUpload\2021\06\17\s\s_41c5fae7-e046-44d1-9442-e3f10c051da8_16. ������Űģ ���Ƿ�����.png','������',15,8000,to_date('21/06/17','RR/MM/DD'),null,4000,'400g');
Insert into PAWNINI.PRODUCT (PRODUCT_ID,PRODUCT_F_CODE,PRODUCT_S_CODE,PRODUCT_T_CODE,PRODUCT_T_CODE2,PRODUCT_BRAND,PRODUCT_NAME,PRODUCT_IMG,PRODUCT_THUMB_IMG,PRODUCT_DESC,PRODUCT_STOCK,PRODUCT_PRICE,PRODUCT_DATE,PRODUCT_HITS,PRODUCT_C_PRICE,PRODUCT_OPTION) values (4,'DOG','MEAL','�ǽ�','1-7��','���ϸ޵�','����Ʈ��Ʈ��','\imgUpload\2021\06\17\c93aac57-445f-4606-b62d-0a026dc3ae93_2. ���ϸ޵� ����Ʈ ��Ʈ��.jpg','\imgUpload\2021\06\17\s\s_c93aac57-445f-4606-b62d-0a026dc3ae93_2. ���ϸ޵� ����Ʈ ��Ʈ��.jpg','333',9,75000,to_date('21/06/17','RR/MM/DD'),null,50000,'7.2kg');
REM INSERTING into PAWNINI.REVIEW
SET DEFINE OFF;
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1045,'�׽�Ʈ1','3,3d,3,3','XS',to_date('21/06/17','RR/MM/DD'),'Y',3,3,'user6',1,0,'�����','\imgUpload\2021\06\17\7f15e7a7-c503-4497-9681-7bc5d1dbfe3b_sundol3.jpg','\imgUpload\2021\06\17\s\s_7f15e7a7-c503-4497-9681-7bc5d1dbfe3b_sundol3.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1027,'�׽�Ʈ1-1','�׽�Ʈ����2','XL',to_date('21/06/13','RR/MM/DD'),'N',1111,4,null,1,2,null,null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1030,'��Ʈ����','��᤾��','XS',to_date('21/06/16','RR/MM/DD'),'Y',3000,5,null,0,0,'�۸۸�',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1031,'���','��Ʈ����','XS',to_date('21/06/16','RR/MM/DD'),'Y',4000,5,'user4',3,4,'�۸۸�',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1032,'��� ���ƿ�~','�˰��̰� ũ�ϱ�','XL',to_date('21/06/16','RR/MM/DD'),'Y',4000,4,'user5',1,1,'�����',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1033,'������ ���� ��ƴ�','���� ��','M',to_date('21/06/16','RR/MM/DD'),'N',1004,1,'user5',1,2,'�����',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1034,'��Ʈ���� ���� �� ���','<3<3<3<3<33333','XS',to_date('21/06/16','RR/MM/DD'),'Y',3333,5,'user6',1,3,'�����',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1040,'�����5','��','XS',to_date('21/06/17','RR/MM/DD'),'Y',2,5,'user4',0,0,'�۸۸�','\imgUpload\2021\06\17\52d8b25a-5a4d-4685-a8dc-3d2f8d6d8d8f_sundol7.jpg','\imgUpload\2021\06\17\s\s_52d8b25a-5a4d-4685-a8dc-3d2f8d6d8d8f_sundol7.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1041,'dd','gg','XS',to_date('21/06/17','RR/MM/DD'),'Y',3,3,'admin3',0,0,'��Ʈ����','\imgUpload\2021\06\17\70930ace-7431-4f90-9865-0c4eff5b9923_sundol19.jpg','\imgUpload\2021\06\17\s\s_70930ace-7431-4f90-9865-0c4eff5b9923_sundol19.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1043,'3','3','XS',to_date('21/06/17','RR/MM/DD'),'Y',3,3,'user4',0,0,'�۸۸�','\imgUpload\2021\06\17\0aa15bb6-383b-491d-bd01-75455d9b2fe0_sundol7.jpg','\imgUpload\2021\06\17\s\s_0aa15bb6-383b-491d-bd01-75455d9b2fe0_sundol7.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1044,'�׽�Ʈ1','5','XS',to_date('21/06/17','RR/MM/DD'),'Y',55,5,'user5',0,0,'�����','\imgUpload\2021\06\17\54f3429f-b702-4646-afca-fad2fb1127c7_sundol12.jpg','\imgUpload\2021\06\17\s\s_54f3429f-b702-4646-afca-fad2fb1127c7_sundol12.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1046,'g2','d,d','XS',to_date('21/06/17','RR/MM/DD'),'Y',3,3,'user4',0,0,'�۸۸�','\imgUpload\2021\06\17\20a5dd80-0a3a-4e7a-bbec-78c45c86ce9b_sundol6.jpg','\imgUpload\2021\06\17\s\s_20a5dd80-0a3a-4e7a-bbec-78c45c86ce9b_sundol6.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1029,'�������8','���� �׽�Ʈ','XS',to_date('21/06/13','RR/MM/DD'),'Y',2000,5,'user1',5,5,null,null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1035,'����','12','XS',to_date('21/06/16','RR/MM/DD'),'Y',3333,3,'user5',1,3,'�����','\imgUpload\2021\06\16\585e44da-9416-47ce-851a-809d92c6754b_bkkal.jpg','\imgUpload\2021\06\16\s\s_585e44da-9416-47ce-851a-809d92c6754b_bkkal.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1036,'�����1','����','XS',to_date('21/06/16','RR/MM/DD'),'Y',55555,3,'user5',1,0,'�����','\imgUpload\2021\06\16\c56beb89-95fe-460d-8dc6-931ad083cdba_bkkal.jpg','\imgUpload\2021\06\16\s\s_c56beb89-95fe-460d-8dc6-931ad083cdba_bkkal.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1037,'�����2','������','XS',to_date('21/06/16','RR/MM/DD'),'Y',33,3,'user5',0,0,'�����','\imgUpload\2021\06\16\70bdfa0d-f993-422f-8dfd-9589ed15be41_sundol1.jpg','\imgUpload\2021\06\16\s\s_70bdfa0d-f993-422f-8dfd-9589ed15be41_sundol1.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1038,'�����3','�׽�Ʈ','XS',to_date('21/06/16','RR/MM/DD'),'Y',3333,4,'user6',0,0,'�����','\imgUpload\2021\06\16\fbb99222-bb52-4cd0-9bf0-51886992b38b_sundol8.jpg','\imgUpload\2021\06\16\s\s_fbb99222-bb52-4cd0-9bf0-51886992b38b_sundol8.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1039,'�����4','������','XS',to_date('21/06/16','RR/MM/DD'),'Y',1111,4,'user4',0,0,'�۸۸�','\imgUpload\2021\06\16\d65010f7-237f-45db-8a9d-bc244ffa6189_sundol6.jpg','\imgUpload\2021\06\16\s\s_d65010f7-237f-45db-8a9d-bc244ffa6189_sundol6.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1042,'�����6','3','XS',to_date('21/06/17','RR/MM/DD'),'Y',33,3,'user6',0,0,'�����','\imgUpload\2021\06\17\7be03e8b-3ca4-4a8c-b6a4-f36c3ffe4fdf_sundol12.jpg','\imgUpload\2021\06\17\s\s_7be03e8b-3ca4-4a8c-b6a4-f36c3ffe4fdf_sundol12.jpg');
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1025,'����','����','S',to_date('21/06/16','RR/MM/DD'),'Y',4444,3,'user5',0,1,'�����',null,null);
Insert into PAWNINI.REVIEW (REV_ID,REV_TITLE,REV_CONTENT,REV_F_CATEGORY,REV_DATE,REV_SHOW,PRODUCT_ID,REV_STARS,MEMBER_ID,REV_LIKE_CNT,REV_COM_CNT,REV_WRITER,REV_F_IMG,REV_THUMB_IMG) values (1028,'���� �� �Ƕ� �̤�','�� ���� �ʹ�','XS',to_date('21/06/13','RR/MM/DD'),'N',2000,3,'admin1',2,5,null,null,null);
REM INSERTING into PAWNINI.REV_COM
SET DEFINE OFF;
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (2,'�ڵ�','����ƴ� �̤�',to_date('21/06/13','RR/MM/DD'),'N',to_date('21/06/13','RR/MM/DD'),1027,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (3,'�۸۸�','����ƴ� �̤�',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1027,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (18,'�۸۸�','�ȳ�~',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1031,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (19,'�����','��Ʈ����',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1031,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (20,'�����','�̰� ������� ����',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1031,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (21,'�����','�۸۸۸�',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1032,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (22,'�����','���� ��Ʈ����',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1033,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (23,'�����','��� 1',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1034,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (24,'�����','��� 2 (�����)',to_date('21/06/16','RR/MM/DD'),'N',to_date('21/06/16','RR/MM/DD'),1034,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (25,'�����','��� 3 (�����)',to_date('21/06/16','RR/MM/DD'),'N',to_date('21/06/16','RR/MM/DD'),1034,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (8,'�ϳ��Ѽ³�','���� �Ǵ�',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1028,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (17,'��Ʈ����3','���¾� ��Ʈ����3',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1029,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (32,'�����','�۸۸�',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1035,'user5');
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (10,'�ȳ�','����',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1028,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (33,'�����','����� �� ���Ȥ���',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1035,'user5');
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (12,'���1','��� 1���Դϴ�... �ݰ����ϴ�...',to_date('21/06/13','RR/MM/DD'),'N',to_date('21/06/14','RR/MM/DD'),1029,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (34,'�����','��� ������',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1035,'user5');
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (30,'�����','rev_com_id Ȯ��',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1033,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (31,'�����','rev_com_id �� ������~~',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1031,'user5');
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (4,'����','����',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1028,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (5,'g2','g2',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1028,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (6,'������','������',to_date('21/06/13','RR/MM/DD'),'Y',to_date('21/06/13','RR/MM/DD'),1028,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (14,'��Ʈ����1','���� ��Ʈ����',to_date('21/06/14','RR/MM/DD'),'Y',to_date('21/06/14','RR/MM/DD'),1029,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (15,'��Ʈ����2','���� �����',to_date('21/06/15','RR/MM/DD'),'Y',to_date('21/06/15','RR/MM/DD'),1029,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (16,'��Ʈ����2','���¾� ��Ʈ����2',to_date('21/06/15','RR/MM/DD'),'N',to_date('21/06/15','RR/MM/DD'),1029,null);
Insert into PAWNINI.REV_COM (REV_COM_ID,REV_COM_WRITER,REV_COM_CONTENT,REV_COM_DATE,REV_COM_SHOW,REV_COM_MODDATE,REV_ID,MEMBER_ID) values (26,'�����','��',to_date('21/06/16','RR/MM/DD'),'Y',to_date('21/06/16','RR/MM/DD'),1025,null);
REM INSERTING into PAWNINI.REV_LIKE
SET DEFINE OFF;
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (14,1031,'user4');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (15,1031,'user5');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (16,1032,'user6');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (17,1031,'user6');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (18,1033,'user6');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (20,1029,'user6');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (7,1029,'user1');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (6,1028,'user1');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (9,1028,'admin1');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (8,1029,'admin1');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (5,1027,'user1');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (10,1029,'admin2');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (24,1045,'user4');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (13,1029,'user4');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (21,1035,'user5');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (22,1036,'user5');
Insert into PAWNINI.REV_LIKE (REV_LIKE_ID,REV_ID,MEMBER_ID) values (23,1034,'user6');
--------------------------------------------------------
--  Constraints for Table REV_LIKE
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REV_LIKE" ADD PRIMARY KEY ("REV_LIKE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."CART" ADD PRIMARY KEY ("CART_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."PRODUCT" ADD PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REV_COM
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REV_COM" ADD PRIMARY KEY ("REV_COM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REVIEW" ADD PRIMARY KEY ("REV_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."MEMBER" ADD PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."CART" ADD CONSTRAINT "CART_FK1" FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "PAWNINI"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PAWNINI"."CART" ADD CONSTRAINT "CART_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "PAWNINI"."PRODUCT" ("PRODUCT_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REVIEW" ADD CONSTRAINT "REV_FK_1" FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "PAWNINI"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REV_COM
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REV_COM" ADD CONSTRAINT "REV_COM_FK1" FOREIGN KEY ("REV_ID")
	  REFERENCES "PAWNINI"."REVIEW" ("REV_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PAWNINI"."REV_COM" ADD CONSTRAINT "REV_COM_FK2" FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "PAWNINI"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REV_LIKE
--------------------------------------------------------

  ALTER TABLE "PAWNINI"."REV_LIKE" ADD CONSTRAINT "REV_LIKE_FK_1" FOREIGN KEY ("REV_ID")
	  REFERENCES "PAWNINI"."REVIEW" ("REV_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PAWNINI"."REV_LIKE" ADD CONSTRAINT "REV_LIKE_FK_2" FOREIGN KEY ("MEMBER_ID")
	  REFERENCES "PAWNINI"."MEMBER" ("MEMBER_ID") ON DELETE CASCADE ENABLE;