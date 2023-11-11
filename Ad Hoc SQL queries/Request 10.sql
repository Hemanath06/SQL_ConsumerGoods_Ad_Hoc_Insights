/* 10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code */


WITH RankedProducts AS (
    SELECT
        dp.division,
        dp.product_code,
        SUM(fs.sold_quantity) AS total_sold_quantity,
        ROW_NUMBER() OVER (PARTITION BY dp.division ORDER BY SUM(fs.sold_quantity) DESC) AS product_rank
    FROM fact_sales_monthly fs
    JOIN dim_product dp ON dp.product_code = fs.product_code
    WHERE fs.fiscal_year=2021
    GROUP BY dp.product_code, dp.division
  
)
SELECT division, product_code, total_sold_quantity
FROM RankedProducts
WHERE  product_rank <= 3;

