CREATE TABLE IF NOT EXISTS logs (
    codl INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    actiune VARCHAR(255),
    comanda VARCHAR(255),
    datal DATE,
    oral TIME,
    codf INT,
    tren_id INT,
    tren_name VARCHAR(255),
    user_id INT,
    user_name VARCHAR(255)
);

INSERT INTO logs (username, actiune, comanda, datal, oral, codf, tren_id, tren_name, user_id, user_name) 
VALUES 
('user1', 'login', 'comanda1', '2024-06-07', '12:34:56', 1, 101, 'InterCity', 201, 'Ion Popescu'),
('user2', 'logout', 'comanda2', '2024-06-07', '14:20:30', 2, 102, 'Tren Rapid', 202, 'Maria Ionescu'),
('user3', 'login', 'comanda3', '2024-06-08', '09:15:00', 1, 103, 'Regio', 203, 'Andrei Vasile'),
('user4', 'logout', 'comanda4', '2024-06-08', '10:45:20', 2, 104, 'InterRegio', 204, 'Elena Georgescu'),
('user5', 'login', 'comanda5', '2024-06-08', '11:25:30', 1, 105, 'Personal', 205, 'Vasile Popa'),
('user6', 'logout', 'comanda6', '2024-06-08', '12:40:50', 2, 106, 'Tren Rapid', 206, 'Gheorghe Dumitru'),
('user7', 'login', 'comanda7', '2024-06-08', '13:05:10', 1, 107, 'InterCity', 207, 'Ana Mihai'),
('user8', 'logout', 'comanda8', '2024-06-08', '14:50:40', 2, 108, 'Regio', 208, 'Sorin Alexandrescu'),
('user9', 'login', 'comanda9', '2024-06-08', '15:15:00', 1, 109, 'InterRegio', 209, 'Cristina Petrescu'),
('user10', 'logout', 'comanda10', '2024-06-08', '16:30:20', 2, 110, 'Personal', 210, 'Alexandru Stan'),
('user11', 'login', 'comanda11', '2024-06-08', '17:45:30', 1, 111, 'Tren Rapid', 211, 'Daniel Popa'),
('user12', 'logout', 'comanda12', '2024-06-08', '18:50:50', 2, 112, 'InterCity', 212, 'Mihai Ionescu'),
('user13', 'login', 'comanda13', '2024-06-08', '19:05:10', 1, 113, 'Regio', 213, 'Ioana Gheorghe'),
('user14', 'logout', 'comanda14', '2024-06-08', '20:50:40', 2, 114, 'InterRegio', 214, 'Roxana Dumitru'),
('user15', 'login', 'comanda15', '2024-06-08', '21:15:00', 1, 115, 'Personal', 215, 'Adrian Popescu'),
('user16', 'logout', 'comanda16', '2024-06-08', '22:30:20', 2, 116, 'Tren Rapid', 216, 'Silvia Marin'),
('user17', 'login', 'comanda17', '2024-06-08', '23:45:30', 1, 117, 'InterCity', 217, 'Florin Popa'),
('user18', 'logout', 'comanda18', '2024-06-09', '00:50:50', 2, 118, 'Regio', 218, 'Cornelia Ionescu'),
('user19', 'login', 'comanda19', '2024-06-09', '01:05:10', 1, 119, 'InterRegio', 219, 'George Gheorghe'),
('user20', 'logout', 'comanda20', '2024-06-09', '02:50:40', 2, 120, 'Personal', 220, 'Radu Dumitru'),
('user21', 'login', 'comanda21', '2024-06-09', '03:15:00', 1, 121, 'Tren Rapid', 221, 'Mariana Popa'),
('user22', 'logout', 'comanda22', '2024-06-09', '04:30:20', 2, 122, 'InterCity', 222, 'Diana Ionescu'),
('user23', 'login', 'comanda23', '2024-06-09', '05:45:30', 1, 123, 'Regio', 223, 'Gabriel Gheorghe'),
('user24', 'logout', 'comanda24', '2024-06-09', '06:50:50', 2, 124, 'InterRegio', 224, 'Simona Dumitru'),
('user25', 'login', 'comanda25', '2024-06-09', '07:05:10', 1, 125, 'Personal', 225, 'Cristian Popa'),
('user26', 'logout', 'comanda26', '2024-06-09', '08:50:40', 2, 126, 'Tren Rapid', 226, 'Laura Stan'),
('user27', 'login', 'comanda27', '2024-06-09', '09:15:00', 1, 127, 'InterCity', 227, 'Bogdan Alexandrescu'),
('user28', 'logout', 'comanda28', '2024-06-09', '10:30:20', 2, 128, 'Regio', 228, 'Emilia Petrescu'),
('user29', 'login', 'comanda29', '2024-06-09', '11:45:30', 1, 129, 'InterRegio', 229, 'Stefan Stan'),
('user30', 'logout', 'comanda30', '2024-06-09', '12:50:50', 2, 130, 'Personal', 230, 'Claudia Popescu'),
('user31', 'login', 'comanda31', '2024-06-09', '13:05:10', 1, 131, 'Tren Rapid', 231, 'Victor Marin'),
('user32', 'logout', 'comanda32', '2024-06-09', '14:50:40', 2, 132, 'InterCity', 232, 'Nicoleta Popa'),
('user33', 'login', 'comanda33', '2024-06-09', '15:15:00', 1, 133, 'Regio', 233, 'Lucian Ionescu'),
('user34', 'logout', 'comanda34', '2024-06-09', '16:30:20', 2, 134, 'InterRegio', 234, 'Oana Gheorghe'),
('user35', 'login', 'comanda35', '2024-06-09', '17:45:30', 1, 135, 'Personal', 235, 'Raluca Dumitru'),
('user36', 'logout', 'comanda36', '2024-06-09', '18:50:50', 2, 136, 'Tren Rapid', 236, 'Marius Popa'),
('user37', 'login', 'comanda37', '2024-06-09', '19:05:10', 1, 137, 'InterCity', 237, 'Cristina Ionescu'),
('user38', 'logout', 'comanda38', '2024-06-09', '20:50:40', 2, 138, 'Regio', 238, 'Constantin Gheorghe'),
('user39', 'login', 'comanda39', '2024-06-09', '21:15:00', 1, 139, 'InterRegio', 239, 'Elena Dumitru'),
('user40', 'logout', 'comanda40', '2024-06-09', '22:30:20', 2, 140, 'Personal', 240, 'Dan Popescu'),
('user41', 'login', 'comanda41', '2024-06-09', '23:45:30', 1, 141, 'Tren Rapid', 241, 'Anca Marin'),
('user42', 'logout', 'comanda42', '2024-06-10', '00:50:50', 2, 142, 'InterCity', 242, 'Ionut Popa'),
('user43', 'login', 'comanda43', '2024-06-10', '01:05:10', 1, 143, 'Regio', 243, 'Gabriela Ionescu'),
('user44', 'logout', 'comanda44', '2024-06-10', '02:50:40', 2, 144, 'InterRegio', 244, 'Razvan Gheorghe'),
('user45', 'login', 'comanda45', '2024-06-10', '03:15:00', 1, 145, 'Personal', 245, 'Alina Dumitru'),
('user46', 'logout', 'comanda46', '2024-06-10', '04:30:20', 2, 146, 'Tren Rapid', 246, 'Bogdan Popa'),
('user47', 'login', 'comanda47', '2024-06-10', '05:45:30', 1, 147, 'InterCity', 247, 'Diana Ionescu'),
('user48', 'logout', 'comanda48', '2024-06-10', '06:50:50', 2, 148, 'Regio', 248, 'Florina Gheorghe'),
('user49', 'login', 'comanda49', '2024-06-10', '07:05:10', 1, 149, 'InterRegio', 249, 'Ion Dumitru'),
('user50', 'logout', 'comanda50', '2024-06-10', '08:50:40', 2, 150, 'Personal', 250, 'Valeria Popescu');