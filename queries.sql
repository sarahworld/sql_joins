-- write your queries here

-- Join the two tables so that every column and record appears, regardless of 
--if there is not an owner_id . Your output should look like this:

SELECT * FROM owners ow FULL JOIN vehicles v ON ow.id = v.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and 
--count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:

SELECT ow.first_name, ow.last_name, Count(ow.id) 
FROM owners ow 
JOIN vehicles v 
ON ow.id = v.owner_id 
GROUP BY (ow.first_name, ow.last_name) 
ORDER BY ow.first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results 
-- with more than one vehicle and an average price greater than 10000. Your output should look like this:
SELECT ow.first_name, ow.last_name, COUNT(ow.id),CAST(AVG(v.price) AS INTEGER)
FROM owners ow
JOIN vehicles v
ON ow.id = v.owner_id
GROUP BY (ow.first_name, ow.last_name)
HAVING COUNT(ow.id) > 1
AND CAST(AVG(v.price) AS INTEGER) > 10000
ORDER BY 1 DESC;