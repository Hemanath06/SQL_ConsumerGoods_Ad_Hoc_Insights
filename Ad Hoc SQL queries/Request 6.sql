/* 6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage */


SELECT  c.customer_code,
		c.customer,
        AVG(pre_invoice_discount_pct) AS average_discount_pct
FROM dim_customer c
JOIN fact_pre_invoice_deductions d 
ON c.customer_code=d.customer_code
WHERE d.fiscal_year=2021 AND c.market="India"
GROUP BY c.customer,c.customer_code;


