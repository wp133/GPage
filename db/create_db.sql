CREATE DATABASE IF NOT EXISTS genomics;

USE genomics;

CREATE USER IF NOT EXISTS 'youser'@'localhost' IDENTIFIED BY 'haslo';
GRANT ALL PRIVILEGES ON genomics.* TO 'youser'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS owners (
    owner_hashcode CHAR(128) PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS genes (
    gene_symbol VARCHAR(20) PRIMARY KEY,
    owner_hashcode CHAR(128),
    protein_role INT,
    chromosomal_location INT,
    protein_concentration INT,
    protein_purity INT,
    subspecies VARCHAR(100) NOT NULL, -- do wyw pózniej
    FOREIGN KEY (owner_hashcode) REFERENCES owners(owner_hashcode)
);

INSERT INTO owners (owner_hashcode, owner_name) VALUES
('a1b2c3d4e5f60123456789abcdef0', 'Alice'),
('f1e2d3c4b5a60987654321fedcba0', 'Bob');

INSERT INTO genes (gene_symbol, owner_hashcode, protein_role, chromosomal_location, protein_concentration, protein_purity, subspecies) VALUES
('GENE001', 'a1b2c3d4e5f60123456789abcdef0', 1, 12, 100, 95, 'A'),
('GENE002', 'a1b2c3d4e5f60123456789abcdef0', 2, 7, 150, 90, 'A'),
('GENE003', 'a1b2c3d4e5f60123456789abcdef0', 1, 3, 120, 85, 'A'),
('GENE004', 'a1b2c3d4e5f60123456789abcdef0', 3, 15, 130, 92, 'A'),
('GENE005', 'a1b2c3d4e5f60123456789abcdef0', 2, 9, 110, 88, 'A'),
('GENE006', 'a1b2c3d4e5f60123456789abcdef0', 1, 20, 140, 90, 'A'),

('GENE007', 'f1e2d3c4b5a60987654321fedcba0', 2, 5, 160, 93, 'B'),
('GENE008', 'f1e2d3c4b5a60987654321fedcba0', 1, 11, 125, 89, 'B'),
('GENE009', 'f1e2d3c4b5a60987654321fedcba0', 3, 8, 135, 87, 'B'),
('GENE010', 'f1e2d3c4b5a60987654321fedcba0', 2, 14, 145, 91, 'B'),
('GENE011', 'f1e2d3c4b5a60987654321fedcba0', 1, 6, 155, 94, 'B'),
('GENE012', 'f1e2d3c4b5a60987654321fedcba0', 3, 10, 115, 86, 'B');

--------------
--- CREATE INDEX IF NOT EXISTS idx_owner_hashcode ON genes(owner_hashcode);

--- SET GLOBAL local_infile = ON;

--- LOAD DATA LOCAL INFILE 'C:\\Users\\wiwow\\Desktop\\2\\3E-Win\\trashpage\\db\\genes.csv' INTO TABLE genes
--- FIELDS TERMINATED BY ',' 
--- ENCLOSED BY '"'
--- LINES TERMINATED BY '\n'
--- IGNORE 1 ROWS;
