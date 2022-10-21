Create Database test_kolosko_exercise2_db;
USE test_kolosko_exercise2_db;

CREATE TABLE info
( 
first_name nvarchar(50) NOT NULL,
last_name nvarchar(50) NOT NULL,
passport_seria nvarchar(50) NOT NULL,
passport_number nvarchar(50) NOT NULL,
);

INSERT INTO info VALUES
('Dima','Petrov','AA','12345678'),
('Dima','Petrov','AG','123456738'),
('Dima','Kolosko','AB','12345122678'),
('Dima','Kolosko','AC','123451232678'),
('Dima','Kolosko','AT','122325122678'),
('Gleb','Ivanov','AK','13112345678'),
('Gleb','Ivanov','AC','131123413678');

GO
CREATE VIEW PassportView (passportSeria,passpotNumber,AllPassport) AS
SELECT DISTINCT i.passport_seria,i.passport_number,
  STUFF(
         (SELECT ',  ' + convert(nvarchar(30), CONCAT(inf.passport_seria,inf.passport_number), 120)
          FROM info inf
          WHERE i.first_name = inf.first_name and i.last_name=inf.last_name
          FOR XML PATH (''))
          , 1, 1, '')  AS AllPassport
FROM info i;

GO
SELECT *
FROM PassportView
WHERE passportSeria ='AA' AND  passpotNumber='12345678';

SELECT *
FROM PassportView
WHERE passportSeria ='AB' AND  passpotNumber='12345122678';

SELECT *
FROM PassportView
WHERE passportSeria ='AK' AND  passpotNumber='13112345678';