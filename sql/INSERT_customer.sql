-- customer
INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('david', 8186725432, 'Pararieie', 'Chatsworth', 'CA', 23146, 'international');

-- internation
INSERT INTO international_customer (international_customer_id, country_code)
VALUES (1, 1);


INSERT INTO customer (name, phone_number, street, city, state, zip_code, customer_type)
VALUES ('joe', 8186725432, 'yo', 'MA', 'CA', 23146, 'domestic');


-- domestic customer
INSERT INTO domestic_customer (regional_code, domestic_customer_id)
VALUES (5, 5);
