-- Crearea tabelului utilizatori
CREATE TABLE IF NOT EXISTS utilizatori (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    codf INT,
);

-- Inserarea utilizatorilor în tabelul 'utilizatori'
INSERT INTO utilizatori (username, password, codf) VALUES ('manager_cfr', 'parola123', 1);
INSERT INTO utilizatori (username, password, codf) VALUES ('casier_cfr', 'parola123', 2);
INSERT INTO utilizatori (username, password, codf) VALUES ('Popescu', 'Andrei', 1);
INSERT INTO utilizatori (username, password, codf) VALUES ('Anton', 'George', 2);
INSERT INTO utilizatori (username, password, codf) VALUES ('Georgescu', 'Grigore', 2);
INSERT INTO utilizatori (username, password, codf) VALUES ('Marinescu', 'Marian', 3);
INSERT INTO utilizatori (username, password, codf) VALUES ('Popa', 'Alin', 3);
INSERT INTO utilizatori (username, password, codf) VALUES ('Pralea', 'Geani', 3);