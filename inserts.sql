DROP TABLE Module_Time CASCADE CONSTRAINTS PURGE;

DROP TABLE Room CASCADE CONSTRAINTS PURGE;

DROP TABLE Building CASCADE CONSTRAINTS PURGE;

DROP TABLE Module CASCADE CONSTRAINTS PURGE;

DROP TABLE Class CASCADE CONSTRAINTS PURGE;

DROP TABLE Lecturer CASCADE CONSTRAINTS PURGE;

CREATE TABLE Lecturer
( 
	StaffID              varchar(6)  NOT NULL ,
	Name                 varchar(20)  NULL ,
	CONSTRAINT XPKLecturer PRIMARY KEY (StaffID)
);

CREATE TABLE Class
( 
	CourseCode           varchar(20)  NOT NULL ,
	StageNo              varchar(20)  NULL ,
	CONSTRAINT XPKClass PRIMARY KEY (CourseCode)
);

CREATE TABLE Module
( 
	CRN                  NUMBER  NOT NULL ,
	Name                 varchar(30)  NULL ,
	Type                 NUMBER NULL,
	StaffID              varchar(6)  NOT NULL ,
	ContactHours         NUMBER  NULL ,
	CourseCode           varchar(20)  NOT NULL ,
  NoOfStudents         NUMBER Null,
	CONSTRAINT XPKModule PRIMARY KEY (CRN),
	CONSTRAINT R_7 FOREIGN KEY (CourseCode) REFERENCES Class(CourseCode),
CONSTRAINT R_4 FOREIGN KEY (StaffID) REFERENCES Lecturer(StaffID)
);

CREATE TABLE Building
( 
	BuildingPrefix       varchar2(3)  NOT NULL ,
	Name                 varchar2(20)  NULL ,
	Floors                NUMBER  NULL ,
	CONSTRAINT XPKBuilding PRIMARY KEY (BuildingPrefix)
);

CREATE TABLE Room
( 
	RoomNo               varchar2(5)  NOT NULL ,
	Capacity             NUMBER  NULL ,
	Blackboard           varchar2(3)  NULL ,
	Whiteboard           varchar2(3)  NULL ,
	Datascreen           varchar2(3)  NULL ,
	Dataprojector        varchar2(3)  NULL ,
	BuildingPrefix       varchar2(3)  NOT NULL ,
	CONSTRAINT XPKRoom PRIMARY KEY (RoomNo),
	CONSTRAINT R_8 FOREIGN KEY (BuildingPrefix) REFERENCES Building(BuildingPrefix)
);

CREATE TABLE Module_Time
( 
	Duration             NUMBER NOT NULL ,
	Start_Time           varchar2(4)  NULL ,
	CRN                  NUMBER  NOT NULL ,
	RoomNo               varchar2(5)  NOT NULL ,
	CONSTRAINT XPKModule_Time PRIMARY KEY (Start_Time, RoomNo, CRN),
	CONSTRAINT R_12 FOREIGN KEY (CRN) REFERENCES Module(CRN),
CONSTRAINT R_17 FOREIGN KEY (RoomNo) REFERENCES Room(RoomNo)
);


INSERT INTO Lecturer Values 
('C8573', 'John Murphy');
INSERT INTO Lecturer Values 
('C3857', 'Christopher Bishop');
INSERT INTO Lecturer Values 
('C9394', 'Sean Lee');
INSERT INTO Lecturer Values 
('A3992', 'Brian Fagan');
INSERT INTO Lecturer Values 
('A2266', 'Noel Johnson');
INSERT INTO Lecturer Values 
('B1938', 'Desmond Tutu');

INSERT INTO Class Values 
('DT228', 3);
INSERT INTO Class Values 
('B855', 1);
INSERT INTO Class Values 
('DT001', 2);
INSERT INTO Class Values 
('DT201', 3);
INSERT INTO Class Values 
('B308', 4);

INSERT INTO Module Values 
(74839284, 'Client-Server Programming', 1, 'C8573', 2 , 'DT228', 73);
INSERT INTO Module Values 
(48673939, 'Data Communications', 2, 'C8573', 2, 'DT228', 72);
INSERT INTO Module Values 
(47563682, 'Software Engineering', 2, 'C3857', 1, 'DT228', 73);
INSERT INTO Module Values 
(22938388, 'Internet Infastructure', 1, 'C8573', 4, 'DT201', 55);
INSERT INTO Module Values 
(12097486, 'Word Processing', 1, 'C9394', 4, 'DT201', 55);
INSERT INTO Module Values 
(38495867, 'Chemistry', 1, 'C9394', 3, 'DT001', 29);
INSERT INTO Module Values 
(83747728, 'Physics', 2, 'C9394', 3, 'DT001', 30);
INSERT INTO Module Values 
(37729273, 'History', 2, 'A3992', 1, 'B855', 60);
INSERT INTO Module Values 
(24817273, 'Classics', 2, 'A2266', 1, 'B855', 40);
INSERT INTO Module Values 
(38476364, 'Litrature', 1, 'A3992', 4, 'B855', 40);
INSERT INTO Module Values 
(12394485, 'Manual Accounting', 1, 'B1938', 2, 'B308', 63);
INSERT INTO Module Values 
(93847773, 'Computerised Accounting', 1, 'B1938', 2, 'B308', 66);

--Building INSERTs
INSERT INTO Building (BuildingPrefix, Name, Floors)
VALUES ('KE', 'Kevins Street',  '6');
INSERT INTO Building (BuildingPrefix, Name, Floors)
VALUES ('KA', 'Kevins St Annex',  '4');
INSERT INTO Building (BuildingPrefix, Name, Floors)
VALUES ('A', 'Aungier St', '5' );

--Room INSERTs
--(RoomNo, Capacity, Blackboard, Whiteboard, Datascreen, Dataprojector, BuildingPrefix)
INSERT INTO Room
Values ('4008', 100, 'No', 'Yes', 'Yes', 'Yes', 'KE');
INSERT INTO Room 
Values ('1006', 30, 'No', 'Yes', 'No', 'Yes', 'A');
INSERT INTO Room 
Values ('3007', 50, 'Yes', 'No', 'Yes', 'Yes', 'KA');
INSERT INTO Room 
Values ('1017', 20, 'No', 'Yes', 'No', 'Yes', 'KA');
INSERT INTO Room 
Values ('2008', 80, 'Yes', 'Yes', 'Yes', 'Yes', 'KE');
INSERT INTO Room 
Values ('2056', '40', 'No', 'No', 'Yes', 'Yes', 'A');

--Module Time INSERTS
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('1', '900', '74839284', '4008');
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('2', '1300', '48673939', '1006');
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('1', '1700', '47563682', '3007');
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('1', '1300', '22938388', '1017');
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('2', '1000', '12097486', '2008');
INSERT INTO Module_Time (Duration, Start_Time, CRN, RoomNo)
VALUES ('1', '1600', '37729273', '2056');



CREATE USER coordinator FOR staff;
CREATE USER buildingManager FOR staff;
CREATE USER technician FOR staff;
CREATE USER roomCoordinator FOR staff;
CREATE USER lecturer FOR staff;
CREATE USER schoolCoordinator FOR staff;

grant select, update, insert, drop on ROOM to coordinator;

grant select, update, insert, drop on ROOM to buildingManager;

grant select, update on ROOM to technician;

grant select, update, insert on ROOM to roomCoordinator;

grant select, update on MODULE to lecturer;

grant select, update on Module_Time to schoolCoordinator;
