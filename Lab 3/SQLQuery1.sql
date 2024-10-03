SELECT
    CHAR_TRIP,
    C.AC_NUMBER,
    A.MOD_CODE,
    CHAR_FUEL_GALLONS / CHAR_HOURS_FLOWN AS fuel_consumption,
    avg_fuel.avg_hourly_fuel_consumption_per_model
FROM CHARTER C
JOIN AIRCRAFT A ON C.AC_NUMBER = A.AC_NUMBER
JOIN (
    SELECT
        A.MOD_CODE,
        AVG(C.CHAR_FUEL_GALLONS / C.CHAR_HOURS_FLOWN) AS avg_hourly_fuel_consumption_per_model
    FROM CHARTER C
    JOIN AIRCRAFT A ON C.AC_NUMBER = A.AC_NUMBER
    GROUP BY A.MOD_CODE
) AS avg_fuel ON A.MOD_CODE = avg_fuel.MOD_CODE
WHERE CHAR_FUEL_GALLONS / CHAR_HOURS_FLOWN > avg_fuel.avg_hourly_fuel_consumption_per_model;
