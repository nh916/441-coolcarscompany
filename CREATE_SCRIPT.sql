




-- create employee table
create table employee
(
    employee_ID   INTEGER     not null
        constraint employee_pk
            primary key autoincrement,
    name          TEXT        not null,
    phone_number  VARCHAR(30) not null,
    email         TEXT        not null,
    date_hired    DATE default current_timestamp not null,
    employee_type TEXT        not null
--         check to be sure that the employee
     CHECK ( employee_type = 'hourly' or  employee_type = 'salaried')
);

create unique index employee_employee_ID_uindex
    on employee (employee_ID);





-- create mechanic table
create table mechanic
(
    mechanic_ID  INTEGER     not null
        constraint mechanic_pk
            primary key autoincrement,
    name         TEXT        not null,
    phone_number VARCHAR(30) not null,
    email        TEXT        not null
);

create unique index mechanic_mechanic_ID_uindex
    on mechanic (mechanic_ID);





-- create invoice table
create table invoice
(
    invoice_id INTEGER not null
        constraint invoice_pk
            primary key autoincrement,
    date       DATE default CURRENT_TIMESTAMP not null,
    order_id   int     not null
);

create unique index invoice_invoice_id_uindex
    on invoice (invoice_id);








-- script to create customer table
create table customer
(
    customer_id   INTEGER     not null
        constraint customer_pk
            primary key autoincrement,
    name TEXT        not null,
    phone_number  VARCHAR(30) not null,
    street        TEXT        not null,
    city          TEXT        not null,
    state         TEXT        not null,
    zip_code      VARCHAR(20) not null,
    customer_type TEXT         not null
     CHECK ( customer_type = 'international' or  customer_type = 'domestic')
);

create unique index customer_customer_id_uindex
    on customer (customer_id);






-- creation of domestic customer table with inheritance *CORRECT*
create table domestic_customer
(
    domestic_customer_id INTEGER PRIMARY KEY,
    regional_code int not null,
    FOREIGN KEY (domestic_customer_id) REFERENCES customer(customer_id)
);

create table international_customer
(
    international_customer_id INTEGER not null
		constraint international_customer_pk
			primary key autoincrement,
    country_code int not null,
    FOREIGN KEY (international_customer_id) REFERENCES customer(customer_id)
);
create unique index international_customer_international_customer_id_uindex
	on international_customer (international_customer_id);








-- sample
create table international_customer
(
	international_customer_id INTEGER not null
		constraint international_customer_pk
			primary key autoincrement,
	country_code int not null
);

create unique index international_customer_international_customer_id_uindex
	on international_customer (international_customer_id);
















-- samp
create table table_name
(
	pk INTEGER not null
		constraint table_name_pk
			primary key autoincrement
);

create unique index table_name_pk_uindex
	on table_name (pk);





-- he said this is wrong
-- create table domestic_customer
-- (
--     regional_code        int     not null,
--     domestic_customer_id INTEGER not null
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
-- create table domestic_customer
-- (
--     domestic_customer_id INTEGER
--         primary key
--         constraint domestic_customer_id
--             references customer,
--     regional_code        int not null
-- );