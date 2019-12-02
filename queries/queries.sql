-- which vehicles are priced more than average price of car
SELECT vehicle.vehicle_make, vehicle.vehicle_model, vehicle.vehicle_year, vehicle.vehicle_cost
FROM vehicle
WHERE vehicle_cost >
      (
          SELECT AVG(vehicle_cost)
          FROM vehicle
      )


-- which vehicles are less than average cost of vehicles
SELECT vehicle.vehicle_make, vehicle.vehicle_model, vehicle.vehicle_year, vehicle.vehicle_cost
FROM vehicle
WHERE vehicle_cost <
      (
          SELECT AVG(vehicle_cost)
          FROM vehicle
      )



-- how many cars are priced less than the average price
SELECT COUNT(*) AS cars_priced_less_than_average
FROM vehicle
WHERE vehicle_cost <
      (
          SELECT AVG(vehicle_cost)
          FROM vehicle
      )




SELECT COUNT(*) AS cars_priced_less_than_average
FROM vehicle
WHERE vehicle_cost <
      (
          SELECT AVG(vehicle_cost)
          FROM vehicle
      )
UNION

SELECT COUNT(*) AS total_vehicles
FROM vehicle;




-- what ratio of cars are priced more than the average price
SELECT (
    CAST(
        (SELECT COUNT(*) AS cars_priced_less_than_average
                        FROM vehicle
WHERE vehicle_cost <
(
                                  SELECT AVG(vehicle_cost)
                                  FROM vehicle
                              )
                       )
                   AS FLOAT)
               /
               CAST(
                       (
                           SELECT COUNT(*)
                           FROM vehicle
                       )
                   AS FLOAT
                   )
           )
           AS ratio


-- minified
SELECT (CAST((SELECT COUNT(*) AS cars_priced_less_than_average
              FROM vehicle
              WHERE vehicle_cost < (SELECT AVG(vehicle_cost) FROM vehicle)) AS FLOAT) /
        CAST((SELECT COUNT(*) FROM vehicle) AS FLOAT)) AS ratio



-- SELECT COUNT(*)/total ratio
-- FROM (SELECT v.*, avg(vehicle_cost) over() avgcost, COUNT (*) OVER() total FROM vehicle v) vout;





-- what percentage of cars are priced less than average price round to 2 decimal places
SELECT (ROUND(((CAST((SELECT COUNT(*) AS cars_priced_less_than_average
                      FROM vehicle
                      WHERE vehicle_cost < (SELECT AVG(vehicle_cost) FROM vehicle)) AS FLOAT) /
                CAST((SELECT COUNT(*) FROM vehicle) AS FLOAT))) * 100, 2))









