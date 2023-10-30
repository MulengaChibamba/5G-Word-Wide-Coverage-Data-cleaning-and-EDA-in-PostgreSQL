create table world_wide_coverage
(
   operator varchar(50),
   city_name varchar(150),
   deployment_type varchar(50),
   status varchar(50),
   latitude float,
   longitude float
)
	
	
select * from world_wide_coverage

/* top ten operators with active 5G*/
select 
distinct(count(operator)) as operator_name, operator, deployment_type
from world_wide_coverage
group by operator, deployment_type
order by operator_name desc limit 10

/* group by status */

SELECT 
DISTINCT(COUNT(status))  status_count , status
FROM  world_wide_coverage
GROUP BY status
ORDER BY status_count desc

/* top 10 cities with active 5G */

select 
distinct(count(city_name)) as city, operator, deployment_type, city_name, status
from world_wide_coverage
group by city_name, operator, deployment_type, status
order by city desc limit 10

/* top ten cities filtered by pre-release */

select 
distinct(count(city_name)) as city, operator, deployment_type, city_name, status
from world_wide_coverage
where status = 'Pre-Release'
group by city_name, operator, deployment_type, status
order by city 


select 
distinct(count(city_name)) as city, operator, deployment_type, city_name, status
from world_wide_coverage
where status = 'Limited Availabilty'
group by city_name, operator, deployment_type, status
order by city

