CREATE TABLE IF NOT EXISTS bilete (
    bilet_id INT AUTO_INCREMENT PRIMARY KEY,
    nume_calator VARCHAR(50) NOT NULL,
    numar_tren VARCHAR(50) NOT NULL,
    statie_plecare VARCHAR(50) NOT NULL,
    statie_sosire VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    ora TIME NOT NULL,
    loc VARCHAR(50) NOT NULL,
    clasa VARCHAR(50) NOT NULL,
    pret DECIMAL(10, 2) NOT NULL
);

INSERT INTO bilete (nume_calator, numar_tren, statie_plecare, statie_sosire, data, ora, loc, clasa, pret) 
VALUES 
('Ion Popescu', 'IC123', 'Brașov', 'Constanța', '2024-02-27', '19:12:00', 'Loc1', 'Prima Clasă', 100.00),
('Maria Ionescu', 'TR456', 'Suceava', 'Timișoara', '2024-03-15', '11:30:00', 'Loc2', 'A doua Clasă', 80.00),
('Andrei Vasile', 'TR101', 'București', 'Cluj-Napoca', '2024-06-05', '14:05:00', 'Loc3', 'Economic', 60.00),
('Elena Georgescu', 'RG202', 'Timișoara', 'Sibiu', '2024-06-08', '06:20:00', 'Loc4', 'Prima Clasă', 90.00),
('Vasile Popa', 'PR303', 'Iași', 'Galați', '2024-07-11', '22:40:00', 'Loc5', 'Economic', 50.00);
