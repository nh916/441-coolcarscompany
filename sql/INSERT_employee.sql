INSERT INTO employee (name, phone_number, email, date_hired, employee_type)
VALUES ('Joe', 8125462222, 'gmail@gmail.com', '2019-11-14' ,'hourly');

-- hourly
INSERT INTO hourly_employee (hourly_employee_id, hourly_salary_rate)
VALUES (2, 33.3333);


INSERT INTO employee (name, phone_number, email, date_hired, employee_type)
VALUES ('Chandler', 8125462222, 'gmail@gmail.com', '2019-11-14' ,'salaried');

-- salaried
INSERT INTO salaried_employee (annual_rate)
VALUES (1454.68846)

INSERT INTO employee_skill(employee_id, skill)
VALUES (1, 'hop sketch')