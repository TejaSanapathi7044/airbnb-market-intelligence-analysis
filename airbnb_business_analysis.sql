-- Total Number of Listings

select count(*) as Total_listings
from AB_NYC;


-- Average Airbnb Price

select avg(price) as Avg_Price
from ab_nyc;


-- Different Room Types Available

select distinct room_type 
from ab_nyc;


-- Count Listings by Room Type

select room_type,count(*) as total_listing
from ab_nyc 
group by room_type;


-- Average price by Room_type
 
select room_type,avg(price) as Avg_price
from ab_nyc 
group by room_type;


-- Average Price by Borough

select neighbourhood_group,
avg(price) as Avg_price
from ab_nyc
group by neighbourhood_group
order by avg_price desc;


-- Listings with Price Greater Than $500

select neighbourhood_group,
price from ab_nyc 
where price > 500
order by price desc;


-- Average Minimum Nights by Room Type

select room_type,
avg(minimum_nights) as Avg_minimum_nights
from ab_nyc 
group by room_type 
order by avg_minimum_nights desc;


-- Neighborhoods with Highest Number of Reviews

select neighbourhood_group,
SUM(number_of_reviews) as total_reviews
from ab_nyc
group by neighbourhood_group
order by total_reviews desc
limit 10;


-- Listings Available More Than 300 Days

select name,availability_365
from ab_nyc 
where availability_365 > 300
order by availability_365 desc;


-- Average Reviews Per Month by Borough

select neighbourhood_group,
avg(reviews_per_month) as avg_review_per_month
from AB_NYC 
group by neighbourhood_group
order by avg_review_per_month desc;


-- Find Hosts Owning More Than 5 Listings

select host_id,host_name,
count(*) as total_listing
from ab_nyc 
group by host_id,host_name 
order BY  total_listing  desc;

-- Top 10 Most Reviewed Listings

select name,number_of_reviews
from ab_nyc 
order by number_of_reviews desc
limit 10;


-- Estimated Revenue by Neighborhood

select neighbourhood,
sum(price * reviews_per_month) as estimated_revenue
from ab_nyc 
group by neighbourhood 
order by estimated_revenue desc;


-- Ranking Listings Within Boroughs

select neighbourhood_group ,
name,
price,
rank() over(partition by neighbourhood_group 
order by price desc )
as price_rank 
from ab_nyc ;














































