/* 9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage */


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

