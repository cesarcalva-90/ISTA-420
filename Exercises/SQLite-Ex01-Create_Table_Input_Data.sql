.echo on
.headers on

--Name: Cesar Calva	
--File: SQLite-Ex01.sql
--Date: January 11, 2021

drop table if exists discgolf;

create table discgolf (
  name text primary key NOT NULL,   														--primary key
  manufacturer text check (manufacturer IN ('innova', 'discraft', 'discmania')) NOT NULL,	--string enumeration
  numberofthrows int NOT NULL,																--unconstrained numeric
  speed int check (speed > 0 and speed < 15 ) NOT NULL,										--numeric enumeration	
  glide int check (glide > 0 and glide < 8 ) NOT NULL,										--""
  turn  int check (turn > -6 and turn < 2 ) NOT NULL,										--""
  fade 	int check (fade > -1 and fade < 6 ) NOT NULL, 										--""
  proreview text NOT NULL																	--unconstrained string
);

INSERT INTO discgolf VALUES ('destroyer', 'innova', 244, 12, 5, -1, 3,'The Destroyer is the choice of 
an overwhelming number of top pros for precision control with maximum distance.' );
INSERT INTO discgolf VALUES ('firebird', 'innova', 175, 9, 3, 0, 4,'If you need to throw a driver in a 
howling headwind, reach for the Firebird like all the top pros.' );
INSERT INTO discgolf VALUES ('thunderbird', 'innova', 150, 9, 5, 0, 2,'The Thunderbird is a disc that 
flies with the control of a fairway driver but has the long range capacity of a distance driver.' );
INSERT INTO discgolf VALUES ('essence', 'discmania', 214, 8, 6, -2, 1,'The Essence is the do-it-all 
fairway driver in the Evolution line up.' );
INSERT INTO discgolf VALUES ('sting', 'discraft', 100, 7, 5, -2, 1,'The Sting was designed to be a disc 
that is easy to control, holds an almost perfect line on all throws, and fits comfortably in most smaller hands.' );


SELECT name FROM discgolf WHERE speed > 8;

SELECT name FROM discgolf WHERE name like '%bird';

SELECT name,manufacturer and speed FROM discgolf WHERE manufacturer = 'innova';

SELECT name FROM discgolf WHERE numberofthrows > 150;

SELECT * FROM discgolf WHERE numberofthrows > 150;

