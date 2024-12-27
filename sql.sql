create schema Uber;
use uber;
Create view Bike_MG_road as
select * from bookings 
where vehicle_type = 'Bike'
and drop_location = 'MG Road';
select * from Bike_MG_road; -- View for  bike and location is mg road

-- 1. Retrive all Successful Bookings and types of vehicle
Select vehicle_type, count(Booking_Status) from Bookings as sucessful_Bookings
where Booking_Status = 'Success'
group by vehicle_type
order by count(Booking_Status) desc;

-- 2. Find the average ride distance for each vehicle type
SELECT Vehicle_Type, 
AVG(Ride_Distance) as avg_distance 
FROM bookings 
GROUP BY Vehicle_Type;

-- 3. Get the total number of cancelled rides by driver and customers:
Select count(booking_status) as All_cancelled_rides from bookings
WHERE booking_status NOT IN ('success', 'Driver Not Found');

Select count(booking_status) as All_cancelled_rides from bookings
where Booking_status = 'Canceled by Customer';

Select count(booking_status) as All_cancelled_rides from bookings
where Booking_status = 'Canceled by Driver';

-- 4. List the top 5 customers who booked the highest number of rides:

SELECT  Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT count(*) as Cancelled_Rides_by_Driver FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings and customer_Rating for Prime Sedan bookings:
Select max(Driver_Ratings) as Max_Rate,min(Driver_Ratings) as Min_Rate, max(Customer_Rating) as Max_Rating, min(Customer_Rating) as Min_Rating from Bookings
where vehicle_Type = 'Prime Sedan'; 

-- 7. Retrieve total no of all rides where payment was made using UPI:
Select count(*) from Bookings 
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
Select vehicle_Type, avg(Customer_Rating) as Avg_Rating from Bookings
Group by Vehicle_Type; 

-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) as Total_Value from Bookings
where Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'Yes';