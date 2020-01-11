
CREATE TABLE wide_purchase_material_druid(order_no string, order_po string, date_id string, datatime TIMESTAMP, year_id string, month_of_year int, day_of_month int, day_of_week int, date_no string, month_no string, week_of_year int, week_of_month int, first_day_of_week date, first_day_of_week_short string, quarter_id string, 0purch_org_key string, 0pur_group_key string, 0plant_key string, factory_name string, factory_location string, factory_longitude double, factory_latitude double, 0stor_loc_key string, 0movetype_key string, 0me_orgidtp_key string, supplier_id string, supplier_name string, supplier_location string, supplier_city string, supplier_longitude double, supplier_latitude double, material_type string, zwldl_key string, zmaterial__0employee_sid string, employee_name string, material_id string, material_name string, material_spec string, quantity string, amountvr double, amount double, budget_price double, last_year_price double, market_price double, 0unit_key string, unit_desc string, 0doc_year_sid string, 0doc_num_key string, 0doc_item_sid string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE purchase.wide_purchase_material_druid
SELECT 
    order_no,order_po,date_id,if(isnull(datatime),to_utc_timestamp('2000-01-01','Etc/UTC'),to_utc_timestamp(datatime,'Etc/UTC')),year_id,month_of_year,day_of_month,day_of_week,date_no,month_no,week_of_year,week_of_month,first_day_of_week,first_day_of_week_short,quarter_id,0purch_org_key,0pur_group_key,0plant_key,factory_name,factory_location,factory_longitude,factory_latitude,0stor_loc_key,0movetype_key,0me_orgidtp_key,supplier_id,supplier_name,supplier_location,supplier_city,supplier_longitude,supplier_latitude,material_type,zwldl_key,zmaterial__0employee_sid,employee_name,material_id,material_name,material_spec,quantity,amountvr,amount,budget_price,last_year_price,market_price,0unit_key,unit_desc,0doc_year_sid,0doc_num_key,0doc_item_sid
FROM purchase.wide_purchase_material
where dt='20200106' 


