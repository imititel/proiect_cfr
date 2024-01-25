CREATE TABLE IF NOT EXISTS trenuri (
    tren_id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    ora_plecare TIME NOT NULL,
    durata VARCHAR(50) NOT NULL,
    statie_plecare VARCHAR(50) NOT NULL,
    statie_sosire VARCHAR(50) NOT NULL,
    data DATE NOT NULL
);

-- Inserarea datelor în tabelul 'trenuri'
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterCity', '19:12', '2 ore 26 min', 'Brașov', 'Constanța', '2024-02-27');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Tren Rapid', '11:30', '3 ore 10 min', 'Suceava', 'Timișoara', '2024-03-15');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterRegio', '08:15', '1 ore 45 min', 'Craiova', 'Iași', '2024-04-10');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Regio', '05:52', '2 ore 30 min', 'Oradea', 'București', '2024-05-01');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Personal', '23:05', '3 ore 50 min', 'Cluj-Napoca', 'Brașov', '2024-06-12');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterCity', '09:19', '0 ore 20 min', 'Suceava', 'Sibiu', '2024-07-08');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterRegio', '19:35', '1 ore 37 min', 'Cluj-Napoca', 'Timișoara', '2024-09-02');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Personal', '07:30', '5 ore 10 min', 'Brașov', 'Timișoara', '2024-08-11');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterCity', '07:39', '3 ore 1 min', 'Brașov', 'Sibiu', '2024-11-28');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterCity', '19:59', '4 ore 10 min', 'București', 'Oradea', '2024-12-17');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Personal', '12:25', '5 ore 20 min', 'Cluj-Napoca', 'Suceava', '2024-11-01');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('InterRegio', '07:18', '0 ore 18 min', 'Sibiu', 'Suceava', '2024-03-17');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Tren Rapid', '07:25', '4 ore 45 min', 'Constanța', 'Suceava', '2024-08-16');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Personal', '22:14', '1 ore 10 min', 'București', 'Craiova', '2024-02-09');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Personal', '05:58', '2 ore 59 min', 'Brașov', 'Sibiu', '2024-04-13');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data) VALUES ('Tren Rapid', '09:15', '2 ore 34 min', 'Iași', 'Cluj-Napoca', '2024-05-13');
...
