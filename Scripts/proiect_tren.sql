CREATE TABLE IF NOT EXISTS trenuri (
    tren_id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    ora_plecare TIME NOT NULL,
    durata VARCHAR(50) NOT NULL,
    statie_plecare VARCHAR(50) NOT NULL,
    statie_sosire VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    numar_tren VARCHAR(255),
    loc VARCHAR(50),  -- noua coloană pentru loc
    clasa VARCHAR(50), -- noua coloană pentru clasa
    pret DECIMAL(10, 2) -- noua coloană pentru pret
);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('InterCity', '19:12', '2 ore 26 min', 'Brașov', 'Constanța', '2024-02-27', 'IC123', 'Loc1', 'Prima Clasă', 100.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Tren Rapid', '11:30', '3 ore 10 min', 'Suceava', 'Timișoara', '2024-03-15', 'TR456', 'Loc2', 'A doua Clasă', 80.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Tren Rapid', '14:05', '4 ore 30 min', 'București', 'Cluj-Napoca', '2024-06-05', 'TR101', 'Loc3', 'Economic', 60.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Regio', '06:20', '3 ore 55 min', 'Timișoara', 'Sibiu', '2024-06-08', 'RG202', 'Loc4', 'Prima Clasă', 90.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Personal', '22:40', '5 ore 15 min', 'Iași', 'Galați', '2024-07-11', 'PR303', 'Loc5', 'Economic', 50.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('InterCity', '12:00', '2 ore 40 min', 'Constanța', 'Brașov', '2024-08-21', 'IC404', 'Loc6', 'Prima Clasă', 110.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('InterRegio', '17:30', '3 ore 20 min', 'Suceava', 'București', '2024-09-15', 'IR505', 'Loc7', 'A doua Clasă', 85.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Tren Rapid', '08:45', '2 ore 10 min', 'Cluj-Napoca', 'Oradea', '2024-10-18', 'TR606', 'Loc8', 'Economic', 55.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Personal', '05:30', '6 ore 00 min', 'Brașov', 'Sibiu', '2024-11-22', 'PR707', 'Loc9', 'Economic', 45.00);

INSERT INTO trenuri (nume, ora_plecare, durata, statie_plecare, statie_sosire, data, numar_tren, loc, clasa, pret) 
VALUES ('Regio', '20:15', '4 ore 45 min', 'București', 'Constanța', '2024-12-30', 'RG808', 'Loc10', 'A doua Clasă', 75.00);
