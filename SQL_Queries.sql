select * from green_taxi_data limit 100;

select count(*) 
from green_taxi_data
where lpep_pickup_datetime >= '2019-09-18 00:00:00'
and lpep_dropoff_datetime <= '2019-09-18 23:59:59'

select * from green_taxi_data  
where lpep_dropoff_datetime - lpep_pickup_datetime = (select max(lpep_dropoff_datetime - lpep_pickup_datetime)
from green_taxi_data)

select max(lpep_dropoff_datetime - lpep_pickup_datetime)
from green_taxi_data

select * from green_taxi_data 
where trip_distance = (select max(trip_distance) from green_taxi_data)

select * from zone_data

select distinct "Borough" from zone_Data

Select "Borough", sum(total_amount)
from green_taxi_data AS g
inner join zone_Data AS z
on g."PULocationID" = z."LocationID"
where lpep_pickup_datetime >= '2019-09-18 00:00:00' 
and lpep_pickup_datetime <= '2019-09-18 23:59:59'
Group by "Borough"
Order by sum(total_amount) desc;

select distinct lpep_pickup_datetime from green_taxi_data

select zone from zone_data where "DOLocationID" = (

select "Zone", tip_amount from zone_data as b join 
(Select "DOLocationID", tip_amount
from green_taxi_data AS g
inner join zone_Data AS z
on g."PULocationID" = z."LocationID"
where "Zone" = 'Astoria' order by tip_amount DESC) 
	as a on a."DOLocationID" = b."LocationID" 


select max(tip_amount) from green_taxi_data
