CREATE TABLE IF NOT EXISTS trenuri (
    tren_id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    ora_plecare TIME NOT NULL,
    durata VARCHAR(50) NOT NULL,
    statie_plecare VARCHAR(50) NOT NULL,
    statie_sosire VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    numar_tren VARCHAR(255)
);

-- Inserarea datelor în tabelul 'trenuri'
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('InterCity', '19:12', '2 ore 26 min', 'Brașov', 'Constanța', '2024-02-27', 'IC123');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Tren Rapid', '11:30', '3 ore 10 min', 'Suceava', 'Timișoara', '2024-03-15', 'TR456');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Tren Rapid', '14:05', '4 ore 30 min', 'București', 'Cluj-Napoca', '2024-06-05', 'TR101');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Regio', '06:20', '3 ore 55 min', 'Timișoara', 'Sibiu', '2024-06-08', 'RG202');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Personal', '22:40', '5 ore 15 min', 'Iași', 'Galați', '2024-07-11', 'PR303');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('InterCity', '12:00', '2 ore 40 min', 'Constanța', 'Brașov', '2024-08-21', 'IC404');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('InterRegio', '17:30', '3 ore 20 min', 'Suceava', 'București', '2024-09-15', 'IR505');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Tren Rapid', '08:45', '2 ore 10 min', 'Cluj-Napoca', 'Oradea', '2024-10-18', 'TR606');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Personal', '05:30', '6 ore 00 min', 'Brașov', 'Sibiu', '2024-11-22', 'PR707');
INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren) VALUES ('Regio', '20:15', '4 ore 45 min', 'București', 'Constanța', '2024-12-30', 'RG808');
