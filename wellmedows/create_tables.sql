/*
Purpose:
	This file creates the logs for all of Wellmedows Hospital's supply-data. The tables below include a record of all requisitions of supplies,
	supplyers, and the inventories for the hospital's wards. Drugs are given a table of their own due to potential risks.

Work Log:
	Entry 0::
		2020-02-12	Nathan Langenfeld
	
    Entry 1::
		2020-02-14	Nathan Langenfeld
*/
-- This file will destroy all tables in the database and rebuild them. It will also destroy and rebuild the tables
DROP DATABASE IF EXISTS wellmedows;
CREATE DATABASE wellmedows;
USE wellmedows;


/* 
Table syntax:
	CREATE TABLE %insert_name_here%
    (
		primary key #1
		primary key #2
		primary key #etc...
        
        foreign key #1
        foreign key #2
        foreign key #etc...
        
        table specific datum #1
        table specific datum #2
        table specific datum #etc...
        
        primary key (primary key #1)...
        
        foreign key (foreign key #1)...
        
        constraints
    )
*/


DROP TABLE IF EXISTS Suppliers;
CREATE TABLE IF NOT EXISTS Suppliers
(
	Supplier_Number		INTEGER			NOT NULL	auto_increment,
    
	Supplier_Name		VARCHAR(30)		NOT NULL,
    Supplier_Address	VARCHAR(50)		NOT NULL,
    Supplier_Phone		VARCHAR(15)		NOT NULL,
    Supplier_Fax		VARCHAR(15)		NOT NULL,
    
    PRIMARY KEY(Supplier_Number)
    
    
);

/* This table contains the contact info for the companies which Wellmedows purchases supplies from */


DROP TABLE IF EXISTS Supplies;
CREATE TABLE IF NOT EXISTS Supplies
(
    Item_Number				INTEGER			NOT NULL	auto_increment,
    
    Supplier_Number			INTEGER			NOT NULL,
    
	Item_Name				VARCHAR(60)		NOT NULL,
    Item_Description		VARCHAR(300)	NOT NULL,
    Qty_Stock				DECIMAL(10, 6)	NOT NULL,
    Price_Per_Unit			DECIMAL(6, 2)	NOT NULL,
    Reorder_Level			DECIMAL(10, 6)	NOT NULL,
    
    PRIMARY KEY (Item_Number),
    
    FOREIGN KEY (Supplier_Number) REFERENCES Suppliers(Supplier_Number)
);

/* This table contains the inventory status of all the hospital's supplies: pharmacutical or otherwise */


DROP TABLE IF EXISTS Pharmaceutical_Supplies;
CREATE TABLE IF NOT EXISTS Pharmaceutical_Supplies
(
    Item_Number				INTEGER			NOT NULL,
    -- This datum is both the primary key as well as the foreign key
    
    Drug_Number				VARCHAR(10)		NOT NULL,
    Drug_Dosage				DECIMAL(6, 3)	NOT NULL,
    Administration_Method	VARCHAR(50)		NOT NULL,
    
    PRIMARY KEY (Item_Number),
    
    FOREIGN KEY (Item_Number) REFERENCES Supplies(Item_Number)    
);

/* This table contains information specific to the hospital's pharmaceuticals. */



DROP TABLE IF EXISTS Requisions;
CREATE TABLE IF NOT EXISTS Requisions
(
	Requisition_Number		INTEGER			NOT NULL	auto_increment,
    
    Item_Number				INTEGER			NOT NULL,
	Supplier_Number			INTEGER			NOT NULL,
    Ward_Number				INTEGER			NOT NULL,
    Staff_Number			INTEGER			NOT NULL,
    
    Qty_Required			DECIMAL(6, 6)	NOT NULL,
    Price_Per_Unit			DECIMAL(6, 2)	NOT NULL,
    Total_Price				DECIMAL(12, 2),

    Date_Orderd				DATETIME		NOT NULL,
    Expected_Arrival		DATETIME		NOT NULL,
    Arrival_Date			DATETIME,
    
    PRIMARY KEY (Requisition_Number),
    
    FOREIGN KEY	(Item_Number) REFERENCES Supplies(Item_Number),
    FOREIGN KEY (Supplier_Number) REFERENCES Suppliers(Supplier_Number)-- ,
--     FOREIGN KEY (Ward_Number) REFERENCES WardID(Ward_Number),
--     FOREIGN KEY (Staff_Number) REFERENCES StaffID(Staff_Number)
);

/* This table contains the information pertaining to the requisition of supplies. */



-- DROP TABLE IF EXISTS Item_Order_Log;
-- CREATE TABLE IF NOT EXISTS Item_Order_Log
-- (
-- 	Requisition_Number		VARCHAR(10)		NOT NULL,
--     
-- 	Item_Number				VARCHAR(10)		NOT NULL,	
--     Supplier_Number			VARCHAR(10)		NOT NULL,
--     
-- --     Qty_Required				DECIMAL(6, 6),
-- --     Price_Per_Unit			DECIMAL(6, 2),
-- --     Total_Price				DECIMAL(20, 2),

--     Date_Orderd				DATETIME		NOT NULL,
--     Expected_Arrival		DATETIME		NOT NULL,
--     Arrival_Date			DATETIME,
--     
--     PRIMARY KEY(Requisition_Number),
--     
-- 	FOREIGN KEY(Requisition_Number) REFERENCES Requisions(Requisition_Number),
--     FOREIGN KEY(Supplier_Number) REFERENCES Suppliers(Supplier_Number),
--     FOREIGN KEY(Item_Number) REFERENCES Supplies(Item_Number)
-- );


/* The two tables below log the requisitioning and arrival of supplies */


-- DROP TABLE IF EXISTS Item_Arival_Log;
-- CREATE TABLE IF NOT EXISTS Item_Arival_Log
-- (
-- 	Requisition_Number		VARCHAR(10)		NOT NULL,
-- 	Item_Number				VARCHAR(10)		NOT NULL,	
--     Supplier_Number			VARCHAR(10)		NOT NULL,
--     
--     Qty_Required			DECIMAL(6, 6)	NOT NULL,
--     Price_Per_Unit			DECIMAL(6, 2)	NOT NULL,
--     Total_Price				DECIMAL(20, 2),
--     Date_Orderd				DATETIME		NOT NULL,
--     Arrival_Date			DATETIME,
--     
--     FOREIGN KEY(Requisition_Number) REFERENCES Requisions(Requisition_Number),
--     PRIMARY KEY(Requisition_Number),
--     
--     FOREIGN KEY(Supplier_Number) REFERENCES Suppliers(Supplier_Number),
--     FOREIGN KEY(Item_Number) REFERENCES Supplies(Item_Number)
-- );

/* TBD */