CREATE VIEW gold.fact_sales AS
SELECT
csd.sls_ord_num AS order_number,
gdp.product_row_id AS product_key,
gdc.customer_id as customer_key,
csd.sls_order_dt AS order_date,
csd.sls_ship_dt AS ship_date,
csd.sls_due_dt AS due_date,
csd.sls_sales AS sales,
csd.sls_quantity AS quantity,
csd.sls_price AS price
FROM silver.crm_sales_details csd
	LEFT JOIN gold.dim_products gdp
		ON csd.sls_prd_key = gdp.product_key
			LEFT JOIN gold.dim_customers gdc
				ON csd.sls_cust_id = gdc.customer_id
			
