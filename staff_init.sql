/*
* @Author: Kai Gray
* 
* Initialize Staff tables 
*/

USE HOSPITAL;

CREATE TABLE IF NOT EXISTS WARD (
	WardID SMALLINT,
	WardName VARCHAR(60)
);