CREATE DATABASE CONSULTATION;

--1
CREATE TABLE DOCTOR(ID INT PRIMARY KEY NOT NULL,
DOC_NAME VARCHAR(30) NOT NULL,
SPECIALIZATION VARCHAR(30) NOT NULL);

INSERT INTO DOCTOR VALUES(1,'DR.P.JAYACHANDRA','CARDIALOGIST'),(2,'DR.K.SUDHA','CARDIALOGIST'),(3,'DR.P.KAVYA','DERMATOLOGIST'),(4,'DR.S.SARITHA','GYNACOLOGIST');

SELECT * FROM DOCTOR;

CREATE TABLE APPOINTMENTS(APPOINTMENT_ID INT PRIMARY KEY NOT NULL,
ID INT NOT NULL ,
PATIENT_ID INT NOT NULL ,
FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT (PATIENT_ID),
FOREIGN KEY (ID) REFERENCES DOCTOR(ID));

INSERT INTO APPOINTMENTS VALUES(101,1,51),(102,2,52),(103,3,53),(104,4,54);

SELECT * FROM APPOINTMENTS;

CREATE TABLE PATIENT(
PATIENT_ID INT PRIMARY KEY NOT NULL,
PATIENT_NAME VARCHAR(20) NOT NULL,
PATIENT_AGE INT NOT NULL);

INSERT INTO PATIENT VALUES (51,'CHOTA',46),(52,'CHUTKI',29),(53,'JAGGU',51),(54,'RAJU',20);

SELECT * FROM PATIENT;

CREATE TABLE REVIEW(REVIEW_NUMBER INT PRIMARY KEY NOT NULL,
ID INT NOT NULL,
PATIENT_ID INT NOT NULL,
REVIEW VARCHAR(20) NOT NULL,
FOREIGN KEY(PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
FOREIGN KEY(ID) REFERENCES DOCTOR (ID));

INSERT INTO REVIEW VALUES (1001,1,51,'GOOD'),(1002,2,52,'SATISFACTORY'),(1003,3,53,'VERY GOOD'),(1004,4,54,'BAD');

SELECT * FROM REVIEW;






-- 2
CREATE TABLE CONTACT(ID INT PRIMARY KEY NOT NULL,
EMAIL VARCHAR(30) NOT NULL,
FNAME VARCHAR(30) NOT NULL,
LNAME VARCHAR(30) NOT NULL,
COMPANY VARCHAR(30) NOT NULL,
ACTIVE_FLAG INT NOT NULL,
OPT_OUT INT NOT NULL);

INSERT INTO CONTACT VALUES(123,"a@a.com","Kian","Seth","ABC",1,1),
(133,"b@a.com","Neha","Seth","ABC",1,0),
(234,"c@c.com","Puru","Malik","CDF",0,0),
(342,"d@d.com","Sid","Maan","TEG",1,0);

SELECT * FROM CONTACT;


-- 1. Select all columns from the contact table where the active flag is 1
SELECT * FROM CONTACT WHERE ACTIVE_FLAG = 1;

-- 2. Deactivate contacts who are opted out
DELETE FROM CONTACT WHERE OPT_OUT="1";

-- 3.Delete all the contacts who have the company name as ‘ABC’
DELETE FROM CONTACT WHERE COMPANY="ABC";

-- 4.Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
INSERT INTO CONTACT VALUES(658,"mili@gmail.com","mili","seth","dgh",1,1);

-- 5.Pull out the unique values of the company column 
SELECT DISTINCT COMPANY FROM CONTACT;

-- 6.Update name “mili” to “niti”
UPDATE CONTACT SET FNAME="niti" where FNAME="mili";






-- 3
CREATE TABLE CUSTOMER2(
CUSTOMER_ID INT PRIMARY KEY NOT NULL,
CUST_NAME VARCHAR(30) NOT NULL,
CITY VARCHAR(30) NOT NULL,
GRADE INT,
SALESMAN_ID INT NOT NULL,FOREIGN KEY(SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID));

INSERT INTO CUSTOMER2 VALUES(3002,'Nick Rimando','New York',100 ,5001),
(3007,'Brad Davis','New York',  200 ,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green', 'London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009 ,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor', 'Moscow',200,5007);

INSERT INTO CUSTOMER2 (CUSTOMER_ID,CUST_NAME,CITY,GRADE,SALESMAN_ID)VALUES(3001,'Brad Guzan','London',NULL,5005);
 
 SELECT * FROM CUSTOMER2;
 
CREATE TABLE SALESMAN1(
SALESMAN_ID INT PRIMARY KEY NOT NULL,
SALESMAN_NAME VARCHAR(40) ,
CITY VARCHAR(40),
COMMISSION FLOAT NOT NULL);

INSERT INTO SALESMAN1 VALUES(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

SELECT * FROM SALESMAN1;








