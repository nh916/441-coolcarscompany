-- script to create customer table
CREATE TABLE IF NOT EXISTS customer
(
    customer_id           INTEGER     NOT NULL,
    customer_name         TEXT        NOT NULL,
    customer_phone_number VARCHAR(30) NOT NULL,
    customer_street       TEXT        NOT NULL,
    customer_city         TEXT        NOT NULL,
    customer_zip_code     VARCHAR(20) NOT NULL,
    customer_type         TEXT        NOT NULL,
    PRIMARY KEY (customer_id),
    CHECK ( customer_type = 'international' or customer_type = 'domestic')
);


-- creation of domestic customer table with inheritance
CREATE TABLE IF NOT EXISTS domestic_customer
(
    domestic_customer_id    INTEGER    NOT NULL,
    domestic_customer_state VARCHAR(2) NOT NULL,
    PRIMARY KEY (domestic_customer_id),
    FOREIGN KEY (domestic_customer_id) REFERENCES customer (customer_id)
);


-- international customer
CREATE TABLE IF NOT EXISTS international_customer
(
    international_customer_id      INTEGER NOT NULL,
    international_customer_country TEXT    NOT NULL,
    PRIMARY KEY (international_customer_id),
    FOREIGN KEY (international_customer_id) REFERENCES customer (customer_id)
);


-- create employee table
CREATE TABLE IF NOT EXISTS employee
(
    employee_ID           INTEGER     NOT NULL,
    employee_name         TEXT        NOT NULL,
    employee_phone_number VARCHAR(30) NOT NULL,
    employee_email        TEXT        NOT NULL,
    employee_date_hired   DATE DEFAULT CURRENT_DATE NOT NULL,
    employee_type         TEXT        NOT NULL,
    PRIMARY KEY (employee_ID),
    CHECK ( employee_type = 'sales' or employee_type = 'mechanic')
);

-- create mechanic table sub
CREATE TABLE IF NOT EXISTS mechanic
(
    employee_id          INTEGER NOT NULL,
    mechanic_hourly_rate FLOAT   NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);

-- sales person table subtype of employee
CREATE TABLE IF NOT EXISTS sales_person
(
    employee_id             INTEGER NOT NULL,
    sales_person_commission FLOAT   NOT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);

-- multi valued table
CREATE TABLE IF NOT EXISTS employee_skill
(
    employee_id    INTEGER NOT NULL,
    employee_skill TEXT    NOT NULL,
    PRIMARY KEY (employee_id, employee_skill),
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
    vehicle_make                         TEXT    NOT NULL,
    vehicle_model                        TEXT    NOT NULL,
    vehicle_year                         INT     NOT NULL,
    vehicle_cost                         FLOAT   NOT NULL,
    vehicle_quantity                     INT     NOT NULL,
    vehicle_sales_goal_for_current_year  INT     NOT NULL,
    vehicle_sales_goal_for_previous_year INT     NOT NULL,
    sales_person_id                      INTEGER NOT NULL,
    PRIMARY KEY (vehicle_id),
    FOREIGN KEY (sales_person_id) REFERENCES sales_person (employee_id)
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
    service_mechanic_id  INTEGER NOT NULL,
    service_name         TEXT    NOT NULL,
    service_date_started DATE DEFAULT CURRENT_DATE NOT NULL,
    service_date_end     DATE,
    PRIMARY KEY (service_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id),
    FOREIGN KEY (service_mechanic_id) REFERENCES mechanic (employee_id)
);

-- supplier table
CREATE TABLE IF NOT EXISTS supplier
(
    supplier_id           INTEGER     NOT NULL,
    company_name          TEXT        NOT NULL,
    supplier_phone_number VARCHAR(30) NOT NULL,
    supplier_street       TEXT        NOT NULL,
    supplier_city         TEXT        NOT NULL,
    supplier_state        VARCHAR(2),
    supplier_zip_code     INT         NOT NULL,
    PRIMARY KEY (supplier_id)
);

-- part table
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