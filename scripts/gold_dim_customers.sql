-- crm_cust_info, erp_cust_az12, erp_loc_a101
CREATE VIEW gold.dim_customers AS
SELECT
ROW_NUMBER() OVER (ORDER BY cst_id) AS customer_key,
ci.cst_id AS customer_id,
ci.cst_key AS customer_number,
ci.cst_firstname AS first_name,
ci.cst_lastname AS last_name,
el.cntry AS country,
CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr --CRM is Master source
	ELSE COALESCE(ec.gen,'n/a')
END AS gender,
ci.cst_marital_status AS marital_status,
ec.bdate AS birth_date,
ci.cst_create_date AS registered_date

FROM silver.crm_cust_info ci
	LEFT JOIN  silver.erp_cust_az12 ec
		ON ci.cst_key = ec.cid
			LEFT JOIN silver.erp_loc_a101 el
				ON ci.cst_key = el.cid;







