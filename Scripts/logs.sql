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
('user1', 'login', 'comanda1', '2024-06-07', '12:34:56', 1, 101, 'InterCity', 201, 'John Doe'),
('user2', 'logout', 'comanda2', '2024-06-07', '14:20:30', 2, 102, 'Tren Rapid', 202, 'Jane Smith');
