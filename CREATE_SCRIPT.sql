



-- create employee table
CREATE TABLE IF NOT EXISTS employee
(
    employee_ID   INTEGER     NOT NULL,
--         constraint employee_pk
--             PRIMARY KEY,
    name          TEXT        NOT NULL,
    phone_number  VARCHAR(30) NOT NULL,
    email         TEXT        NOT NULL,
    date_hired    DATE DEFAULT current_timestamp NOT NULL,
    employee_type TEXT        NOT NULL,
--         check to be sure that the employee
    PRIMARY KEY (employee_ID),
     CHECK ( employee_type = 'hourly' or  employee_type = 'salaried')
);

-- create unique index employee_employee_ID_uindex
--     on employee (employee_ID);





-- create mechanic table
CREATE TABLE IF NOT EXISTS mechanic
(
    mechanic_ID  INTEGER     NOT NULL,
--         constraint mechanic_pk
--             primary key autoincrement,
    name         TEXT        NOT NULL,
    phone_number VARCHAR(30) NOT NULL,
    email        TEXT        NOT NULL,
    PRIMARY KEY (mechanic_ID)
);


-- create unique index mechanic_mechanic_ID_uindex
--     on mechanic (mechanic_ID);





-- create invoice table
CREATE TABLE IF NOT EXISTS invoice
(
    invoice_id INTEGER NOT NULL,
--         constraint invoice_pk
--             primary key autoincrement,
    date       DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    order_id   int     NOT NULL,
    PRIMARY KEY (invoice_id)
);

-- create unique index invoice_invoice_id_uindex
--     on invoice (invoice_id);








-- script to create customer table
CREATE TABLE IF NOT EXISTS customer
(
    customer_id   INTEGER     NOT NULL,
--         constraint customer_pk
--             primary key autoincrement,
    name TEXT        NOT NULL,
    phone_number  VARCHAR(30) NOT NULL,
    street        TEXT        NOT NULL,
    city          TEXT        NOT NULL,
    state         TEXT        NOT NULL,
    zip_code      VARCHAR(20) NOT NULL,
    customer_type TEXT         NOT NULL,
    PRIMARY KEY (customer_id),
     CHECK ( customer_type = 'international' or  customer_type = 'domestic')
);

-- create unique index customer_customer_id_uindex
--     on customer (customer_id);






-- creation of domestic customer table with inheritance *CORRECT*
CREATE TABLE IF NOT EXISTS domestic_customer
(
    domestic_customer_id INTEGER NOT NULL,
    regional_code int NOT NULL,
    PRIMARY KEY (domestic_customer_id),
    FOREIGN KEY (domestic_customer_id) REFERENCES customer(customer_id)
);




CREATE TABLE IF NOT EXISTS international_customer
(
    international_customer_id INTEGER NOT NULL,
-- 		constraint international_customer_pk
-- 			primary key autoincrement,
    country_code int NOT NULL,
    PRIMARY KEY (international_customer_id),
    FOREIGN KEY (international_customer_id) REFERENCES customer(customer_id)
);

-- create unique index international_customer_international_customer_id_uindex
-- 	on international_customer (international_customer_id);





CREATE TABLE IF NOT EXISTS hourly_employee(
  hourly_employee_id INTEGER NOT NULL,
  hourly_salary_rate float NOT NULL,
  PRIMARY KEY (hourly_employee_id),
  FOREIGN KEY (hourly_employee_id) REFERENCES employee(employee_ID)
);



-- orders bc order is reserved
CREATE TABLE IF NOT EXISTS orders
(
  order_id INTEGER NOT NULL,
  order_placement_date DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  order_shipment_date DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  customer_id INTEGER NOT NULL,
  primary key (order_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);







-- sample
CREATE TABLE IF NOT EXISTS international_customer
(
	international_customer_id INTEGER NOT NULL
		constraint international_customer_pk
			primary key autoincrement,
	country_code int NOT NULL
);

create unique index international_customer_international_customer_id_uindex
	on international_customer (international_customer_id);
















-- samp
CREATE TABLE IF NOT EXISTS table_name
(
	pk INTEGER NOT NULL
		constraint table_name_pk
			primary key autoincrement
);

create unique index table_name_pk_uindex
	on table_name (pk);





-- he said this is wrong
-- CREATE TABLE IF NOT EXISTS domestic_customer
-- (
--     regional_code        int     NOT NULL,
--     domestic_customer_id INTEGER NOT NULL
--         constraint domestic_customer_pk
--             primary key autoincrement
--         references customer
--             on update cascade on delete cascade
-- );
--
-- create unique index domestic_customer_domestic_customer_id_uindex
--     on domestic_customer (domestic_customer_id);
--



-- works
-- CREATE TABLE IF NOT EXISTS domestic_customer
-- (
--     domestic_customer_id INTEGER
--         primary key
--         constraint domestic_customer_id
--             references customer,
--     regional_code        int NOT NULL
-- );