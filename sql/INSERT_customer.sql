-- customer
-- domestic
INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('Rachel Green', 2129173324, 'West 14th Street', 'New York City', 'NY', 10011, 'domestic');

-- domestic customer
    INSERT INTO domestic_customer (domestic_customer_id, regional_code)
    VALUES (1, 212);


INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('Monica Geller', 2125131222, 'Rodeo Drive', 'Beverly Hills', 'CA', 90212, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, regional_code)
    VALUES (2, 210);


INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('Phoebe Buffay', 7026796194, 'Fremont Street', 'Las Vegas', 'NV', 88901, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, regional_code)
    VALUES (3, 8891);


INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('Chandler Bing', 4152005072, 'Lombard Street', 'San Francisco', 'CA', 88901, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, regional_code)
    VALUES (4, 210);


INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('Ross Geller', 5048087686, 'Lombard Street', 'New Orleans', 'LA', 70032, 'domestic');

    INSERT INTO domestic_customer (domestic_customer_id, regional_code)
    VALUES (5, 610);


-- international customers
INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Ben Geller', 123054343, 'Tokyo Street', 'Tokyo City', 100-0000, 'international');

    INSERT INTO international_customer (international_customer_id, country_code)
    VALUES (6, 61);

INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Paul Stevens', 4305642343, 'İstiklal Avenue', 'Istanbul', 56232, 'international');

    INSERT INTO international_customer (international_customer_id, country_code)
    VALUES (7, 61);


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Emily Waltham', 58768135413, 'Cole Street', 'Paris', 48216, 'international');

    INSERT INTO international_customer (international_customer_id, country_code)
    VALUES (8, 61);


INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Janice Hosenstein', 64921872641, 'Addle Hill', 'London', 64397, 'international');

    INSERT INTO international_customer (international_customer_id, country_code)
    VALUES (9, 61);



INSERT INTO customer (name, phone_number, street, city, zip_code, customer_type)
VALUES ('Janice Hosenstein', 59721651327, 'Khao San Road', 'Bangkok', 641657, 'international');

    INSERT INTO international_customer (international_customer_id, country_code)
    VALUES (10, 61);
