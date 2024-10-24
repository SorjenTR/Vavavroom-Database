
CREATE DATABASE MAINENGINE


--*****************************   SECTION 1 : CREATING TABLES AND INSERTING SOME VALUES   ***********************************


--------------------------------------EMPLOYEE_TYPE_RATE TABLE-------------------------------------------------

CREATE TABLE employee_type_rate(
emp_type VARCHAR(10) NOT NULL PRIMARY KEY  ,
Hourly_rate INTEGER NOT NULL
)

INSERT INTO employee_type_rate VALUES ('Full-time',175)
INSERT INTO employee_type_rate VALUES ('Part-time',125)

SELECT * FROM employee_type_rate



--------------------------------------SHOWROOM TABLE-------------------------------------------------------
CREATE TABLE showroom
(
  S_ID INTEGER PRIMARY KEY NOT NULL,
  S_location VARCHAR(50) NOT NULL,
  S_contact# INTEGER NOT NULL,

 );

INSERT INTO showroom VALUES(01,'Tyack, Mauritius',57655508);
INSERT INTO showroom VALUES(02,'Flacq, Mauritius',58253488);
INSERT INTO showroom VALUES(03,'Port-Louis, Mauritius',57684252);

SELECT *
FROM showroom;




---------------------------------------EMPLOYEE TABLE--------------------------------------------

