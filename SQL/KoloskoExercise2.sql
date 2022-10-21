--Create Database test_kolosko_db;
--USE test_kolosko_db;

CREATE TABLE locations 
( 
id bigint PRIMARY KEY IDENTITY,
name nvarchar(20) NOT NULL,
parent_id bigint 
);

INSERT INTO locations(name, parent_id) VAlUES
('Belarus', null),
('Minsk', 1),
('Mogilev', 1),
('Brest', 1),
('Georgia',null),
('Batumi',5),
('Tbelisi',5);


CREATE TABLE candidates 
( 
id bigint PRIMARY KEY IDENTITY,
first_name nvarchar(20) NOT NULL,
last_name nvarchar(20) NOT NULL,
location_id bigint NOT NULL,
position nvarchar(20) NOT NULL,
experience_age int NOT NULL,
age int,
family_status nvarchar(20),
phone_number nvarchar(50),
email_address nvarchar(50)
FOREIGN KEY (location_id) REFERENCES locations (id) 
);

INSERT INTO candidates VAlUES
('Dima', 'Kolosko', 2,'Programmer',0,29,'married','+375255365288','gogogog1993@gmail.com'),
('Ivan', 'Ivanov', 6,'Programmer',2,33,'married','+375255365288','gogogog1993@gmail.com'),
('Mikki', 'Petrov', 5,'lawyer',1,25,'unmarried','+375255365288','gogogog1993@gmail.com'),
('Gleb', 'Yrenok', 3,'Programmer',6,37,'unmarried','+375255365288','gogogog1993@gmail.com');


CREATE TABLE education
( id bigint PRIMARY KEY IDENTITY,
candidates_id bigint NOT NULL,
name nvarchar(150) NOT NULL,
end_date DATE,
FOREIGN KEY (candidates_id) REFERENCES candidates (id)
);

INSERT INTO education VAlUES
(1,'Minsk College of Business','2022-07-12'),
(1,'Belarusian State University of Informatics and Radioelectronics','2025-05-1'),
(2,'Belarusian State University of Informatics and Radioelectronics','2021-05-12'),
(3,'College of business and law','2019-05-1');


CREATE TABLE work_experience
( id bigint PRIMARY KEY IDENTITY,
candidates_id bigint NOT NULL,
name varchar(150) NOT NULL,
start_date DATE,
end_date DATE
FOREIGN KEY (candidates_id) REFERENCES candidates (id)
);

INSERT INTO work_experience VAlUES
(1,'OOO "AstProject','2018-07-12','2019-07-12'),
(1,'Byte-protect','2022-10-24',null),
(2,'Swan-geese','2018-07-12','2020-07-12'),
(3,'Minsk District Court','2019-05-1',null);


CREATE TABLE skills 
( 
id bigint PRIMARY KEY IDENTITY,
name nvarchar(20) NOT NULL,
parent_id bigint,
FOREIGN KEY (parent_id) REFERENCES skills(id)
);

INSERT INTO skills(name, parent_id) VAlUES
('Language', null),

('English', 1),
('Speaking', 2),
('Writing', 2),
('Reading', 2),

('French', 1),
('Speaking', 6),
('Writing', 6),
('Reading', 6),

('German', 1),
('Speaking', 10),
('Writing', 10),
('Reading', 10),

('Chinese', 1),
('Speaking', 14),
('Writing', 14),
('Reading', 14),

('Computer', null),

('Office Software', 18),
('Word', 19),
('Excel', 19),
('Power Point', 19),

('Computer languages', 18),

('Compilers', 23),
('C', 24),
('C++', 24),
('C#', 24),
('Java', 24),
('Assembler', 24),

('Scripting languages', 23),
('VB script', 30),
('TCL', 30),
('TypeScript', 30),
('JavaScript', 30),
('Perl', 30),

('Databases', 18),
('MS Sql', 36),
('MySql', 36),
('PostgreSQL', 36),
('MongoDB', 36),

('Operation Systems', 18),
('Windows', 41),
('Linux', 41),
('MacOS', 41);

CREATE TABLE candidate_skills
( 
candidate_id bigint NOT NULL,
skill_id bigint NOT NULL,
FOREIGN KEY (candidate_id) REFERENCES candidates (id),
FOREIGN KEY (skill_id) REFERENCES skills (id) 
);

INSERT INTO candidate_skills VAlUES
(1,27),
(1,42),
(1,37),

(2,27),
(2,43),
(2,38),

(3,27),
(3,44),
(3,37);
