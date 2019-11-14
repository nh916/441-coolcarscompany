-- script to create customer table
CREATE TABLE IF NOT EXISTS customer
(
    customer_id   INTEGER     NOT NULL,
    name          TEXT        NOT NULL,
    phone_number  VARCHAR(30) NOT NULL,
    street        TEXT        NOT NULL,
    city          TEXT        NOT NULL,
    state         TEXT        NOT NULL,
    zip_code      VARCHAR(20) NOT NULL,
    customer_type TEXT        NOT NULL,
    PRIMARY KEY (customer_id),
    CHECK ( customer_type = 'international' or customer_type = 'domestic')
);


-- creation of domestic customer table with inheritance *CORRECT*
CREATE TABLE IF NOT EXISTS domestic_customer
(
    domestic_customer_id INTEGER NOT NULL,
    regional_code        int     NOT NULL,
    PRIMARY KEY (domestic_customer_id),
    FOREIGN KEY (domestic_customer_id) REFERENCES customer (customer_id)
);



CREATE TABLE IF NOT EXISTS international_customer
(
    international_customer_id INTEGER NOT NULL,
    country_code              int     NOT NULL,
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
    CHECK ( employee_type = 'hourly' or employee_type = 'salaried')
);


CREATE TABLE IF NOT EXISTS hourly_employee
(
    hourly_employee_id INTEGER NOT NULL,
    hourly_salary_rate float   NOT NULL,
    PRIMARY KEY (hourly_employee_id),
    FOREIGN KEY (hourly_employee_id) REFERENCES employee (employee_ID)
);


CREATE TABLE IF NOT EXISTS salaried_employee
(
    salaried_employee_id INTEGER NOT NULL,
    annual_rate          float   NOT NULL,
    PRIMARY KEY (salaried_employee_id),
    FOREIGN KEY (salaried_employee_id) REFERENCES employee (employee_ID)
);

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
    hourly_rate float   NOT NULL,
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
    vehicle_cost                         float   NOT NULL,
    vehicle_sales_goal_for_current_year  int     NOT NULL,
    vehicle_sales_goal_for_previous_year int     NOT NULL,
    employee_id                          INTEGER NOT NULL,
    PRIMARY KEY (vehicle_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_ID)
);


-- order line tabe
CREATE TABLE IF NOT EXISTS order_line
(
    order_line_id  INTEGER NOT NULL,
    product_id     INTEGER NOT NULL,
    order_id       INTEGER NOT NULL,
    order_quantity int     NOT NULL,
    PRIMARY KEY (order_line_id),
    FOREIGN KEY (product_id) REFERENCES vehicle (vehicle_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
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

-- sales person table
CREATE TABLE IF NOT EXISTS salesPerson
(
    service_id INTEGER NOT NULL,
    commission float   NOT NULL,
    vehicle_id INTEGER NOT NULL,
    PRIMARY KEY (service_id),
    FOREIGN KEY (service_id) REFERENCES employee (employee_ID),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (vehicle_id)
);

-- part table
CREATE TABLE IF NOT EXISTS part
(
    part_id     INTEGER NOT NULL,
    part_name   TEXT    NOT NULL,
    part_price  float   NOT NULL,
    mechanic_id INTEGER NOT NULL,
    primary key (part_id),
    FOREIGN KEY (part_id) REFERENCES supplier (part_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic (employee_id)
);

-- supplier table
CREATE TABLE IF NOT EXISTS supplier
(
    supplier_id           INTEGER NOT NULL,
    supplier_company_name TEXT    NOT NULL,
    supplier_phone_number INT     NOT NULL,
    street                TEXT    NOT NULL,
    city                  TEXT    NOT NULL,
    state                 TEXT    NOT NULL,
    zip_code              INT     NOT NULL,
    part_id               INTEGER NOT NULL,
    PRIMARY KEY (supplier_id),
    FOREIGN KEY (part_id) REFERENCES part (part_id)
);