CREATE TABLE employee
(
  Emp_ID VARCHAR(5) PRIMARY KEY CHECK   ((left(Emp_ID,1) in ( 'E')) and (len(Emp_ID)=5)  and  substring(Emp_ID,2,len(Emp_ID)) LIKE '%[0-9]%'),
  Emp_fname VARCHAR(50) NOT NULL,
  Emp_lname VARCHAR(50) NOT NULL,
  Emp_email VARCHAR(50),
  Emp_phone INTEGER NOT NULL,
  Emp_addr VARCHAR(50) NOT NULL,
  Emp_DOB DATE NOT NULL  CHECK (Emp_DOB<GETDATE()),
  Emp_hiredate DATE NOT NULL CHECK (Emp_hiredate<=GETDATE()),
  Emp_hours FLOAT NOT NULL,
  emp_type VARCHAR(10) NOT NULL CHECK (emp_type IN ('Full-time','Part-time')) REFERENCES employee_type_rate(emp_type),
  Supervisor_ID VARCHAR(5) NOT NULL,
  S_ID INTEGER NOT NULL REFERENCES showroom(S_ID),
  DNO INTEGER NOT NULL
  );

 INSERT INTO employee VALUES('E0001','Tesheena','Punio Naiko','tesheena.naiko@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,1);
 INSERT INTO employee VALUES('E0002','Ryan','Asiriah','ryan.asiriah@umail.uom.ac.mu',58011662,'Res. Les Palmar�s,Plaine Magnien','01-JUL-2000','04-JAN-2020',100,'Part-time','E0002',03,2);
 INSERT INTO employee VALUES('E0003','Pravish','Digumber','pravish.digumber@umail.uom.ac.mu',57150160,'Allee Brillant,Castel','10-JAN-2021','25-APR-2019',165,'Full-time','E0002',02,1);
 INSERT INTO employee VALUES('E0004','Naghma','Nundloll','naghma.nundloll@umail.uom.ac.mu',57771534,'Jagrity Road,Melrose','09-FEB-2000','12-JAN-2019',162,'Full-time','E0002',02,2);
 INSERT INTO employee VALUES('E0005','Kevin','Moonesawmy','kevin.moonesawmy@umail.uom.ac.mu',57584150,'Residence Anthurium,Henrietta','01-FEB-2001','05-FEB-2020',90,'Part-time','E0002',03,1);
 INSERT INTO employee VALUES('E0006','Keshini','Ramjug','keshini.ramjug@umail.uom.ac.mu',54777726,'Royal Road,Long Mountain','4-AUG-2001','11-FEB-2019',165,'Full-time','E0002',01,1);
 INSERT INTO employee VALUES('E0007','Darshini','Dhowtall','darshini.dhowtall@umail.uom.ac.mu',59468690,'Belv�d�re Road,Bris�e-Verdi�re','20-APR-2001','30-JAN-2019',95,'Part-time','E0002',01,3);
 INSERT INTO employee VALUES('E0008','Harideva','Narsiah','harideva.narsiah@umail.uom.ac.mu',58180378,'Cadillac Lane,Agrement St Pierre','10-JAN-2001','1-FEB-2018',150,'Full-time','E0015',01,2);
 INSERT INTO employee VALUES('E0009','Anisha','Coopen','anisha.coopen@umail.uom.ac.mu',59161580,'School lane,Chamouny','25-JUL-2001','25-JAN-2018',160,'Full-time','E0015',02,1);
 INSERT INTO employee VALUES('E0010','Abhishek ','Keesoony','abhishek.keesoony@umail.uom.ac.mu',57641907,'Royal Road,Verdun','08-JUL-2001','25-APR-2020',160,'Full-time','E0015',03,1);
 INSERT INTO employee VALUES('E0011','Shakina',' Oodally','shakina.oodally@umail.uom.ac.mu',57594082,'Sir Edgar Laurent street,Curepipe','26-JUL-2001','26-FEB-2019',100,'Part-time','E0015',01,3);
 INSERT INTO employee VALUES('E0012','Al-Ryhan','Wahid Abi','ryhan.wahid@umail.uom.ac.mu',58022193,'Dr hassen sakir street,Port Louis','10-JUL-2000','20-JAN-2020',175,'Full-time','E0015',03,3);
 INSERT INTO employee VALUES('E0013','Jeenita','Ramanah','jeenita.ramanah@umail.uom.ac.mu',57918633,'Lespoir road Calebasses','26-APR-2000','25-JUL-2018',160,'Full-time','E0015',02,2);
 INSERT INTO employee VALUES('E0014','Bhavisha','Naidoo Ah-Moo','bhavisha.naidoo@umail.uom.ac.mu',58106902,'School lane,Chamouny','19-FEB-2001','19-JAN-2019',165,'Full-time','E0015',01,3);
 INSERT INTO employee VALUES('E0015','Jeevesh','Dindyal','jeevesh.dindyal@umail.uom.ac.mu',57198900,'Forest Side,Curepipe','19-FEB-2001','17-APR-2001',170,'Full-time','E0015',02,1);

SELECT * 
FROM employee




---------------------------------DEPARTMENT TABLE--------------------------------------------

CREATE TABLE department(
 DNO INTEGER NOT NULL PRIMARY KEY,
 Dept_name VARCHAR(20) NOT NULL,
 MGR_ID VARCHAR(5) NOT NULL 
 );

INSERT INTO department VALUES (1,'Administration Dept','E0001');
INSERT INTO department VALUES (2,'Sales Dept','E0002');
INSERT INTO department VALUES (3,'Mechanic Dept','E0003');

Select * FROM department;
  


 ---------------------ADDING FOREIGN KEYS IN DEPARTMENT TABLE AND EMPLOYEE TABLE------------------------

 ALTER TABLE department 
 ADD FOREIGN KEY (MGR_ID) REFERENCES employee(Emp_ID)

  ALTER TABLE employee
  ADD FOREIGN KEY(Supervisor_ID) REFERENCES employee(Emp_ID);

  ALTER TABLE employee
  ADD FOREIGN KEY(DNO) REFERENCES department(DNO);




-----------------------------------SUPPLIER TABLE----------------------------------------

CREATE TABLE supplier
(
 Sup_ID VARCHAR(7) PRIMARY KEY,
 Sup_name VARCHAR(30) NOT NULL,
 Sup_email VARCHAR(30) NOT NULL CHECK(Sup_email like '%@%.%'),
 Sup_contact VARCHAR(15) NOT NULL,
 Country VARCHAR(15) NOT NULL,
 Stat VARCHAR(15) NOT NULL,
 Zipcode INTEGER NOT NULL,
 Sup_otherdetails VARCHAR(50) NOT NUll,
 );
 
 INSERT INTO supplier VALUES('SUP0001','Toyota Mortor Corporation','toyotamortor@gmail.com','+81 13425677','Japan','Tokyo',1900100,'Provides only Toyota vehicles')
 INSERT INTO supplier VALUES('SUP0002','Vehicle Corporation','vehiclecorporation@gmail.com','+91 11236568','India','Maharashtra',246439, 'Supply with Nissan and Mitmitsubishi vehicles  ')
 INSERT INTO supplier values('SUP0003','Motor vehicle Ltd','motorvltd@gmail.com','+91 22227766','India','Goa',142634,'Supply with all types of vehicles')
 INSERT INTO supplier values('SUP0004','China Auto Corporation','chinaauto@gmail.com','+86 18364573929','China','Gansu',253436,'Supply with Audi vehicles')
 INSERT INTO supplier values('SUP0005','Automotor Ltd','automotor@gmail.com','+86 2625345363','China','Jiangsu',5454600,'Supply only Toyota,BMW and Chevrolet vehicles ')
 INSERT INTO supplier values('SUP0006','Tenneco Ltd','tenneco@gmail.com','+81 181763636','Japan','Tokyo',1900100,'Supply all types of vehicles')
 INSERT INTO supplier values('SUP0007','Central Motor Wheel of Japan','centralmotorwheel@gmail.com','+81 272763545','Japan','Tokyo',1900100,'Supply with only cars')

 SELECT *
 FROM supplier;




-----------------------------------------------VEHICLE TABLE-------------------------------------------------------------------

 CREATE TABLE vehicle 
 (V_ID VARCHAR(6) PRIMARY KEY NOT NULL CHECK ((left(V_ID,1) in ( 'V')) and (len(V_ID)=6)  and  substring(V_ID,2,len(V_ID)) LIKE '%[0-9]%'),
  V_type VARCHAR(20) NOT NULL,
  V_make VARCHAR(20) NOT NULL,
  V_model VARCHAR(30) NOT NULL,
  V_color VARCHAR(20) NOT NULL,
  V_year INTEGER CHECK (V_year<=YEAR(getdate())),
  Eng_capacity integer not null,
  V_price float not null,
  V_Mileage integer not null,
  Discount float,
  S_ID integer REFERENCES showroom(S_ID),
  Sup_ID VARCHAR(7) REFERENCES supplier(Sup_ID));

  INSERT INTO vehicle VALUES('V00001','Truck','Mitsubishi','Mitsubishi Warrior Manual','Blue',2017,1700,8859555.36,15500,0.00,01,'SUP0002');
  INSERT INTO vehicle VALUES('V00002','Coupe','Audi','Audi A5','Grey',2010,1968,781527.94,0,2.5,01,'SUP0004');
  INSERT INTO vehicle VALUES('V00003','Sedan','Toyota','Yaris Sedan','White',2018,1300,1085000.00,56900,0.00,02,'SUP0001');
  INSERT INTO vehicle VALUES('V00004','Sedan','Nissan','2018 Nissan Versa Sedan 1.6 S','White',2018,1600,542999.10,12000,0.00,02,'SUP0002');
  INSERT INTO vehicle VALUES('V00005','Minivan','Honda','Honda Odyssey','Black',2018,3500,1200785.11,16677,0.00,03,'SUP0006');
  INSERT INTO vehicle VALUES('V00006','Truck','Ford','Ford F-150','White',2020,2700,1040246.25,12000,2.00,01,'SUP0006');
  INSERT INTO vehicle VALUES('V00007','Coope','BMW','BMW M2','Blue',2019,3000,2397499.76,16500,0.00,02,'SUP0005');
  INSERT INTO vehicle VALUES('V00008','Station Wagon','Mercedes','Mercedes-Benz E-Class Wagon','Black',2021,3000,2928694.53,12000,2.5,03,'SUP0003');
  INSERT INTO vehicle VALUES('V00009','Hatchback','Volkswagen','Volkswagen Golf','Red',2015,1197,7046333.97,86455,2.5,02,'SUP0003');
  INSERT INTO vehicle VALUES('V00010','Sport Car','Porsche','Porsche 718 Cayman','White',2020,4000,5642755.44,0,2.00,03,'SUP0007');
  
  Select * FROM vehicle;
  


  
-------------------------------------------------------CUSTOMER TABLE-------------------------------------------------------------------

 CREATE TABLE customer
 (
 Cust_ID VARCHAR(5) PRIMARY KEY CHECK ((left(Cust_ID,1) in ( 'C')) and (len(Cust_ID)=5)  and  substring(Cust_ID,2,len(Cust_ID)) LIKE '%[0-9]%'),
 Cust_fname VARCHAR(30) NOT NULL,
 Cust_lname VARCHAR(30) NOT NULL,
 Cust_email VARCHAR(30) NOT NULL CHECK(Cust_email like '%@%.%'),
 Cust_DOB DATE CHECK (Cust_DOB < GetDate()),
 Cust_addr VARCHAR(30) NOT NULL,
 );

 INSERT INTO customer VALUES ('C0001','Motean','Kezhilen','MoteanKezhilen@gmail.com','22-NOV-2001','Khedoo lane Tyack');
 INSERT INTO customer VALUES ('C0002','Motean','Kenylen','MoteanKenylen@gmail.com','22-NOV-2001','Khedoo lane Tyack');
 INSERT INTO customer VALUES ('C0003','Seegovind','Harsha','SeegovindHarsha@gmail.com','05-DEC-2001','Flacq');
 INSERT INTO customer VALUES ('C0004','Ummavassee','Rivanen','UmmavasseeRivanen@gmail.com','25-NOV-2001','St Julien');
 INSERT INTO customer VALUES ('C0005','Cannoo','Keelan','CannooKeelan@gmail.com','10-JUN-2001','Rose-hill');

 SELECT *
 FROM customer;


--------------------------------------------------CUSTOMER_PHONE TABLE------------------------------------------------------------

CREATE TABLE customer_phone
(
Cust_ID VARCHAR(5) REFERENCES customer(Cust_ID),
Cust_contact VARCHAR(15) NOT NULL,
PRIMARY KEY (Cust_ID,Cust_contact)
);

INSERT INTO customer_phone VALUES ('C0001',57904878);
INSERT INTO customer_phone VALUES ('C0001',57973132);
INSERT INTO customer_phone VALUES ('C0002',57815972);
INSERT INTO customer_phone VALUES ('C0002',6262878);
INSERT INTO customer_phone VALUES ('C0003',57864521);
INSERT INTO customer_phone VALUES ('C0004',59841562);
INSERT INTO customer_phone VALUES ('C0005',52154782);

 SELECT *
 FROM customer_phone;




 -------------------------------------------------SALES TABLE----------------------------------------------------------

 CREATE TABLE sales
 (
 Sales_ID VARCHAR(5) PRIMARY KEY CHECK ((left(Sales_ID,1) in ( 'S')) and (len(Sales_ID)=5)  and  substring(Sales_ID,2,len(Sales_ID)) LIKE '%[0-9]%'), 
 Sales_date DATE NOT NULL,
 Payment_method VARCHAR(20),
 Cust_ID VARCHAR(5) REFERENCES customer(Cust_ID),
 );

 INSERT INTO sales VALUES ('S0001','08-FEB-2021','CASH','C0004');
 INSERT INTO sales VALUES ('S0002','08-FEB-2021','CHEQUE','C0002');
 INSERT INTO sales VALUES ('S0003','14-FEB-2021','CHEQUE','C0001');
 INSERT INTO sales VALUES ('S0004','24-FEB-2021','CHEQUE','C0003');
 INSERT INTO sales VALUES ('S0005','24-FEB-2021','CHEQUE','C0003');
 INSERT INTO sales VALUES ('S0006','27-FEB-2021','CASH','C0005');

 SELECT * FROM sales
 



 -------------------------------------------SERVICING TABLE----------------------------------------------


 CREATE TABLE servicing(
 V_ID VARCHAR(6) REFERENCES vehicle(V_ID),
 Emp_ID VARCHAR(5) REFERENCES employee(Emp_ID),
 Startdate DATE NOT NULL CHECK (Startdate < getdate()),
 Ser_desc VARCHAR(30),
 duration INTEGER NOT NULL
 PRIMARY KEY (V_ID,Emp_ID,Startdate)
 );

 INSERT INTO servicing VALUES ('V00002','E0007','10-JAN-2021',' INTERIM CAR SERVICE',1);
 INSERT INTO servicing VALUES ('V00005','E0012','20-FEB-2021',' FULL CAR SERVICE',3);
 INSERT INTO servicing VALUES ('V00006','E0011','05-JAN-2021',' MAJOR CAR SERVICE',1);
 INSERT INTO servicing VALUES ('V00009','E0007','02-JAN-2021',' FULL CAR SERVICE',2);
 INSERT INTO servicing VALUES ('V00007','E0014','10-JAN-2021',' MAJOR CAR SERVICE',2);

  Select * FROM servicing;


 ---------------------------------------------------SHOWROOM_SALES TABLE---------------------------------------------

 CREATE TABLE showroom_sales(
 S_ID INTEGER REFERENCES showroom (S_ID),
 Sales_ID VARCHAR(5) REFERENCES sales (Sales_ID),
 V_ID VARCHAR(6) REFERENCES vehicle (V_ID)
 PRIMARY KEY (S_ID,Sales_ID)
 );

 INSERT INTO showroom_sales VALUES (1,'S0001','V00002');
 INSERT INTO showroom_sales VALUES (3,'S0002','V00009');
 INSERT INTO showroom_sales VALUES (3,'S0003','V00007');
 INSERT INTO showroom_sales VALUES (1,'S0004','V00005');
 INSERT INTO showroom_sales VALUES (2,'S0005','V00003');
 INSERT INTO showroom_sales VALUES (2,'S0006','V00004');





---------------------- DISPLAYING ALL TABLES--------------

  SELECT * FROM employee
  SELECT * FROM employee_type_rate
  SELECT * FROM showroom
  SELECT * FROM department
  SELECT * FROM supplier
  SELECT * FROM vehicle
  SELECT * FROM customer
  SELECT * FROM customer_phone
  SELECT * FROM sales
  SELECT * FROM servicing
  SELECT * FROM showroom_sales








--**********************************   SECTION 2 : PROCEDURES   **********************************************



---------	Stored procedure to insert values into the employee Table  ------

ALTER PROCEDURE sp_ins_emp  @Emp_fname VARCHAR(50),@Emp_lname VARCHAR(50), @Emp_email VARCHAR(30),@Emp_phone VARCHAR(15),@Emp_addr VARCHAR(50),@Emp_DOB DATE,@Emp_hiredate DATE,@Emp_hours FLOAT,@emp_type VARCHAR(10),@Supervisor_ID VARCHAR(5),@S_ID INTEGER,@DNO INTEGER
AS
BEGIN
DECLARE @Emp_ID VARCHAR(5)
DECLARE @maxid VARCHAR(5)
DECLARE @Empnumber INTEGER
   --Incrementing ID
       SET @maxid=(SELECT MAX(Emp_ID) FROM employee)                          --Retrieving Max_ID 
	   SET @Empnumber=CAST((substring(@maxid,2,len(@maxid))) AS INTEGER);     --EXTRACTING NUMERIC PART FROM @maxid
	   SET @Empnumber=@Empnumber+1                                            --INCREMENTING NUMERIC PART
	   IF (LEN(@Empnumber)=1)SET @Emp_ID=CONCAT('E','0','0','0',@Empnumber);  --CONCATENATE 'E' WITH incremented numeric part to form new ID
	   ELSE IF (LEN(@Empnumber)=2)SET @Emp_ID=CONCAT('E','0','0',@Empnumber);
	   ELSE IF (LEN(@Empnumber)=3)SET @Emp_ID=CONCAT('E','0',@Empnumber);
	   ELSE IF (LEN(@Empnumber)=4)SET @Emp_ID=CONCAT('E',@Empnumber);
BEGIN TRY
INSERT INTO employee (Emp_ID,Emp_fname,Emp_lname,Emp_email,Emp_phone,Emp_addr,Emp_DOB,Emp_hiredate,Emp_hours,emp_type,Supervisor_ID,S_ID,DNO)
VALUES (@Emp_ID,@Emp_fname,@Emp_lname,@Emp_email,@Emp_phone,@Emp_addr,@Emp_DOB,@Emp_hiredate,@Emp_hours,@emp_type,@Supervisor_ID,@S_ID,@DNO)
--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_emp 'dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,1

SELECT * FROM employee

DELETE FROM employee WHERE Emp_ID='E0016'





-------------------Stored procedure to insert values into Customer Table and Customer_phone Table-----------------
ALTER PROCEDURE sp_ins_cust @Cust_fname VARCHAR(30),@Cust_lname VARCHAR(30), @Cust_email VARCHAR(30),@Cust_DOB DATE, @Cust_addr VARCHAR(30),@Cust_contact1 VARCHAR(15),@Cust_contact2 VARCHAR(15)
AS
BEGIN
DECLARE @Cust_ID VARCHAR(5)
DECLARE @maxid VARCHAR(5)
DECLARE @Custnumber INTEGER
     --Incrementing ID
	   SET @maxid=(SELECT MAX(Cust_ID) FROM customer)                             --Retrieving Max_ID 
	   SET @Custnumber=CAST((substring(@maxid,2,len(@maxid))) AS INTEGER);        --EXTRACTING NUMERIC PART FROM @maxid
	   SET @Custnumber=@Custnumber+1                                              --INCREMENTING NUMERIC PART
	   IF (LEN(@Custnumber)=1)SET @Cust_ID=CONCAT('C','0','0','0',@Custnumber);   --CONCATENATE 'C' WITH incremented numeric part to form new ID
	   ELSE IF (LEN(@Custnumber)=2)SET @Cust_ID=CONCAT('C','0','0',@Custnumber);
	   ELSE IF (LEN(@Custnumber)=3)SET @Cust_ID=CONCAT('C','0',@Custnumber);
	   ELSE IF (LEN(@Custnumber)=4)SET @Cust_ID=CONCAT('C',@Custnumber);
BEGIN TRY
if (@Cust_contact1 != '') or (@Cust_contact1 IS NOT NULL)
 BEGIN
  INSERT INTO customer (Cust_ID,Cust_fname,Cust_lname,Cust_email,Cust_DOB, Cust_addr)
  VALUES (@Cust_ID,@Cust_fname,@Cust_lname,@Cust_email,@Cust_DOB, @Cust_addr)

  INSERT INTO customer_phone (Cust_ID,Cust_contact)
  VALUES (@Cust_ID,@Cust_contact1)


   IF (@Cust_contact2<>'') or (@Cust_contact2 IS NOT NULL)
    BEGIN
        INSERT INTO customer_phone (Cust_ID,Cust_contact)
        VALUES (@Cust_ID,@Cust_contact2)
    END
 END;
ELSE 
 PRINT 'CUST CONTACT MISSING'
--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail.com','15-JUN-2001','Port-Louis','58253488','58263589'

EXEC sp_ins_cust 'John','Smith','johnsmith@gmail.com','20-JUL-2000','Curepipe','54659858',''

  SELECT * FROM customer 
  SELECT * FROM customer_phone

  DELETE FROM customer_phone WHERE Cust_ID='C0006'
  DELETE FROM customer WHERE Cust_ID='C0006'




------------------------	Stored procedure to insert values into the vehicle Table--------------------------------


ALTER PROCEDURE sp_ins_vehicle  @V_type VARCHAR(20), @V_make VARCHAR(20), @V_model VARCHAR(30), @V_color VARCHAR(20), @V_year INTEGER, @Eng_capacity INTEGER, @V_price FLOAT, @V_mileage INTEGER, @discount FLOAT,@S_ID INTEGER, @Sup_ID VARCHAR(7)
AS
BEGIN
DECLARE @V_ID VARCHAR(6)
DECLARE @maxid VARCHAR(6)
DECLARE @Vnumber INTEGER
     --Incrementing ID
	   SET @maxid=(SELECT MAX(V_ID) FROM vehicle)                            --Retrieving Max_ID 
	   SET @Vnumber=CAST((substring(@maxid,2,len(@maxid))) AS INTEGER);      --EXTRACTING NUMERIC PART FROM @maxid
	   SET @Vnumber=@Vnumber+1                                               --INCREMENTING NUMERIC PART
	   IF (LEN(@Vnumber)=1)SET @V_ID=CONCAT('V','0','0','0','0',@Vnumber);   --CONCATENATE 'V' WITH incremented numeric part to form new ID
	   ELSE IF (LEN(@Vnumber)=2)SET @V_ID=CONCAT('V','0','0','0',@Vnumber);
	   ELSE IF (LEN(@Vnumber)=3)SET @V_ID=CONCAT('V','0','0',@Vnumber);
	   ELSE IF (LEN(@Vnumber)=4)SET @V_ID=CONCAT('V','0',@Vnumber);
	   ELSE IF (LEN(@Vnumber)=5)SET @V_ID=CONCAT('V',@Vnumber);
BEGIN TRY
INSERT INTO vehicle (V_ID,V_type , V_make, V_model, V_color, V_year, Eng_capacity, V_price, V_mileage, discount,S_ID,Sup_ID)
VALUES (@V_ID,@V_type , @V_make, @V_model, @V_color, @V_year, @Eng_capacity, @V_price, @V_mileage, @discount,@S_ID,@Sup_ID)
--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_vehicle 'Sport','Porsche','Porsche 718 Cayman','White',2020,4000,5642755.44,0,2.00,03,'SUP0007'

SELECT * FROM vehicle   

DELETE FROM vehicle where V_ID='V00011'




----------------------------	Stored procedure to insert values into the supplier Table     -------------------------------------


ALTER PROCEDURE sp_ins_sup  @Sup_name VARCHAR(30), @Sup_email VARCHAR(30),@Sup_contact VARCHAR(15),@Country VARCHAR(15),@Stat VARCHAR(15),@Zipcode INTEGER,@Sup_otherdetails VARCHAR(50)
AS
BEGIN
DECLARE @Sup_ID VARCHAR(7)
DECLARE @maxid VARCHAR(7)
DECLARE @Supnumber INTEGER
     --Incrementing ID
	   SET @maxid=(SELECT MAX(Sup_ID) FROM supplier)                             --Retrieving Max_ID
	   SET @Supnumber=CAST((substring(@maxid,4,len(@maxid))) AS INTEGER);        --EXTRACTING NUMERIC PART FROM @maxid
	   SET @Supnumber=@Supnumber+1                                               --INCREMENTING NUMERIC PART
	   IF (LEN(@Supnumber)=1)SET @Sup_ID=CONCAT('SUP','0','0','0',@Supnumber);   --CONCATENATE 'SUP' WITH incremented numeric part to form new ID
	   ELSE IF (LEN(@Supnumber)=2)SET @Sup_ID=CONCAT('SUP','0','0',@Supnumber);
	   ELSE IF (LEN(@Supnumber)=3)SET @Sup_ID=CONCAT('SUP','0',@Supnumber);
	   ELSE IF (LEN(@Supnumber)=4)SET @Sup_ID=CONCAT('SUP',@Supnumber);
BEGIN TRY
INSERT INTO supplier (Sup_ID,Sup_name,Sup_email,Sup_contact,Country,Stat,Zipcode,Sup_otherdetails)
VALUES (@Sup_ID,@Sup_name,@Sup_email,@Sup_contact,@Country,@Stat,@Zipcode,@Sup_otherdetails)
--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com','+230 272763542','Mauritius','Savanne',1900102,'Supply with only cars'

  SELECT * FROM supplier

  DELETE FROM supplier where Sup_ID='SUP0008'






--------------------------	Stored procedure to insert values into sales Table and sales_showroom Table  ---------------------------------------     
	

ALTER PROCEDURE sp_ins_sales  @Sales_date DATE,@Payment_method VARCHAR(10),@Cust_ID VARCHAR(5),@V_ID VARCHAR(6)
AS
BEGIN
DECLARE @Sales_ID VARCHAR(5)
DECLARE @maxid VARCHAR(5)
DECLARE @Snumber INTEGER
DECLARE @S_ID INTEGER
     --Incrementing ID 
	   SET @maxid=(SELECT MAX(Sales_ID) FROM sales)                         --Retrieving Max_ID
	   SET @Snumber=CAST((substring(@maxid,2,len(@maxid))) AS INTEGER);     --EXTRACTING NUMERIC PART FROM @maxid
	   SET @Snumber=@Snumber+1                                              --INCREMENTING NUMERIC PART
	   IF (LEN(@Snumber)=1)SET @Sales_ID=CONCAT('S','0','0','0',@Snumber);  --CONCATENATE 'S' WITH incremented numeric part to form new ID
	   ELSE IF (LEN(@Snumber)=2)SET @Sales_ID=CONCAT('S','0','0',@Snumber);
	   ELSE IF (LEN(@Snumber)=3)SET @Sales_ID=CONCAT('S','0',@Snumber);
	   ELSE IF (LEN(@Snumber)=4)SET @Sales_ID=CONCAT('S',@Snumber);

SET @S_ID= (SELECT S_ID FROM vehicle WHERE V_ID=@V_ID);                     --Retrieving S_ID from vehcle table

BEGIN TRY
INSERT INTO sales (Sales_ID,Sales_date,Payment_method,Cust_ID)
VALUES (@Sales_ID,@Sales_date,@Payment_method,@Cust_ID)

INSERT INTO showroom_sales(S_ID,Sales_ID,V_ID)
VALUES (@S_ID,@Sales_ID,@V_ID)

--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_sales '12-FEB-2021','CASH','C0003','V00001'


SELECT * from sales  
Select * from showroom_sales
Select * from vehicle


DELETE FROM showroom_sales where Sales_ID='S0007'
DELETE FROM sales WHERE Sales_ID='S0007'




------------------------   Stored procedure to insert values into the servicing Table  ------------------------------


ALTER PROCEDURE sp_ins_servicing @V_ID VARCHAR(6),@Emp_ID VARCHAR(5),@Ser_desc VARCHAR(30),@duration INTEGER
AS
BEGIN
DECLARE @TODAY AS DATE
SET @TODAY=(SELECT GETDATE())
BEGIN TRY
INSERT INTO servicing (V_ID,Emp_ID,Startdate,Ser_desc,duration)
VALUES (@V_ID,@Emp_ID,@TODAY,@Ser_desc,@duration)
--PRINT 'Insert Successful'
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
END

EXEC sp_ins_servicing 'V00001','E0010',' INTERIM CAR SERVICE',1

SELECT * FROM servicing   

DELETE FROM servicing WHERE V_ID='V00001'




--------------------	  Stored Procedure to calculate and display all salaries of employees along with their IDs   -------------------------------

ALTER PROCEDURE sp_display_all_salaries 
AS 
BEGIN
select Emp_ID,(Emp_hours * Hourly_rate) AS SALARY
FROM employee e ,employee_type_rate t
WHERE e.emp_type = t.emp_type
END

EXEC sp_display_all_salaries




-------------------	Stored Procedure to calculate and display salary of an employee along with his/her name --------------------------- 


ALTER PROCEDURE sp_display_employee_salary @emp_id VARCHAR(5)
AS 
BEGIN
DECLARE @emp_type VARCHAR(10),@hour FLOAT,@hourly_rate INTEGER,@salary INTEGER,@fname VARCHAR(50),@lname VARCHAR(50);
DECLARE @STRINGSALARY VARCHAR(10)

SET @fname=(SELECT Emp_fname FROM employee where Emp_id=@emp_id );
SET @lname=(SELECT Emp_lname FROM employee where Emp_id=@emp_id );

SET @hour=(SELECT Emp_hours from employee where @emp_id=Emp_id );                                     --retrieving hours
SET @hourly_rate=(SELECT Hourly_rate FROM employee_type_rate WHERE emp_type=(SELECT emp_type          --retrieving hourly_rate
                                                                              from employee 
																			  where @emp_id=Emp_id ));

SET @salary=CAST((@hour * CAST(@hourly_rate AS FLOAT)) AS INTEGER);         --Calculating salary (hours * hourly_rate)
SET @STRINGSALARY=CAST(@salary AS VARCHAR(10));
PRINT @fname+' ' +' ' +@lname+'''s ' + 'Salary =Rs ' + @STRINGSALARY
END

EXECUTE sp_display_employee_salary 'E0002'



---------------------------	Stored Procedure to display all vehicles which have been supplied by a particular supplier    ----------------------

ALTER PROCEDURE sp_display_supplied_vehicle @supplier_id VARCHAR(7)
AS
BEGIN
DECLARE @v_id VARCHAR(6),@supplier_name VARCHAR(30);
SELECT V_ID,V_type,V_make,V_model
FROM vehicle
where Sup_ID=@supplier_id
END

EXECUTE sp_display_supplied_vehicle 'SUP0004'
EXECUTE sp_display_supplied_vehicle 'SUP0002' 

SELECT * FROM vehicle





-----	Stored Procedure to check if a vehicle has a discount, then displays the vehicle ID, the original price, the discount(if any) and the new price  ---------------

CREATE PROCEDURE sp_display_vehicleprice @vehicle_id VARCHAR(6)
AS
BEGIN
DECLARE @new_price FLOAT,@original_price Float,@discount_value Float,@STRING_discountvalue VARCHAR(15),@STRING_originalvalue VARCHAR(15),@STRING_newprice VARCHAR(15),@PercentageDiscount FlOAT,@STRINGPercentageDiscount VARCHAR(5);
SET @original_price=(SELECT V_price FROM vehicle WHERE  @vehicle_id=V_ID);                --Retrieving Original Price
SET @PercentageDiscount=(SELECT Discount FROM vehicle WHERE  @vehicle_id=V_ID)            --Retrieving Discount
SET @STRINGPercentageDiscount=CAST(@PercentageDiscount AS VARCHAR(5))
SET @discount_value=((SELECT Discount FROM vehicle WHERE  @vehicle_id=V_ID) / 100) * @original_price;
SET @new_price= @original_price - @discount_value;          --Calculating New Price

SET @STRING_discountvalue=CAST(@discount_value AS VARCHAR(15));
SET @STRING_originalvalue=CAST(@original_price AS VARCHAR(15));
SET @STRING_newprice=CAST(@new_price AS VARCHAR(15));

PRINT 'Vehicle Id= ' + @vehicle_id
PRINT  'Discount=' + @STRINGPercentageDiscount + '%'
PRINT 'Discount value= Rs ' + @STRING_discountvalue
PRINT 'Original Price= Rs ' + @STRING_originalvalue 
PRINT 'New price     = Rs ' + @STRING_newprice
END

EXECUTE sp_display_vehicleprice 'V00002'
SELECT * FROM vehicle
EXECUTE sp_display_vehicleprice 'V00001'





----------- 	Stored Procedure to display age of an employee along with his/her name and ID   ----------

ALTER PROCEDURE sp_emp_age @emp_id VARCHAR(5)
AS
BEGIN
DECLARE @emp_dob DATE,@age INTEGER,@fname VARCHAR(50),@lname VARCHAR(50),@STRING_age VARCHAR(3);
SET @fname=(SELECT Emp_fname FROM employee where @emp_id=Emp_id );       --Retrieving first name
SET @lname=(SELECT Emp_lname FROM employee where @emp_id=Emp_id );       --Retrieving last name
SET @emp_dob=(SELECT Emp_DOB FROM employee WHERE @emp_id=Emp_ID)         --Retrieving Date of Birth
SET @age= year(getdate()) - year(@emp_dob)                               --Calculating age (Current_Year - Year_of_Birth)

SET @STRING_age=CAST(@age AS VARCHAR(3));
PRINT @emp_id 
PRINT @fname+ ' '+@lname 
PRINT 'Age: ' + @STRING_age +' years old'
END

EXECUTE sp_emp_age E0001
EXECUTE sp_emp_age E0012



---------	Stored Procedure to display period of service of an employee in years, along with his/her name and ID     ----------

ALTER PROCEDURE sp_emp_service_period @emp_id VARCHAR(5)
AS
BEGIN
DECLARE @hire_date DATE,@service_period INTEGER,@fname VARCHAR(50),@lname VARCHAR(50),@STRING_serviceperiod VARCHAR(3);

SET @fname = (SELECT Emp_fname FROM employee where @emp_id=Emp_id );        --Retrieving first name
SET @lname = (SELECT Emp_lname FROM employee where @emp_id=Emp_id );        --Retrieving last name
SET @hire_date = (SELECT Emp_hiredate FROM employee WHERE @emp_id=Emp_id ); --Retrieving Hire_Date
SET @service_period = year(getdate()) - year(@hire_date)                    --Calculating age (Current_Year - Year_of_Hire)

SET @STRING_serviceperiod = CAST(@service_period AS VARCHAR(3));

PRINT @emp_id 
PRINT @fname + ' ' + @lname 
PRINT 'Service period: ' + @STRING_serviceperiod +' years'
END

EXECUTE sp_emp_service_period E0001
EXECUTE sp_emp_service_period E0009





------------------------Stored Procedure to increase salary of all employees by 2.5% in sales department if more than 5 cars are sold in a showroom in the last month---------------------------------

ALTER PROCEDURE sp_sales_emp_commission
AS 
BEGIN

select  Emp_ID  ,  Emp_fname,  Emp_lname  ,  S_ID  ,  (Emp_hours * Hourly_rate) AS OLD_SALARY  ,  (Emp_hours * Hourly_rate*1.025) AS NEW_SALARY
FROM employee e ,employee_type_rate t
WHERE e.emp_type = t.emp_type
AND S_ID IN (SELECT ss.S_ID 
            from vehicle v,sales s,showroom_sales ss 
            WHERE (ss.V_ID=v.V_ID AND ss.Sales_ID=s.Sales_ID) 
            AND (DATEPART(m,Sales_date)=DATEPART(m,GETDATE())) 
			AND (DATEPART(yyyy,Sales_date)=DATEPART(yyyy,GETDATE())) 
            GROUP BY ss.S_ID
            HAVING COUNT(ss.S_ID)>=5);
END


/*
----------------------------ALREADY EXECUTED-----------------------------------

EXEC sp_ins_vehicle 'Car','Nissan','Kicks','Red',2021,2000,750000.00,0,0,03,'SUP0001'
EXEC sp_ins_vehicle 'Car','Toyota','Rush','Silver',2020,2500,800000.00,0,2.00,03,'SUP0007'
EXEC sp_ins_vehicle 'Car','Honda','Jazz','Red',2021,1700,850000.00,0,2.5,03,'SUP0001'
EXEC sp_ins_vehicle 'Car','Toyota','Starlet','White',2021,1900,750000.00,0,0,03,'SUP0007'
EXEC sp_ins_vehicle 'Car','Nissan','Maxima','Blue',2020,2000,950000.00,0,0,03,'SUP0002'

EXEC sp_ins_vehicle 'Car','Honda','City','Silver',2021,2100,900000.00,0,2.00,02,'SUP0002'
EXEC sp_ins_vehicle 'Car','Nissan','Kicks','Red',2021,2200,850000.00,0,1.5,02,'SUP0004'

EXEC sp_ins_vehicle 'Car','Toyota','Corolla','Green',2020,4000,800000.00,0,0,01,'SUP0005'


EXEC sp_ins_sales '1-MAY-2021','CASH','C0004','V00011'
EXEC sp_ins_sales '2-MAY-2021','CHEQUE','C0002','V00012'
EXEC sp_ins_sales '12-MAY-2021','CHEQUE','C0001','V00013'
EXEC sp_ins_sales '20-MAY-2021','CASH','C0003','V00014'
EXEC sp_ins_sales '25-MAY-2021','CHEQUE','C0005','V00015'

EXEC sp_ins_sales '25-MAY-2021','CASH','C0004','V00016'
EXEC sp_ins_sales '12-MAY-2021','CHEQUE','C0005','V00017'

EXEC sp_ins_sales '15-MAY-2021','CASH','C0001','V00018'

*/


SELECT * FROM employee
SELECT * FROM vehicle
SELECT * FROM sales
SELECT * FROM showroom_sales
SELECT * FROM vehicle
SELECT * FROM supplier
SELECT * FROM customer


EXEC sp_sales_emp_commission




--***********************************************  SECTION 3 : TRIGGERS  ******************************************************************



---------------------TRIGGER TO CHECK DATA FOR EMPLOYEE INSERTION----------------------------

CREATE TRIGGER tg_checkdata_emp
on employee
INSTEAD OF INSERT
AS
DECLARE @firstname VARCHAR(50);
DECLARE @lastname VARCHAR(30)
DECLARE @Date_of_birth DATE
DECLARE @phone_no INTEGER 
DECLARE @address VARCHAR(50)
DECLARE @employee_type VARCHAR(10)
DECLARE @supervisorID VARCHAR(5)
DECLARE @Departmentno INTEGER
SET @firstname=(SELECT Emp_fname from INSERTED)
SET @lastname=(SELECT Emp_lname from INSERTED)
SET @Date_of_birth=(SELECT Emp_DOB from INSERTED)
SET @address=(SELECT Emp_addr from INSERTED)
SET @employee_type=(SELECT Emp_type from INSERTED)
SET @supervisorID=(SELECT Supervisor_ID from INSERTED)
SET @Departmentno=(SELECT DNO from INSERTED)

--EmployeeID is already incremented in procedure.
If (@firstname IS NULL)
  BEGIN
   PRINT 'INSERT INVALID'
   PRINT 'INSERT FIRSTNAME'
   RETURN;
  END;

If (@lastname IS NULL)
  BEGIN
   PRINT 'INSERT INVALID'
   PRINT 'INSERT LASTNAME'
   RETURN;
  END;

If (@Date_of_birth IS NULL)
  BEGIN
   PRINT 'INSERT INVALID'
   PRINT 'INSERT THE DATE OF BIRTH'
   RETURN;
  END;

IF (@Date_of_birth > GETDATE())
  BEGIN;
   PRINT 'DOB OF INCORRECT RANGE'
   PRINT 'INSERT THE DATE OF BIRTH'
   RETURN;
  End;

If (@address IS NULL)
  BEGIN
   PRINT 'INSERT INVALID'
   PRINT 'INSERT ADDRESS'
   RETURN;
  END;

If (@employee_type NOT IN ('Full-time','Part-time'))
  BEGIN
   PRINT 'INSERT INVALID'
   PRINT 'INSERT THE TYPE OF EMPLOYEE'
   RETURN;
  END;

If (@supervisorID IS NULL)
  BEGIN
   PRINT 'EMPLOYEE SHOULD HAVE A SUPERVISOR'
   PRINT 'INSERT SUPERVISOR ID'
   RETURN;
  END;

If (@Departmentno IS NULL)
  BEGIN
   PRINT 'EMPLOYEE SHOULD BE IN A PARTICULAR DEPARTMENT'
   PRINT 'INSERT HIS/HER DEPARTMENT'
   RETURN;
  END;
 
INSERT INTO employee SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_emp



select * from employee

--correct insert
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,1

--null firstname
EXEC sp_ins_emp NULL,'Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,1

--null lastname
EXEC sp_ins_emp 'Dayalen',NULL,'da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,1

--null DOB
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart',NULL,'2019-04-25',160,'Full-time','E0002',01,1

--DOB out of range
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2021-11-12','2019-04-25',160,'Full-time','E0002',01,1

--address null
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,NULL,'2001-01-10','2019-04-25',160,'Full-time','E0002',01,1

--wrong employee type
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Permanent','E0002',01,1

--supervisor ID null
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time',NULL,01,1

--Department no null
EXEC sp_ins_emp 'Dayalen','Motean','da.motean@umail.uom.ac.mu',59048358,'Temple road,Riviere du Rempart','2001-01-10','2019-04-25',160,'Full-time','E0002',01,NULL


delete from employee where Emp_ID = 'E0016'




---------------------TRIGGER TO CHECK DATA FOR CUSTOMER INSERTION----------------------------

CREATE TRIGGER tg_checkdata_customer
on customer
INSTEAD OF INSERT 
AS 
DECLARE @firstname VARCHAR(30);
DECLARE @lastname VARCHAR(30);
DECLARE @email VARCHAR(30);
DECLARE @DOB DATE;
DECLARE @address VARCHAR(30);
SET @firstname = (SELECT Cust_fname FROM INSERTED)
SET @lastname = (SELECT Cust_lname FROM INSERTED)
SET @email = (SELECT Cust_email FROM INSERTED)
SET @DOB = (SELECT Cust_DOB FROM INSERTED)
SET @address = (SELECT Cust_addr FROM INSERTED)

--Customer ID is already incremented in procedure.

If (@firstname IS NULL)
  BEGIN
   PRINT 'FIRSTNAME MISSING'
   PRINT 'INSERT FIRSTNAME'
   RETURN;
  END;

If (@lastname IS NULL)
  BEGIN
   PRINT 'LASTTNAME MISSING'
   PRINT 'INSERT LASTNAME'
   RETURN;
  END;

If (@email IS NULL)
  BEGIN
   PRINT 'EMAIL MISSING'
   PRINT 'INSERT EMAIL'
   RETURN;
  END;

If (@email NOT LIKE '%@%.%')
  BEGIN
   PRINT 'EMAIL INCORRECT FORMAT'
   PRINT 'INSERT EMAIL'
   RETURN;
  END;

IF (@DOB > GETDATE())
  BEGIN;
   PRINT 'DOB OF INCORRECT RANGE'
   PRINT 'INSERT THE DATE OF BIRTH'
   RETURN;
  End;

If (@address IS NULL)
  BEGIN
   PRINT 'ADDRESS MISSING'
   PRINT 'INSERT ADDRESS'
   RETURN;
  END;

INSERT INTO customer SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_customer



---------------------TRIGGER TO CHECK DATA FOR CUSTOMER PHONE DETAILS INSERTION----------------------------

CREATE TRIGGER tg_checkdata_customerphone
ON customer_phone
INSTEAD OF INSERT
AS
DECLARE @CustomerID VARCHAR(5)
DECLARE @Contact INTEGER
DECLARE @Contact2 INTEGER
SET @CustomerID = (SELECT Cust_ID FROM INSERTED)
SET @Contact = (SELECT Cust_contact FROM INSERTED)


IF NOT EXISTS (SELECT Cust_ID 
               FROM customer
			   WHERE Cust_ID = @CustomerID)
 BEGIN
  PRINT 'CUSTOMER DOES NOT EXIST IN CUSTOMER TABLE'
  PRINT 'ENTER CORRECT CUSTOMER ID PLEASE' 
  RETURN;
 END;

 If (@Contact = '') or (@Contact IS NULL)
  BEGIN
   PRINT 'CUSTOMER CONTACT NUMBER MISSING'
   PRINT 'INSERT CONTACT NUMBER OF CUSTOMER'
   RETURN;
  END;


INSERT INTO customer_phone SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_customerphone



  SELECT * FROM customer 
  SELECT * FROM customer_phone

  DELETE FROM customer_phone WHERE Cust_ID='C0006'
  DELETE FROM customer WHERE Cust_ID='C0006'


--correct insert
EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail.com','15-JUN-2001','Port-Louis','58253488','58263589'
EXEC sp_ins_cust 'John','Smith','johnsmith@gmail.com','20-JUL-2000','Curepipe','54659858',NULL

--null firstname
EXEC sp_ins_cust NULL,'Paul','sarahpaul@gmail.com','15-JUN-2001','Port-Louis','58253488',NULL
EXEC sp_ins_cust NULL,'Paul','sarahpaul@gmail.com','15-JUN-2001','Port-Louis','58253488','58263589'

--null lastname
EXEC sp_ins_cust 'Sarah',NULL,'sarahpaul@gmail.com','15-JUN-2001','Port-Louis','58253488','58263589'
EXEC sp_ins_cust 'John',NULL,'johnsmith@gmail.com','20-JUL-2000','Curepipe','54659858',NULL

--null email
EXEC sp_ins_cust 'Sarah','Paul',NULL,'15-JUN-2001','Port-Louis','58253488','58263589'
EXEC sp_ins_cust 'John','Smith',NULL,'20-JUL-2000','Curepipe','54659858',NULL

--email incorrect format
EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail/*com','15-JUN-2001','Port-Louis','58253488',NULL

--incorrect Date of Birth
EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail.com','15-JUN-2021','Port-Louis','58253488',NULL

--null address
EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail.com','15-JUN-2001',NULL,'58253488',NULL

--contact1 null
EXEC sp_ins_cust 'Sarah','Paul','sarahpaul@gmail.com','15-JUN-2001','Port-Louis',NULL,''






---------------------TRIGGER TO CHECK DATA FOR VEHICLE INSERTION----------------------------

CREATE TRIGGER tg_checkdata_vehicle
ON vehicle
INSTEAD OF INSERT
AS
DECLARE @type VARCHAR(20)
DECLARE @make VARCHAR(20)
DECLARE @model VARCHAR(20)
DECLARE @year INTEGER
DECLARE @capacity INTEGER
DECLARE @price FLOAT
DECLARE @showroomID INTEGER
DECLARE @SupplierID VARCHAR(7)
SET @type = (SELECT V_type FROM INSERTED)
SET @make = (SELECT V_make FROM INSERTED)
SET @model = (SELECT V_model FROM INSERTED)
SET @year = (SELECT V_year FROM INSERTED)
SET @capacity = (SELECT Eng_capacity FROM INSERTED)
SET @price = (SELECT V_price FROM INSERTED)
SET @showroomID = (SELECT S_ID FROM INSERTED)
SET @SupplierID = (SELECT Sup_ID FROM INSERTED)

--VEHICLEID is already incremented in procedure.

If (@type IS NULL)
  BEGIN
   PRINT 'VEHICLE TYPE MISSING'
   PRINT 'INSERT VEHICLE TYPE'
   RETURN;
  END;

If (@make IS NULL)
  BEGIN
   PRINT 'VEHICLE MAKE MISSING'
   PRINT 'INSERT VEHICLE MAKE'
   RETURN;
  END;

If (@model IS NULL)
  BEGIN
   PRINT 'VEHICLE MODEL MISSING'
   PRINT 'INSERT VEHICLE MODEL'
   RETURN;
  END;

If (@year IS NULL)
  BEGIN
   PRINT 'YEAR OF VEHICLE MISSING'
   PRINT 'INSERT VEHICLE YEAR'
   RETURN;
  END;

If (@capacity IS NULL)
  BEGIN
   PRINT 'ENGINE CAPACITY MISSING'
   PRINT 'INSERT VEHICLE ENGINE CAPACITY'
   RETURN;
  END;

If (@price = 0)
  BEGIN
   PRINT 'PRICE OF VEHICLE MISSING'
   PRINT 'INSERT VEHICLE PRICE'
   RETURN;
  END;

IF NOT EXISTS (SELECT Sup_ID 
               from supplier
               WHERE Sup_ID = @SupplierID) 
  BEGIN
   PRINT 'SUPPLIER DOES NOT EXIST'
   PRINT 'ENTER CORRECT SUPPLIER PLEASE' 
   RETURN;
  END;

IF NOT EXISTS (SELECT S_ID 
               from showroom
               WHERE S_ID = @showroomID)
  BEGIN
   PRINT 'SHOWROOM DOES NOT EXIST'
   PRINT 'ENTER CORRECT SHOWROOM PLEASE' 
   RETURN;
  END;

INSERT INTO vehicle SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_vehicle

select * from vehicle

--correct insert
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',2020,4000,5642755.44,0,2.00,03,'SUP0007'

--type null
EXEC sp_ins_vehicle NULL,'BAT','MOBILE','BLACK',2020,4000,5642755.44,0,2.00,03,'SUP0007'

--make null
EXEC sp_ins_vehicle 'HERO CAR',NULL,'MOBILE','BLACK',2020,4000,5642755.44,0,2.00,03,'SUP0007'

--model null
EXEC sp_ins_vehicle 'HERO CAR','BAT',NULL,'BLACK',2020,4000,5642755.44,0,2.00,03,'SUP0007'

--year null
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',NULL,4000,5642755.44,0,2.00,03,'SUP0007'

--capacity null
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',2020,NULL,5642755.44,0,2.00,03,'SUP0007'

--price = 0
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',2020,4000,0,0,2.00,03,'SUP0007'

--unknown supplier
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',2020,4000,5642755.44,0,2.00,03,'SUP0107'

--unknown showroom
EXEC sp_ins_vehicle 'HERO CAR','BAT','MOBILE','BLACK',2020,4000,5642755.44,0,2.00,05,'SUP0007'

delete from vehicle where V_year = 0



---------------------TRIGGER TO CHECK DATA FOR SUPPLIER INSERTION----------------------------

CREATE TRIGGER tg_checkdata_supplier
ON supplier
INSTEAD OF INSERT 
AS
DECLARE @name VARCHAR(30)
DECLARE @email VARCHAR(30)
DECLARE @contactno VARCHAR(15)
DECLARE @country VARCHAR(30)
DECLARE @state VARCHAR(30)
DECLARE @zipcode INTEGER
SET @name = (SELECT Sup_name from INSERTED)
SET @email = (SELECT Sup_email from INSERTED)
SET @contactno = (SELECT Sup_contact from INSERTED)
SET @country = (SELECT Country from INSERTED)
SET @state = (SELECT Stat from INSERTED)
SET @zipcode = (SELECT Zipcode from INSERTED)

--SUPPLIERID is already incremented in procedure.

If (@name IS NULL)
  BEGIN
   PRINT 'SUPPLIER NAME MISSING'
   PRINT 'INSERT NAME OF SUPPLIER'
   RETURN;
  END;

If (@email IS NULL)
  BEGIN
   PRINT 'SUPPLIER EMAIL MISSING'
   PRINT 'INSERT EMAIL OF SUPPLIER'
   RETURN;
  END;

If (@email NOT LIKE '%@%.%')
  BEGIN
   PRINT 'EMAIL INCORRECT FORMAT'
   PRINT 'INSERT EMAIL OF SUPPLIER'
   RETURN;
  END;

If (@contactno IS NULL)
  BEGIN
   PRINT 'SUPPLIER CONTACT NUMBER MISSING'
   PRINT 'INSERT CONTACT NUMBER OF SUPPLIER'
   RETURN;
  END;

If (@country IS NULL)
  BEGIN
   PRINT 'SUPPLIER COUNTRY DETAILS MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

If (@state IS NULL)
  BEGIN
   PRINT 'SUPPLIER STATE DETAILS MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

If (@zipcode = 0)
  BEGIN
   PRINT 'SUPPLIER COUNTRY DETAILS MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

INSERT INTO supplier SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_supplier

select * from supplier 

--correct insert
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com','+230 272763542','Mauritius','Savanne',1900102,'Supply with only cars'

--supplier name null
EXEC sp_ins_sup NULL,'tyackmotor@gmail.com','+230 272763542','Mauritius','Savanne',1900102,'Supply with only cars'

--supplier email null
EXEC sp_ins_sup 'Tyack Motor ltd',NULL,'+230 272763542','Mauritius','Savanne',1900102,'Supply with only cars'

--incorrect email format
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail/*com','+230 272763542','Mauritius','Savanne',1900102,'Supply with only cars'

--contact number null
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com',NULL,'Mauritius','Savanne',1900102,'Supply with only cars'

--country null
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com','+230 272763542',NULL,'Savanne',1900102,'Supply with only cars'

--state null
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com','+230 272763542','Mauritius',NULL,1900102,'Supply with only cars'

--zipcode null
EXEC sp_ins_sup 'Tyack Motor ltd','tyackmotor@gmail.com','+230 272763542','Mauritius','Savanne',0,'Supply with only cars'


delete from supplier where Sup_ID = 'SUP0008'




---------------------TRIGGER TO CHECK DATA FOR SERVICING INSERTION----------------------------

CREATE TRIGGER tg_checkdata_servicing
ON servicing
INSTEAD OF INSERT
AS
DECLARE @VehicleID VARCHAR(6)
DECLARE @EmployeeID VARCHAR(5)
DECLARE @date DATE
DECLARE @Description VARCHAR(50)
DECLARE @duration INTEGER
SET @VehicleID = (SELECT V_ID FROM INSERTED)
SET @EmployeeID= (SELECT Emp_ID FROM INSERTED)
SET @date = (SELECT Startdate FROM INSERTED)
SET @Description = (SELECT Ser_desc FROM INSERTED)
SET @duration = (SELECT duration FROM INSERTED)

IF NOT EXISTS (SELECT V_ID
               FROM vehicle
			   WHERE V_ID = @VehicleID)
 BEGIN
  PRINT 'VEHICLE IS NOT IN DATABASE'
  PRINT 'ENTER CORRECT VEHICLE ID PLEASE' 
  RETURN;
 END;

IF NOT EXISTS (SELECT Emp_ID 
               FROM employee
			   WHERE Emp_ID = @EmployeeID)
 BEGIN
  PRINT 'EMPLOYEE DOES NOT EXIST'
  PRINT 'ENTER CORRECT EMPLOYEE ID PLEASE' 
  RETURN;
 END;

If (@Description IS NULL)
  BEGIN
   PRINT 'DESCRIPTION DETAILS MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

If (@duration IS NULL)
  BEGIN
   PRINT 'DURATION DETAILS MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

INSERT INTO servicing SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_servicing


select * from servicing

--correct insert
EXEC sp_ins_servicing 'V00001','E0010',' INTERIM CAR SERVICE',1

--invalid vehicle ID
EXEC sp_ins_servicing 'V00101','E0010',' INTERIM CAR SERVICE',1

--invalid employee ID
EXEC sp_ins_servicing 'V00001','E1010',' INTERIM CAR SERVICE',1

--description null
EXEC sp_ins_servicing 'V00001','E0010',NULL,1

--duration null
EXEC sp_ins_servicing 'V00001','E0010',' INTERIM CAR SERVICE',NULL


delete from servicing where V_ID ='V00001' AND Emp_ID = 'E0010'



---------------------TRIGGER TO CHECK DATA FOR SALES INSERTION----------------------------

ALTER TRIGGER tg_checkdata_sales
on sales 
INSTEAD OF INSERT 
AS 
DECLARE @salesdate DATE
DECLARE @payment VARCHAR(20)
DECLARE @customerID VARCHAR(5)
SET @salesdate = (SELECT Sales_date FROM INSERTED)
SET @payment = (SELECT Payment_method FROM INSERTED)
SET @customerID = (SELECT Cust_ID FROM INSERTED)

--SALES ID is already incremented in procedure.

If (@salesdate IS NULL)
  BEGIN
   PRINT 'DESCRIPTION DETAILS OF SALES DATE MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

If (@payment IS NULL)
  BEGIN
   PRINT 'DESCRIPTION DETAILS OF THE PAYMENT METHOD MISSING'
   PRINT 'INSERT THE REQUIRED DETAILS'
   RETURN;
  END;

IF NOT EXISTS (SELECT Cust_ID
               FROM customer
			   WHERE Cust_ID = @customerID)
 BEGIN
  PRINT 'CUSTOMER DOES NOT EXIST'
  PRINT 'ENTER CORRECT CUSTOMER ID PLEASE' 
  RETURN;
 END;


INSERT INTO sales SELECT * FROM INSERTED;
PRINT 'Insert Successful'
PRINT 'INCLUDE THE DETAILS IN THE SHOWROOM SALES TABLE'
--END OF TRIGGER tg_checkdata_sales



---------------------TRIGGER TO CHECK DATA FOR SHOWROOM SALES INSERTION----------------------------

CREATE TRIGGER tg_checkdata_showroom_sales
on showroom_sales
INSTEAD OF INSERT 
AS
DECLARE @showroomID INTEGER
DECLARE @SalesID VARCHAR(5)
DECLARE @VehicleID VARCHAR(6)
SET @showroomID = (SELECT S_ID FROM INSERTED)
SET @SalesID = (SELECT Sales_ID FROM INSERTED)
SET @VehicleID = (SELECT V_ID FROM INSERTED)

IF NOT EXISTS (SELECT S_ID
               FROM showroom
			   WHERE S_ID = @showroomID)
 BEGIN
  PRINT 'SHOWROOM DOES NOT EXIST'
  PRINT 'ENTER CORRECT SHOWROOM ID PLEASE' 
  RETURN;
 END;

IF NOT EXISTS (SELECT Sales_ID
               FROM sales
			   WHERE Sales_ID = @SalesID)
 BEGIN
  PRINT 'THIS SALES DOES NOT EXIST'
  PRINT 'ENTER CORRECT SALES ID PLEASE' 
  RETURN;
 END;

IF NOT EXISTS (SELECT V_ID
               FROM vehicle
			   WHERE V_ID = @VehicleID)
 BEGIN
  PRINT 'THIS VEHICLE IS NOT IN OUR RECORD'
  PRINT 'ENTER CORRECT SALES ID PLEASE' 
  RETURN;
 END;

INSERT INTO showroom_sales SELECT * FROM INSERTED;
PRINT 'Insert Successful'
--END OF TRIGGER tg_checkdata_showroom_sales


SELECT * from sales  
Select * from showroom_sales
Select * from vehicle

DELETE FROM showroom_sales where Sales_ID='S0007'
DELETE FROM sales WHERE Sales_ID='S0007'


/*A customer with customer ID C0003 has bought a new car with VEHICLE ID V00001 from MAIN ENGINE SHOWROOM 1 on 12-FEB-2021. He paid by cash.
TABLES REQUIRED : sales, showroom sales*/

--correct insert
EXEC sp_ins_sales '12-FEB-2021','CASH','C0003','V00001'

--sales date null
EXEC sp_ins_sales NULL,'CASH','C0003','V00001'

--payment method null
EXEC sp_ins_sales '12-FEB-2021',NULL,'C0003','V00001'

--invalid customer ID
EXEC sp_ins_sales '12-FEB-2021','CASH','C1003','V00001'



