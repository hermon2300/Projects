#create database projectGroup14;
use projectGroup14;

SET FOREIGN_KEY_CHECKS=OFF;
DROP TABLE IF EXISTS newspapers;
DROP TABLE IF EXISTS Editions;
DROP TABLE IF EXISTS Articles;
DROP TABLE IF EXISTS Photo;
DROP TABLE IF EXISTS Journalist;
DROP TABLE IF EXISTS Employee;
SET FOREIGN_KEY_CHECKS=ON;

CREATE TABLE Journalist
(
JourID			VARCHAR(100) NOT NULL,
firstname		VARCHAR(30) NOT NULL,
lastname		VARCHAR(100) NOT NULL, 
 StreetName		VARCHAR(250),
 CivicNumber	INT,
 City			VARCHAR(250),
 ZipCode		INT,
 Country		VARCHAR(250),
PhoneNumber 	int,
Email			VARCHAR(255),
primary key(JourID)

);

CREATE TABLE newspapers 
(
Publisher_title 	VARCHAR(100),
FoundingDate  		DATE,
Periodicity  		VARCHAR(100),
primary key(Publisher_title)

);

CREATE TABLE Editions 
(
JourID			VARCHAR(50),
EditionID 		int,
PublishDate 	DATE,
PRIMARY KEY(EditionID),
FOREIGN KEY	(JourID) REFERENCES Journalist(JourID)

);

CREATE TABLE Photo 
(
PhotoID			VARCHAR(100),
title 			VARCHAR(100) NOT NULL,
PhotoDate		date,
JourID 			VARCHAR(100) NOT NULL,
primary key(PhotoID),
FOREIGN KEY	(JourID) REFERENCES Journalist(JourID)
);

create TABLE Articles 
(
ArticleID		int NOT NULL AUTO_INCREMENT,
Title			VARCHAR(100),
EditionID		INT,
JourID			VARCHAR(100) NOT NULL,
JourRole		VARCHAR(100) NOT NULL,
Topic			VARCHAR(100) NOT NULL,
ReadingCount 	int,
text 			VARCHAR(10000),
PhotoID			VARCHAR(100) ,

FOREIGN KEY	(JourID) REFERENCES Journalist(JourID),
FOREIGN KEY	(EditionID) REFERENCES Editions(EditionID),
foreign key(PhotoID) references Photo(PhotoID),
primary key(ArticleID)
);

# 4.
INSERT INTO Journalist (JourID, FirstName, LastName, StreetName, CivicNumber, City, ZipCode, Country, PhoneNumber, Email)
VALUES 
('17-05-99-2049', 'Lars', 'Larsen', 'Magleparken', 45, 'Ballerup', 2750, 'Danmark', 35629185, 'Lars@larsen.dk'),
('12-04-96-3147', 'Peter', 'Petersen', 'Lilletoften', 127, 'Skovlunde', 2740, 'Danmark', 46730296, 'Peter@petersen.dk'),
('20-10-95-4523', 'Emil', 'Emilsen', 'Blågårds Plads', 43, 'Nørrebro', 2200, 'Danmark', 57841307, 'Emil@emilsen.dk'),
('3-11-94-2993', 'Anders', 'Andersen', 'Paltholmterrasserne', 200, 'Farum', 3520, 'Danmark', 68952418, 'Anders@andersen.dk'),
('01-06-96-5041', 'Jens', 'Jensen', 'Tomsgårdsvej', 23, 'Nordvest', 2400, 'Danmark', 79053529, 'Jens@jensen.dk'),
('02-07-97-3141', 'Mikkel', 'Nørgaard', 'Elverhøjen', 21, 'Herlev', 2730, 'Danmark', 80164630, 'Mikkel@nørgaard.dk'),
('03-08-98-3040', 'Ida', 'Idasen', 'Tvedvangen', 37, 'Herlev', 2730, 'Danmark', 91275741, 'Ida@idasen.dk'),
('24-05-77-2046', 'Pia', 'Kjærsgaard', 'Havnegade', 44, 'Strøby', 4671, 'Danmark', 2386852, 'Pia@kjærsgaard.dk'),
('30-06-80-2248', 'Line', 'Madsen', 'Fynshovedvej', 24, 'Greve', 2670, 'Danmark', 13497963, 'Line@madsen.dk'),
('12-10-88-4020', 'Stine', 'Madsen', 'Søndergade', 30, 'Brønderslev', 9700, 'Danmark', 24508074, 'Stine@madsen.dk');

