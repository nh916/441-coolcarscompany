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
     CHECK ( customer_type = "international" or  customer_type = "domestic")
);

create unique index customer_customer_id_uindex
    on customer (customer_id);





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
     CHECK ( employee_type = "hourly" or  employee_type = "salaried")
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




-- creation of domestic customer table with inheritance
create table domestic_customer
(
    domestic_customer_id INTEGER PRIMARY KEY REFERENCES customer (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	regional_code int not null
);