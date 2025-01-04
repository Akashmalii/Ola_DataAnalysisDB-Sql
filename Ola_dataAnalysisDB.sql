create database ola;
use ola;
-- 1.Retrive all the successful bookings
create view successfull_bookings as
select * from booking where booking_status='Success';
select * from successfull_bookings;

-- 2.find the average ride distance for each vahicel type
create view average_distance as
select vehicle_type,avg(ride_distance) from booking group by vehicle_type;
select * from average_distance; 

-- 3. get the total number of canceled rides by customer
select * from booking;
create view canceled_by_customer as
select booking_status,count(booking_status) from booking
where booking_status='Canceled by Customer'; 
select * from canceled_by_customer;

-- 4.list the top 5 customer who booked the highest number of rides
select * from booking;
create view top5_cust as
select  customer_id,count(booking_id) as total_rides 
from booking group by customer_id order by total_rides desc limit 5;
select * from top5_cust;

-- 5.get the number of rides canceled by the driver due to personal and car-related-issues
select * from booking;
create view canceled_rides_driver_pc_issues as
select count(*) from booking
where Canceled_Rides_by_Driver ='Personal & Car related issue';
select * from canceled_rides_driver_pc_issues;

-- 6. find the maximum and minimum driver ratings for the prime sedan booking
select * from booking;
create view max_min_driver_rating as
select vehicle_type,max(driver_ratings)as max_rating,min(driver_ratings) as min_rating
from booking where vehicle_type='Prime Sedan';
select * from max_min_driver_rating;

-- 7. retrieve all rides where payment was made using upi
select * from booking;
create view UPI_payment as
select * from booking where payment_method='UPi';
select * from UPI_payment;

-- 8. fing the average customer rating per vehicle type
select * from booking;
create view avg_cust_type as
select vehicle_type,avg(customer_rating) from booking group by vehicle_type;
select * from avg_cust_type;

-- 9. calculate the total booking value of rides completed successfully
select * from booking;
create view total_successfull_value as
select sum(booking_value) as total_successful_value
from booking where booking_status='Success'; 
select * from total_successfull_value;

-- 10.list all incomplete rides along with the reason
select * from booking;
create view incomplete_rides_reason as
select booking_id,incomplete_rides_reason from booking where incomplete_rides='Yes'; 
select * from incomplete_rides_reason;