INSERT INTO newspapers (Publisher_title, FoundingDate, Periodicity)
VALUES
('New York Times','18050103','Daily'),
('The Global Ledger','18720504','Weekly'),
('Daily Adventure','19061103','Evening Editions'),
('The Sunday Echo','19500208','Weekly on Sunday'),
('Morning Tribune','19950106','Daily');

INSERT INTO Editions(JourID,EditionID,PublishDate)
VALUES
('17-05-99-2049',5003,20240714),
('12-04-96-3147',6579,20230925),
('20-10-95-4523',4352,20241012),
('3-11-94-2993',2300,20240423),
('01-06-96-5041',2770,20240511),
('02-07-97-3141',3400,20240612),
('03-08-98-3040',1200,20241211),
('24-05-77-2046',3200,20240115),
('30-06-80-2248',8700,20240228),
('12-10-88-4020',9200,20240514);

INSERT INTO Photo (Title, PhotoDate, JourID, PhotoID) 
VALUES
('antarctica melting', '2021-06-05', '17-05-99-2049', CONCAT(PhotoDate, '-', REPLACE(Title, ' ', '-'))),
('The queen gets carried', '2020-12-02', '12-04-96-3147', CONCAT(PhotoDate, '-', REPLACE(Title, ' ', '-'))),
('With banners and flags', '2022-11-24', '20-10-95-4523', CONCAT(PhotoDate, '-', REPLACE(Title, ' ', '-'))),
('Screen eyes', '2022-07-11', '3-11-94-2993', CONCAT(PhotoDate, '-', REPLACE(Title, ' ', '-'))),
('Singles in nursing home', '2023-05-12', '01-06-96-5041', CONCAT(PhotoDate, '-', REPLACE(Title, ' ', '-')));

INSERT INTO Articles(Title,EditionID,JourID,JourRole,Topic,ReadingCount,text,PhotoID)
VALUES
('arctic melting',5003,'17-05-99-2049','Author','Global news',1,
'The arctic ice has lost a third of its mass over the course of the last 4 years 
due to global warming.','2021-06-05-antarctica-melting'),
('Sorrow over the loss of the queen',6579,'12-04-96-3147','Editor','Royals',0,
'The people of The United Kingdom is enjoined in deep grief as they see their newly announced dead queen, 
being carried through the streets of london','2020-12-02-The-queen-gets-carried'),
('student rally up in protest',4352,'20-10-95-4523','Leader','education',6,
'students tired of overwork, getting 0 hour sleep due to high expectancy.','2022-11-24-With-banners-and-flags'),
('kids spent longer time in front of screen than sleeping',2300,'3-11-94-2993','Author','upbringing',5,
'In a recent research done by the university of Naboo, kids spent on average 1 hour and 30 minutes longer
 in front of a screen than sleeping','2022-07-11-Screen-eyes'),
('elder people´s loneliness is at its peak',2770,'01-06-96-5041','Editor','community',500,
'Down at the nursing home in the republic, chancellor Palpatine has declared a rising in 
loneliness among the elderly generations.','2023-05-12-Singles-in-nursing-home'),
('University has new student-prgoram',3400,'02-07-97-3141','Editor','Education',400,
'The University has a new program designed for exchange students this program 
aim to raise international recognition of the school',null),
('Tesla release new car',1200,'03-08-98-3040','Author','Technology',800,
'Tesla has released a new car. This new car no longer runs on electricity but runs on water',null),
('A new Planet',3200,'24-05-77-2046','Author','Space',1000,
'NASA have a discovered 10th planet in our solar system.',null),
('Madrid Victory',8700,'30-06-80-2248','Editor','Sports',200,
'Real Madrid won against rivals Barcelona in close 2-1 win',null),
('New Plants',9200,'12-10-88-4020','Author','Nature',1500,'DTU',null);


select * from Journalist;
select * from photo;
select * from articles;
select * from Editions;
select * from newspapers;

