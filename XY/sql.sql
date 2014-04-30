/**discussion session**/
DROP TABLE X;
DROP TABLE Y;
CREATE TABLE X(
    id          SERIAL PRIMARY KEY,
    value       TEXT NOT NULL UNIQUE
);
INSERT INTO X (value) VALUES('x1');
INSERT INTO X (value) VALUES('x2');
INSERT INTO X (value) VALUES('x3');
SELECT * FROM X;
CREATE TABLE Y(
    id          SERIAL PRIMARY KEY,
    value       TEXT NOT NULL UNIQUE
);
INSERT INTO Y (value) VALUES('y1');
INSERT INTO Y (value) VALUES('y2');
INSERT INTO Y (value) VALUES('y3');
SELECT * FROM Y;