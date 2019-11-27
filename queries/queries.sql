-- which vehicles are priced more than average price of car
SELECT vehicle.vehicle_make, vehicle.vehicle_model, vehicle.vehicle_year, vehicle.vehicle_cost
FROM vehicle
WHERE vehicle_cost >
      (
          SELECT AVG(vehicle_cost) FROM vehicle

          )


-- which vehicles are less than average cost of vehicles
SELECT vehicle.vehicle_make, vehicle.vehicle_model, vehicle.vehicle_year, vehicle.vehicle_cost
FROM vehicle
WHERE vehicle_cost <
      (
          SELECT AVG(vehicle_cost) FROM vehicle

          )



-- how many cars are priced less than the average price
SELECT COUNT(*)

FROM vehicle
WHERE vehicle_cost <
      (
          SELECT AVG(vehicle_cost) FROM vehicle

          )
