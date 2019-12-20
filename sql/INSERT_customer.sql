-- customer
-- domestic
INSERT INTO customer (name, phone_number, street, city,  zip_code, customer_type)
VALUES ('Rachel Green', 2129173324, 'West 14th Street', 'New York City', 10011, 'domestic');

-- domestic customer
    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (1,  'NY');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Monica Geller', 2125131222, 'Rodeo Drive', 'Beverly Hills',  90212, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (2, 'CA');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Phoebe Buffay', 7026796194, 'Fremont Street', 'Las Vegas', 88901, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (3, 'NV');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Chandler Bing', 4152005072, 'Lombard Street', 'San Francisco', 88901, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (4, 'CA');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Ross Geller', 5048087686, 'Lombard Street', 'New Orleans', 70032, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (5, 'CA');


-- international customers
INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Ben Geller', 123054343, 'Tokyo Street', 'Tokyo City', 100-0000, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (6, 'Japan');

INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Paul Stevens', 4305642343, 'İstiklal Avenue', 'Istanbul', 56232, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (7, 'Turkey');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Emily Waltham', 58768135413, 'Cole Street', 'Paris', 48216, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (8, 'France');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Janice Hosenstein', 64921872641, 'Addle Hill', 'London', 64397, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (9, 'England');



INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Janice Hosenstein', 59721651327, 'Khao San Road', 'Bangkok', 641657, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (10, 'Thailand');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Kathy Lopez', 81845631, 'Reseda', 'Northridge', 942647, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (11, 'CA');

INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Pete Becker', 81856429, 'La Pigalle', 'Paris', 48430, 'international');

    INSERT INTO international_customer(international_customer_id, country)
    VALUES (12, 'France');

INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Marie Bradley', 818456321, 'Corbin', 'Canoga Park', 91305, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, state)
    VALUES (13, 'CA');

INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Anna Collier', 791621, 'Harley Street', 'London', 48451, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (14, 'England');


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Margaret Mack', 54781544, 'Carnaby Street', 'London', 48741, 'international');

    INSERT INTO international_customer (international_customer_id, country)
    VALUES (15, 'England');
