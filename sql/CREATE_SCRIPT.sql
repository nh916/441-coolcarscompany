-- script to create customer table
CREATE TABLE IF NOT EXISTS customer
(
    customer_id   INTEGER     NOT NULL,
    name          TEXT        NOT NULL,
--     think about make it INT or varchar
--     varchar for more flexibility
    phone_number  VARCHAR(30) NOT NULL,
--     think about adding extension
    street        TEXT        NOT NULL,
    city          TEXT        NOT NULL,
-- allowing null for state in case of international
    state         VARCHAR(2),
    zip_code      VARCHAR(20) NOT NULL,
    customer_type TEXT        NOT NULL,
    PRIMARY KEY (customer_id),
    CHECK ( customer_type = 'international' or customer_type = 'domestic')
);


-- creation of domestic customer table with inheritance
CREATE TABLE IF NOT EXISTS domestic_customer
(
    domestic_customer_id INTEGER NOT NULL,
    regional_code        INT     NOT NULL,
    PRIMARY KEY (domestic_customer_id),
    FOREIGN KEY (domestic_customer_id) REFERENCES customer (customer_id)
);



CREATE TABLE IF NOT EXISTS international_customer
(
    international_customer_id INTEGER NOT NULL,
    country_code              INT     NOT NULL,
    PRIMARY KEY (international_customer_id),
    FOREIGN KEY (international_customer_id) REFERENCES customer (customer_id)
);


-- create employee table
CREATE TABLE IF NOT EXISTS employee
(
    employee_ID   INTEGER     NOT NULL,
    name          TEXT        NOT NULL,
    phone_number  VARCHAR(30) NOT NULL,
    email         TEXT        NOT NULL,
    date_hired    DATE DEFAULT CURRENT_DATE NOT NULL,
    employee_type TEXT        NOT NULL,
    PRIMARY KEY (employee_ID),
    CHECK ( employee_type = 'sales' or employee_type = 'mechanic')
);


CREATE TABLE IF NOT EXISTS sales_person
(
    employee_id INTEGER NOT NULL,
    commission  FLOAT   NOT NULL,
    vehicle_id  INTEGER NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);


-- CREATE TABLE IF NOT EXISTS salaried_employee
-- (
--     salaried_employee_id INTEGER NOT NULL,
--     annual_rate          FLOAT   NOT NULL,
--     PRIMARY KEY (salaried_employee_id),
--     FOREIGN KEY (salaried_employee_id) REFERENCES employee (employee_ID)
-- );

CREATE TABLE IF NOT EXISTS employee_skill
(
    employee_id INTEGER NOT NULL,
    skill       TEXT    NOT NULL,
    PRIMARY KEY (employee_id, skill),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);


-- create mechanic table
CREATE TABLE IF NOT EXISTS mechanic
(
    employee_id INTEGER NOT NULL,
    hourly_rate FLOAT   NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);

-- orders bc order is reserved
CREATE TABLE IF NOT EXISTS orders
(
    order_id             INTEGER NOT NULL,
    order_placement_date DATE DEFAULT CURRENT_DATE NOT NULL,
    order_shipment_date  DATE,
    customer_id          INTEGER NOT NULL,
    primary key (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

-- vehicle table
CREATE TABLE IF NOT EXISTS vehicle
(
    vehicle_id                           INTEGER NOT NULL,
    vehicle_name                         TEXT    NOT NULL,
--     vehicle_brand                        TEXT    NOT NULL,
--     vehicle_model                        TEXT    NOT NULL,
    vehicle_cost                         FLOAT   NOT NULL,
    vehicle_sales_goal_for_current_year  INT     NOT NULL,
    vehicle_sales_goal_for_previous_year INT     NOT NULL,
--     employee_id                          INTEGER NOT NULL,
    PRIMARY KEY (vehicle_id)
--     FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);


-- create order line table
CREATE TABLE IF NOT EXISTS order_line
(
    order_line_id  INTEGER NOT NULL,
    order_id       INTEGER NOT NULL,
    vehicle_id     INTEGER NOT NULL,
    order_quantity INT     NOT NULL,
    PRIMARY KEY (order_line_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);

-- service table
CREATE TABLE IF NOT EXISTS service
(
    service_id           INTEGER NOT NULL,
    vehicle_id           INTEGER NOT NULL,
    mechanic_id          INTEGER NOT NULL,
    service_name         TEXT    NOT NULL,
    service_date_started DATE DEFAULT CURRENT_DATE NOT NULL,
    service_date_end     DATE,
    PRIMARY KEY (service_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic (employee_id)
);
-- part table
-- todo fix this table and supplier
CREATE TABLE IF NOT EXISTS part
(
    part_id     INTEGER NOT NULL,
    part_name   TEXT    NOT NULL,
    part_price  FLOAT   NOT NULL,
    supplier_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    primary key (part_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic (employee_id)
);

-- supplier table
CREATE TABLE IF NOT EXISTS supplier
(
    supplier_id           INTEGER     NOT NULL,
    supplier_company_name TEXT        NOT NULL,
    supplier_phone_number VARCHAR(30) NOT NULL,
    street                TEXT        NOT NULL,
    city                  TEXT        NOT NULL,
--     todo i think should allow for null in case international supplier
    state                 VARCHAR(2),
    zip_code              INT         NOT NULL,
    PRIMARY KEY (supplier_id)
);