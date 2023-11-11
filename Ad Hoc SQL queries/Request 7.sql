/* 7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount */


SELECT
		CONCAT(MONTHNAME(date), ' (', YEAR(date), ')') AS Month,
        fs.fiscal_year,
		ROUND(SUM(gp.gross_price*fs.sold_quantity),2) AS  gross_sales_amount
FROM  fact_sales_monthly  fs
JOIN fact_gross_price gp ON gp.product_code =fs.product_code
JOIN dim_customer dc ON dc.customer_code = fs.customer_code 
WHERE dc.customer= 'Atliq Exclusive'
GROUP BY Month,fs.fiscal_year
ORDER BY fs.fiscal_year;
