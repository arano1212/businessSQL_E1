CREATE TABLE category (
    category_code SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL
);

CREATE TABLE part (
    part_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    color VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    category_code INTEGER REFERENCES category(category_code) ON DELETE CASCADE
);

CREATE TABLE supply (
    id SERIAL PRIMARY KEY,
    supplier_id INTEGER REFERENCES supplier(supplier_id) ON DELETE CASCADE,
    part_id INTEGER REFERENCES part(part_id) ON DELETE CASCADE,
    date DATE NOT NULL,
    quantity INTEGER NOT NULL
);

INSERT INTO category(name)
VALUES ('magic');

INSERT INTO category(name)
VALUES ('power');

INSERT INTO supplier(name, address, city, province)
VALUES ('howards', 'mundo magico', 'escocia', 'lago negro');

INSERT INTO supplier(name, address, city, province)
VALUES ('capsule corp', 'boulevard 2440', 'saltillo', 'coahuila') ;

INSERT INTO part(name, color, price)
VALUES ('esfera del dragon 1 estrella ', 'naranja', 10.5) ;

INSERT INTO part(name, color, price)
VALUES ('esfera del dragon 2 estrella ', 'naranja', 15.6) ;

INSERT INTO part(name, color, price)
VALUES ('esfera del dragon 3 estrellas ', 'naranja', 21.8) ;

UPDATE part
SET category_code = 2
WHERE part_id = 3;

INSERT INTO part(name, color, price, category_code)
VALUES ('esfera del dragon 4 estrellas ', 'naranja', 11050.8, 2) ;

INSERT INTO part(name, color, price, category_code)
VALUES ('esfera del dragon 5 estrellas ', 'naranja', 50.8, 2) ;

INSERT INTO part(name, color, price, category_code)
VALUES ('esfera del dragon 6 estrellas ', 'naranja', 5.5, 2) ;

INSERT INTO part(name, color, price, category_code)
VALUES ('esfera del dragon 7 estrellas ', 'naranja', 45.5, 2) ;


INSERT INTO part(name, color, price, category_code)
VALUES ('escoba voladora cometa 260 ', 'cafe', 15.2, 1) ;


INSERT INTO part(name, color, price, category_code)
VALUES ('polvos flu', 'azul', 105.7, 1) ;


INSERT INTO part(name, color, price, category_code)
VALUES ('mapa del merodeador', 'beige', 35005.1, 1) ;

INSERT INTO supply (supplier_id, part_id, date, quantity)
VALUES (1, 8, '2024-04-03', 100);

INSERT INTO supply (supplier_id, part_id, date, quantity)
VALUES (2, 3, '2024-04-03', 70);

SELECT *
FROM part
ORDER BY category_code;

SELECT part.name AS partName, 
       part.category_code AS partCategoryCode, 
       category.name AS categoryName
FROM part
INNER JOIN category 
ON part.category_code = category.category_code;

SELECT s.name AS supplier_name, 
       p.name AS part_name, 
       p.color AS part_color, 
       p.price AS part_price, 
       c.name AS category_name,
       su.date AS supply_date,
       su.quantity AS supply_quantity
FROM supply su
JOIN supplier s ON su.supplier_id = s.supplier_id
JOIN part p ON su.part_id = p.part_id
JOIN category c ON p.category_code = c.category_code;

SELECT *
FROM part
WHERE price = (SELECT MAX(price) FROM part);



