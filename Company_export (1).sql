--------------------------------------------------------
--  File created - �����-�������-31-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ITEM_ID
--------------------------------------------------------

   CREATE SEQUENCE  "COMPANY"."SEQ_ITEM_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 10 START WITH 210 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ORD_ID
--------------------------------------------------------

   CREATE SEQUENCE  "COMPANY"."SEQ_ORD_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "COMPANY"."CUSTOMERS" 
   (	"CUST_ID" NUMBER, 
	"CUST_NAME" VARCHAR2(50 BYTE), 
	"CUST_SURNAME" VARCHAR2(50 BYTE), 
	"CUST_ADDRESS" VARCHAR2(50 BYTE), 
	"CUST_TEL" VARCHAR2(10 BYTE), 
	"CUST_EMAIL" VARCHAR2(50 BYTE), 
	"CUST_AFM" VARCHAR2(10 BYTE), 
	"CUST_DATE_START" DATE, 
	"CUST_DISCOUNT" NUMBER, 
	"CUST_TYPE" VARCHAR2(5 BYTE), 
	"CUST_COMMENTS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "COMPANY"."DEPARTMENTS" 
   (	"DEP_ID" NUMBER, 
	"DEP_NAME" VARCHAR2(30 BYTE), 
	"DEP_LOCATION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "COMPANY"."EMPLOYEES" 
   (	"EMP_ID" NUMBER, 
	"EMP_NAME" VARCHAR2(50 BYTE), 
	"EMP_SURNAME" VARCHAR2(50 BYTE), 
	"EMP_ADDRESS" VARCHAR2(50 BYTE), 
	"EMP_TEL" VARCHAR2(10 BYTE), 
	"EMP_POSITION" VARCHAR2(5 BYTE), 
	"HIRE_DATE" DATE, 
	"SALARY" NUMBER, 
	"DEP_ID" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ITEMS
--------------------------------------------------------

  CREATE TABLE "COMPANY"."ITEMS" 
   (	"ITEM_ID" NUMBER, 
	"ITEM_DESCRIPTION" VARCHAR2(30 BYTE), 
	"ITEM_TYPE" VARCHAR2(30 BYTE), 
	"ITEM_UNIT" CHAR(3 BYTE), 
	"ITEM_QNT" NUMBER DEFAULT NULL, 
	"UNIT_PRICE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDER_DETAILS
--------------------------------------------------------

  CREATE TABLE "COMPANY"."ORDER_DETAILS" 
   (	"ORD_DET_ID" NUMBER, 
	"ORD_ID" NUMBER, 
	"ITEM_ID" NUMBER, 
	"ITEM_QNT" NUMBER, 
	"ITEM_DESCR" VARCHAR2(50 BYTE), 
	"TOTAL_PRICE" NUMBER, 
	"TOT_PRI_DISC" NUMBER, 
	"CUST_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "COMPANY"."ORDERS" 
   (	"ORD_ID" NUMBER, 
	"CUST_ID" NUMBER, 
	"EMP_ID" NUMBER, 
	"ORD_DATE" DATE DEFAULT SYSDATE, 
	"ORD_REC_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VU_CUST_MONTH
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "COMPANY"."VU_CUST_MONTH" ("CUST_ID", "CUST_SURNAME", "CUST_ADDRESS") AS 
  SELECT CUST_ID, CUST_SURNAME, CUST_ADDRESS
   FROM CUSTOMERS
   WHERE CUST_DATE_START between '1/1/2019 DATE' AND '31/5/2019 DATE'
;
--------------------------------------------------------
--  DDL for View VU_ITEM_GR50_LESS100
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "COMPANY"."VU_ITEM_GR50_LESS100" ("ITEM_ID", "ITEM_DESCRIPTION") AS 
  SELECT ITEM_ID, ITEM_DESCRIPTION
   FROM ITEMS
   WHERE UNIT_PRICE >  50 AND UNIT_PRICE < 100
;
--------------------------------------------------------
--  DDL for View VU_ITEM_LESSTHAN_30
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "COMPANY"."VU_ITEM_LESSTHAN_30" ("ITEM_ID", "ITEM_DESCRIPTION") AS 
  SELECT ITEM_ID, ITEM_DESCRIPTION
   FROM ITEMS
   WHERE ITEM_QNT < =  30
;
--------------------------------------------------------
--  DDL for View VU_ITEM_TYPE
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "COMPANY"."VU_ITEM_TYPE" ("ITEM_ID", "ITEM_DESCRIPTION") AS 
  SELECT ITEM_ID, ITEM_DESCRIPTION
   FROM ITEMS
   WHERE ITEM_TYPE = 'HARDWARE'
;
REM INSERTING into COMPANY.CUSTOMERS
SET DEFINE OFF;
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('10','KOSTAS','PANOU','ADD_1','2107776666','cust1@gmail.com','098765432',to_date('01/01/19','DD/MM/RR'),'5','small','OLA KALA');
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('20','JOHN','WHITE','ADD_2','2105554444','white@yahoo.com','087654321',to_date('01/01/19','DD/MM/RR'),'10','med','very good');
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('30','GEORGE','SMITH','ADD_3','2104445555','smith@gmail.com','076543212',to_date('10/02/19','DD/MM/RR'),'5','small','good');
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('40','STEVE','MURPHY','ADD_4','2105556666','murphy@gmail.com','065432123',to_date('15/02/19','DD/MM/RR'),'5','small','very good');
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('50','NICK','JONES','ADD_5','2106667777','jones@gmail.com','054321234',to_date('03/03/19','DD/MM/RR'),'10','med','very good');
Insert into COMPANY.CUSTOMERS (CUST_ID,CUST_NAME,CUST_SURNAME,CUST_ADDRESS,CUST_TEL,CUST_EMAIL,CUST_AFM,CUST_DATE_START,CUST_DISCOUNT,CUST_TYPE,CUST_COMMENTS) values ('60','SIMON','JOHNSON','AD_6','2108889999','johnsom@hotmail.com','043212345',to_date('01/04/19','DD/MM/RR'),'20','big','very good');
REM INSERTING into COMPANY.DEPARTMENTS
SET DEFINE OFF;
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('100','SALES','ATHENS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('200','ACC','PEIREUS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('300','MARKETING','ATHENS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('400','MANAGEMENT','ATHENS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('500','IT','ATHENS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('600','ENG_1','ATHENS');
Insert into COMPANY.DEPARTMENTS (DEP_ID,DEP_NAME,DEP_LOCATION) values ('700','ENG_2','PEIREUS');
REM INSERTING into COMPANY.EMPLOYEES
SET DEFINE OFF;
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('1','dimitris','sklavounos','add_1','2102223333','man',to_date('01/01/19','DD/MM/RR'),'2000','100');
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('2','john','smith','add_2','2103334444','acc',to_date('02/03/19','DD/MM/RR'),'1500','100');
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('3','Nick','Johnson','Add_3','2103335555','sales',to_date('01/04/19','DD/MM/RR'),'1250','200');
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('4','Tom','Couper','add_4','2104445555','man',to_date('15/05/19','DD/MM/RR'),'2000','300');
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('5','Steve','Thompson','add_3','2105556666','sales',to_date('02/05/19','DD/MM/RR'),'1250','200');
Insert into COMPANY.EMPLOYEES (EMP_ID,EMP_NAME,EMP_SURNAME,EMP_ADDRESS,EMP_TEL,EMP_POSITION,HIRE_DATE,SALARY,DEP_ID) values ('6','Peter','Johnson','add_6','2106667777','acc',to_date('30/06/19','DD/MM/RR'),'1500','200');
REM INSERTING into COMPANY.ITEMS
SET DEFINE OFF;
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('10','HDD','HARDWARE','TEM','20','120');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('20','HDD SSD','HARDWARE','TEM','50','160');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('30','MB ASUS','HARDWARE','TEM','90','95');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('40','MB OEM','HARDWARE','TEM','120','75');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('50','VGA OEM','HARDWARE','TEM','40','80');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('60','MONITOR 21"','HARDWARE','TEM','50','110');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('70','MONITOR 29"','HARDWARE','TEM','25','150');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('80','PRINTER HP DESKJET','HARDWARE','TEM','40','40');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('90','PRINTER HP LAZER','HARDWARE','TEM','30','55');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('100','PRINTER HP CLOR LAZER','HARDWARE','TEM','25','70');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('110','WINDOWS 10 HOME','SOFTWARE','TEM','70','80');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('120','WINDOWS 10 PRO','SOFTWARE','TEM','60','100');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('130','MS-OFFICE HOME','SOFTWARE','TEM','40','110');
Insert into COMPANY.ITEMS (ITEM_ID,ITEM_DESCRIPTION,ITEM_TYPE,ITEM_UNIT,ITEM_QNT,UNIT_PRICE) values ('140','MS-OFFICE PRO','SOFTWARE','TEM','40','140');
REM INSERTING into COMPANY.ORDER_DETAILS
SET DEFINE OFF;
Insert into COMPANY.ORDER_DETAILS (ORD_DET_ID,ORD_ID,ITEM_ID,ITEM_QNT,ITEM_DESCR,TOTAL_PRICE,TOT_PRI_DISC,CUST_ID) values ('1','10','10','2','HDD','240','228','10');
REM INSERTING into COMPANY.ORDERS
SET DEFINE OFF;
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('1','10','1',to_date('12/01/20','DD/MM/RR'),to_date('12/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('2','10','1',to_date('13/01/20','DD/MM/RR'),to_date('13/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('3','30','2',to_date('13/01/20','DD/MM/RR'),to_date('15/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('4','30','2',to_date('14/01/20','DD/MM/RR'),to_date('14/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('5','40','2',to_date('14/01/20','DD/MM/RR'),to_date('14/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('6','40','2',to_date('15/01/20','DD/MM/RR'),to_date('15/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('7','40','2',to_date('16/01/20','DD/MM/RR'),to_date('18/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('8','50','3',to_date('16/01/20','DD/MM/RR'),to_date('17/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('9','50','3',to_date('17/01/20','DD/MM/RR'),to_date('18/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('10','60','4',to_date('17/01/20','DD/MM/RR'),to_date('18/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('11','60','4',to_date('18/01/20','DD/MM/RR'),to_date('18/01/20','DD/MM/RR'));
Insert into COMPANY.ORDERS (ORD_ID,CUST_ID,EMP_ID,ORD_DATE,ORD_REC_DATE) values ('12','60','4',to_date('20/01/20','DD/MM/RR'),to_date('21/01/20','DD/MM/RR'));
--------------------------------------------------------
--  DDL for Index CUST_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."CUST_ID_PK" ON "COMPANY"."CUSTOMERS" ("CUST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."DEP_ID_PK" ON "COMPANY"."DEPARTMENTS" ("DEP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."EMP_ID_PK" ON "COMPANY"."EMPLOYEES" ("EMP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ITEM_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."ITEM_ID_PK" ON "COMPANY"."ITEMS" ("ITEM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORD_DET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."ORD_DET_PK" ON "COMPANY"."ORDER_DETAILS" ("ORD_DET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORD_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPANY"."ORD_ID_PK" ON "COMPANY"."ORDERS" ("ORD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TRIG_SEQ_ITEM_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "COMPANY"."TRIG_SEQ_ITEM_ID" 
BEFORE INSERT ON ITEMS 
FOR EACH ROW
BEGIN
  :new.item_id:=SEQ_ITEM_ID.nextval;
END;

/
ALTER TRIGGER "COMPANY"."TRIG_SEQ_ITEM_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_SEQ_ORD_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "COMPANY"."TRIG_SEQ_ORD_ID" 
BEFORE INSERT ON ORDERS 

FOR EACH ROW

BEGIN
  :NEW.ORD_ID:=SEQ_ORD_ID.nextval;
END;

/
ALTER TRIGGER "COMPANY"."TRIG_SEQ_ORD_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_TOTAL_PRICE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "COMPANY"."TRIG_TOTAL_PRICE" 
BEFORE INSERT OR UPDATE ON ORDER_DETAILS 

FOR EACH ROW

DECLARE

 tot_price ORDER_DETAILS.TOTAL_PRICE%TYPE;
 tp_discount ORDER_DETAILS.TOTAL_PRICE%TYPE;


BEGIN
  SELECT UNIT_PRICE INTO tot_price
  FROM ITEMS
  WHERE ITEM_ID =:new.ITEM_ID;

  :new.TOTAL_PRICE := tot_price * :new.ITEM_QNT;

  SELECT CUST_DISCOUNT INTO tp_discount
  FROM CUSTOMERS
  WHERE CUST_ID =:new.CUST_ID;

  :new.TOT_PRI_DISC := :new.TOTAL_PRICE-(tp_discount* :new.TOTAL_PRICE)/100;


END;

/
ALTER TRIGGER "COMPANY"."TRIG_TOTAL_PRICE" ENABLE;
--------------------------------------------------------
--  Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."ITEMS" ADD CONSTRAINT "ITEM_ID_PK" PRIMARY KEY ("ITEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."ORDER_DETAILS" ADD CONSTRAINT "ORD_DET_PK" PRIMARY KEY ("ORD_DET_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."CUSTOMERS" ADD CONSTRAINT "CUST_ID_PK" PRIMARY KEY ("CUST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "COMPANY"."EMPLOYEES" ADD CONSTRAINT "HIRE_DATE" CHECK (HIRE_DATE BETWEEN '01-JAN-2019' AND '31-DEC-2019') ENABLE;
  ALTER TABLE "COMPANY"."EMPLOYEES" ADD CONSTRAINT "EMP_ID_PK" PRIMARY KEY ("EMP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."DEPARTMENTS" ADD CONSTRAINT "DEP_ID_PK" PRIMARY KEY ("DEP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."ORDERS" ADD CONSTRAINT "ORD_ID_PK" PRIMARY KEY ("ORD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."ORDER_DETAILS" ADD CONSTRAINT "ORD_ID_FK" FOREIGN KEY ("ORD_ID")
	  REFERENCES "COMPANY"."ORDERS" ("ORD_ID") ENABLE;
  ALTER TABLE "COMPANY"."ORDER_DETAILS" ADD CONSTRAINT "ITEM_ID_FK" FOREIGN KEY ("ITEM_ID")
	  REFERENCES "COMPANY"."ITEMS" ("ITEM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "COMPANY"."ORDERS" ADD CONSTRAINT "CUST_ID_FK" FOREIGN KEY ("CUST_ID")
	  REFERENCES "COMPANY"."CUSTOMERS" ("CUST_ID") ENABLE;
  ALTER TABLE "COMPANY"."ORDERS" ADD CONSTRAINT "EMP_ID_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "COMPANY"."EMPLOYEES" ("EMP_ID") ENABLE;
