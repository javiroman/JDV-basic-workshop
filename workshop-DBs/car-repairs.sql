-- 
-- Car Repairs database.
--

DROP DATABASE IF EXISTS carrepairs;
CREATE DATABASE carrepairs;
USE carrepairs;

-- CAR WORKS entity
DROP TABLE IF EXISTS works;
CREATE TABLE works(
  carID char(4) NOT NULL,
  dateIn char(10) NOT NULL,
  dateOut char(10) NOT NULL,
  cost char(10) NOT NULL,
  PRIMARY KEY (carID)
);

-- CAR REPAIRS entity
DROP TABLE IF EXISTS repairs;
CREATE TABLE repairs (
  repairID char(4) NOT NULL,
  repairName char(10) NOT NULL,
  repairDesc char(10) NOT NULL,
  PRIMARY KEY (repairID)
); 

-- CAR GARAGES entity
DROP TABLE IF EXISTS garages;
CREATE TABLE garages (
  garageID char(7) NOT NULL,
  garageName char(10) NOT NULL,
  garageCity char(10) NOT NULL,
  PRIMARY KEY (garageID)
); 

-- WORKS / GARAGE relationship
DROP TABLE IF EXISTS workGarage;
CREATE TABLE workGarage (
  carID char(4) NOT NULL,
  garageID  char(7) NOT NULL,
  PRIMARY KEY (carID, garageID),
  FOREIGN KEY (carID) REFERENCES works (carID) 
	ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (garageID) REFERENCES garages(garageID)
	ON DELETE CASCADE ON UPDATE CASCADE
); 

-- WORKS / REPAIRS relationship
DROP TABLE IF EXISTS workRepair;
CREATE TABLE workRepair (
  carID char(7) NOT NULL,
  repairID char(4) NOT NULL,
  PRIMARY KEY (carID, repairID),
  FOREIGN KEY (carID) REFERENCES works (carID)
	ON DELETE CASCADE ON UPDATE CASCADE
  FOREIGN KEY (repairID) REFERENCES repairs (repairID)
	ON DELETE CASCADE ON UPDATE CASCADE,
); 

--
-- Entity tables initial insertions.
--

INSERT INTO works VALUES ("M1", "AUDI", "A3", "1500");

INSERT INTO garages VALUES ("C1", "AUDI", "MADRID", "28008");

INSERT INTO repairs VALUES ("1019GZF", "2008", "Black");

--
-- Relationship tables initial insertions.
--

INSERT INTO workGarage VALUES ("C1", "M1");

INSERT INTO workRepairs VALUES ("M1", "1019GZF");

--
-- Regular/Interactive insertions
--

-- Buy a Audi A3 2000 cc white from dealer C1 with plate 1234ABC
INSERT INTO carshop VALUES ("1234ABC", "2008", "White");
INSERT INTO shopModels VALUES ("M1", "1234ABC");
INSERT INTO dealersShop VALUES ("C1", "1234ABC");

-- Buy a BMW 5 Series 2500 cc black from dealer C1 with plate 1234ABC
INSERT INTO carshop VALUES ("2222ABC", "2010", "black");
INSERT INTO shopModels VALUES ("M4", "2222ABC");
INSERT INTO dealersShop VALUES ("C4", "2222ABC");

-- Buy a BMW 3 Series 2500 cc black from dealer C1 with plate 1234ABC
INSERT INTO carshop VALUES ("1111AAA", "2010", "black");
INSERT INTO shopModels VALUES ("M5", "1111AAA");
INSERT INTO dealersShop VALUES ("C5", "1111AAA");

