-- 
-- Car Repairs database.
--

\c postgres;

DROP DATABASE IF EXISTS carrepairs;
CREATE DATABASE carrepairs;
\c carrepairs;

-- CAR GARAGES entity
DROP TABLE IF EXISTS garages;
CREATE TABLE garages (
  garageID char(7) PRIMARY KEY NOT NULL,
  garageName char(25) NOT NULL,
  garageCity char(10) NOT NULL
); 

-- CAR WORKS entity
DROP TABLE IF EXISTS works;
CREATE TABLE works (
  carID char(7) PRIMARY KEY NOT NULL,
  dateIn char(10) NOT NULL,
  dateOut char(10),
  cost char(10),
  garageID char(4) REFERENCES garages (garageID) 
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- CAR REPAIRS entity
DROP TABLE IF EXISTS repairs;
CREATE TABLE repairs (
  repairID char(4) PRIMARY KEY NOT NULL,
  repairName char(10) NOT NULL,
  repairDesc char(25) NOT NULL
); 

-- WORKS / REPAIRS relationship
DROP TABLE IF EXISTS workRepair;
CREATE TABLE workRepair (
  carID char(7) NOT NULL,
  repairID char(4) NOT NULL,
  PRIMARY KEY (carID, repairID),
  FOREIGN KEY (carID) REFERENCES works (carID)
	ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (repairID) REFERENCES repairs (repairID)
	ON DELETE CASCADE ON UPDATE CASCADE
); 

--
-- Entity tables initial insertions.
--

INSERT INTO garages VALUES 
	('G1', 'Garage One', 'Madrid'),
	('G2', 'Garage Two', 'Madrid'),
	('G3', 'Garage Three', 'Madrid'),
	('G4', 'Garage Four', 'Sevilla');

INSERT INTO works VALUES 
	('1019GZF', '2008', NULL, NULL, 'G1'),
	('1030GZF', '2010', NULL, NULL, 'G1'),
	('2039GRF', '2012', NULL, NULL, 'G1'),
	('1019RZF', '2015', NULL, NULL, 'G3'),
	('2019XZF', '2003', NULL, NULL, 'G1'),
	('3010ABC', '2006', NULL, NULL, 'G4'),
	('3110ABZ', '2007', NULL, NULL, 'G1'),
	('2210ABZ', '2007', NULL, NULL, 'G2');

INSERT INTO repairs VALUES 
	('R1', 'Scrach', 'Scrach repair'),
	('R2', 'Dent', 'Dent repair'),
	('R3', 'Paintwork', 'Paintwork repair'),
	('R4', 'Wheels', 'Wheels repair'),
	('R5', 'Engine', 'Engine repair');

--
-- Relationship tables initial insertions.
--

INSERT INTO workRepair VALUES 
	('1019GZF', 'R1'),
	('1019GZF', 'R2'),
	('1019GZF', 'R3'),
	('1030GZF', 'R4'),
	('2039GRF', 'R1'),
	('1019RZF', 'R1'),
	('2019XZF', 'R1'),
	('3010ABC', 'R2'),
	('3110ABZ', 'R4'),
	('2210ABZ', 'R3');

--
-- Regular/Interactive insertions
--

-- The new car 1111AAA get repairs R1 and R2 from Garage G1
INSERT INTO works VALUES ('1111AAA', '2008', NULL, NULL, 'G1');
INSERT INTO workRepair VALUES
	('1111AAA', 'R1'),
	('1111AAA', 'R2');


