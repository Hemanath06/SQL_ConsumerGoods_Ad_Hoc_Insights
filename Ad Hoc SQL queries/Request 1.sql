/*1. Provide the list of markets in which customer "Atliq Exclusive" operates its
 business in the APAC region.*/

SELECT DISTINCT market,customer,region FROM dim_customer
where customer ="Atliq Exclusive" and region="APAC";