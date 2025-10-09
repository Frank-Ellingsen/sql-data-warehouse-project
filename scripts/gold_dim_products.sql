CREATE VIEW gold.dim_products AS
SELECT
ROW_NUMBER() OVER (ORDER BY cpi.prd_start_dt, cpi.prd_key) AS product_row_id,
cpi.prd_id AS product_id,
cpi.prd_key AS product_key,
cpi.prd_nm AS product_name,
cpi.cat_id AS category_id,
epc.cat AS category,
epc.subcat AS subcategory,
cpi.prd_type AS product_type,
cpi.prd_line AS product_line,
epc.maintenance AS maintenance,
cpi.prd_cost AS product_cost,
cpi.prd_start_dt AS product_start_date
FROM silver.crm_prd_info cpi
	LEFT JOIN silver.erp_px_cat_g1v2 epc
		ON cpi.cat_id = epc.id
WHERE cpi.prd_end_dt IS NULL; -- Filter only present products/price
