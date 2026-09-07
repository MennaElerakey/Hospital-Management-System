CREATE DATABASE Hospital;
USE Hospital;

create table Doctors (
DoctorID int primary key,
FullName varchar(50) not null,
specialty varchar(150) not null,
 ExperienceYears int
);
 
create table patients (
PatientID int primary key,
PatientName varchar(50) not null,
Phone varchar(15) unique,
address varchar(100),
DoctorID int,
foreign key (DoctorID) references Doctors(DoctorID)
); 

create table Appointments (
AppointmentID int primary key ,
AppointmentDate datetime not null,
PatientID int,
DoctorID int,
foreign key (PatientID) references patients(PatientID),
foreign key (DoctorID) references Doctors(DoctorID)
);

INSERT INTO Doctors VALUES
(1, 'Ahmed Hassan', 'Dentist', 8),
(2, 'Mariam Ali', 'Cardiology', 12),
(3, 'Omar Adel', 'Dermatology', 6);

INSERT INTO Patients VALUES
(1, 'Sara Mohamed', '01012345678', 'Cairo', 1),
(2, 'Youssef Ahmed', '01123456789', 'Giza', 2),
(3, 'Nour Khaled', '01234567890', 'Cairo', 3);

INSERT INTO Appointments VALUES
(1, '2026-09-08 10:00:00', 1, 1),
(2, '2026-09-08 12:30:00', 2, 2),
(3, '2026-09-09 11:00:00', 3, 3);


SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Appointments;

SELECT PatientName, Phone
FROM Patients;

SELECT FullName, Specialty
FROM Doctors;

SELECT *
FROM Patients
WHERE DoctorID = 1;

SELECT *
FROM Doctors
WHERE Specialty = 'Dentist';

SELECT *
FROM Doctors
WHERE ExperienceYears > 8;

SELECT *
FROM Patients
WHERE Address = 'Cairo';

SELECT *
FROM Doctors
WHERE ExperienceYears BETWEEN 5 AND 10;

SELECT *
FROM Patients
WHERE PatientName LIKE 'S%';

SELECT *
FROM Doctors
WHERE Specialty IN ('Dentist', 'Cardiology');

SELECT DISTINCT Specialty
FROM Doctors;

SELECT *
FROM Patients
ORDER BY PatientName ASC;

SELECT *
FROM Doctors
ORDER BY ExperienceYears DESC;

UPDATE Patients
SET Phone = '01099999999'
WHERE PatientID = 1;

UPDATE Doctors
SET ExperienceYears = 9
WHERE DoctorID = 1;

SELECT
    Patients.PatientName,
    Doctors.FullName AS DoctorName,
    Doctors.Specialty
FROM Patients
JOIN Doctors
ON Patients.DoctorID = Doctors.DoctorID;

SELECT
    Patients.PatientName,
    Doctors.FullName AS DoctorName,
    Appointments.AppointmentDate
FROM Appointments
JOIN Patients
ON Appointments.PatientID = Patients.PatientID
JOIN Doctors
ON Appointments.DoctorID = Doctors.DoctorID;

SELECT
    Doctors.FullName,
    Doctors.Specialty,
    Appointments.AppointmentDate
FROM Doctors
LEFT JOIN Appointments
ON Doctors.DoctorID = Appointments.DoctorID;

SELECT COUNT(*) AS TotalPatients
FROM Patients;

SELECT COUNT(*) AS TotalDoctors
FROM Doctors;

SELECT AVG(ExperienceYears) AS AverageExperience
FROM Doctors;

SELECT MAX(ExperienceYears) AS MaxExperience
FROM Doctors;

SELECT MIN(ExperienceYears) AS MinExperience
FROM Doctors;

SELECT
    Specialty,
    COUNT(*) AS DoctorCount
FROM Doctors
GROUP BY Specialty;

SELECT
    DoctorID,
    COUNT(*) AS AppointmentCount
FROM Appointments
GROUP BY DoctorID;

SELECT
    Doctors.FullName,
    COUNT(Appointments.AppointmentID) AS AppointmentCount
FROM Doctors
LEFT JOIN Appointments
ON Doctors.DoctorID = Appointments.DoctorID
GROUP BY Doctors.DoctorID, Doctors.FullName;

SELECT
    DoctorID,
    COUNT(*) AS AppointmentCount
FROM Appointments
GROUP BY DoctorID
HAVING COUNT(*) > 1;

SELECT
    FullName,
    ExperienceYears
FROM Doctors
WHERE ExperienceYears > (
    SELECT AVG(ExperienceYears)
    FROM Doctors
);

DELETE FROM Appointments
WHERE AppointmentID = 4;