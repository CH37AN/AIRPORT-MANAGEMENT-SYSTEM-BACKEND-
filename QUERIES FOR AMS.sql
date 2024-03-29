select * FROM CITY;
SELECT * FROM AIRPORT;
SELECT * FROM AIRLINE;
SELECT * FROM DEST;
SELECT * FROM PASSENGER;
SELECT * FROM TICKET3;
SELECT * FROM TICKET2;
SELECT * FROM TICKET1;

TRUNCATE PASSENGER;
-- QUERY TO GET AIRPORT WHERE SPECIFIED AIRPLANE IS GOING
SELECT AP_NAME AS `AIRPORT NAME` FROM DEST WHERE AIRLINEID = "IG";

-- QUERY TO GET COUNT OF FLIGHTS
SELECT COUNT(*) AS 'No. of Flights' FROM DEST;

-- QUERY TO GET COUNT OF FLIGHTS GOING TO SPECIFIED AIRPORT
SELECT COUNT(*) AS 'No. of Flights to Mumbai' FROM DEST where AP_NAME = 'Chhatrapati Shivaji International Airport';

-- QUERY TO GET PASSENGER'S SOURCE AND DESTINATION
SELECT  P.PNAME AS `PASSENGER`,T.SOURCE AS `SOURCE`, T.DESTINATION AS `DESTINATION`
FROM    PASSENGER P
        INNER JOIN TICKET1 T
            ON P.PASSPORTNO = T.PASSPORTNO
WHERE   P.PASSPORTNO = 'A1784568';

-- QUERY TO GET PASSENGER'S SOURCE AND DESTINATION WITHOUT ABBREVATION
SELECT case
when T.SOURCE = 'DEL' then 'DELHI'
when T.SOURCE = 'BLR' then 'BANGLORE'
when T.SOURCE = 'AHM' then 'AHEMDABAD'
when T.SOURCE= 'AMR' then 'AMRITSAR'
when T.SOURCE = 'BOM' then 'MUMBAI'
when T.SOURCE = 'HYD' then 'HYDERABAD'
END 'SOURCE', P.PNAME AS `PASSENGER`
FROM    PASSENGER P
        INNER JOIN TICKET1 T
            ON P.PASSPORTNO = T.PASSPORTNO
WHERE   P.PASSPORTNO = 'A1784568';

-- FOR DESTINATION :-
SELECT case
when T.DESTINATION = 'DEL' then 'DELHI'
when T.DESTINATION = 'BLR' then 'BANGLORE'
when T.DESTINATION = 'AHM' then 'AHEMDABAD'
when T.DESTINATION = 'AMR' then 'AMRITSAR'
when T.DESTINATION = 'BOM' then 'MUMBAI'
when T.DESTINATION = 'HYD' then 'HYDERABAD'
END 'DESTINATION', P.PNAME AS `PASSENGER`
FROM    PASSENGER P
        INNER JOIN TICKET1 T
            ON P.PASSPORTNO = T.PASSPORTNO
WHERE   P.PASSPORTNO = 'A1784568';

-- QUERY TO GET PASSENGERS NAME BETWEEN AGE 40 TO 80
SELECT PNAME AS `PASSENGER`, AGE FROM PASSENGER WHERE AGE BETWEEN 40 AND 80;

-- QUERY TO GET PASSENGERS NAME WITH MAX, MIN AND AVG AGE
SELECT AVG(AGE) FROM PASSENGER; 

SELECT PNAME AS `PASSENGER`, MIN(AGE) FROM PASSENGER GROUP BY AGE having MIN(AGE) < 20;

SELECT PNAME AS `PASSENGER`, MAX(AGE) FROM PASSENGER GROUP BY AGE having MAX(AGE) > 70;

-- QUERY TO PERFORM RIGHT JOIN TO GET MAX AND MIN PRICE OF TICKET AND PASSENGER NAME
SELECT P.PNAME AS `PASSENGER`, MAX(T.PRICE)
FROM    PASSENGER P
        RIGHT JOIN TICKET2 T
            ON P.PASSPORTNO = T.PASSPORTNO GROUP BY P.PNAME having MAX(T.PRICE) > 40000;
            
SELECT P.PNAME AS `PASSENGER`, MIN(T.PRICE)
FROM    PASSENGER P
        RIGHT JOIN TICKET2 T
            ON P.PASSPORTNO = T.PASSPORTNO GROUP BY P.PNAME having MIN(T.PRICE) < 12000;
            
-- QUERY TO PERFORM LEFT JOIN AND GET PASSENGER CLASS AND THEIR NAME
SELECT P.PNAME AS `PASSENGER`, T.CLASS
FROM    PASSENGER P
        LEFT JOIN TICKET1 T
            ON P.PASSPORTNO = T.PASSPORTNO WHERE T.CLASS = 'ECONOMY';
            
