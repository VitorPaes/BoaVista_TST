
DROP TABLE IF EXISTS db.bill_of_materials;
CREATE TABLE db.bill_of_materials (
tube_assembly_id STRING,
component_id_1 STRING,
quantity_1 STRING,
component_id_2 STRING,
quantity_2 STRING,
component_id_3 STRING,
quantity_3 STRING,
component_id_4 STRING,
quantity_4 STRING,
component_id_5 STRING,
quantity_5 STRING,
component_id_6 STRING,
quantity_6 STRING,
component_id_7 STRING,
quantity_7 STRING,
component_id_8 STRING,
quantity_8 STRING
)
STORED AS PARQUET
TBLPROPERTIES ("parquet.compress"="SNAPPY");


DROP TABLE IF EXISTS db.comp_boss;
CREATE TABLE db.comp_boss (
component_id STRING,
component_type_id STRING,
type STRING,
connection_type_id STRING,
outside_shape STRING,
base_type STRING,
height_over_tube  STRING,
bolt_pattern_long STRING,
bolt_pattern_wide STRING,
groove STRING,
base_diameter STRING,
shoulder_diameter STRING,
unique_feature STRING,
orientation STRING,
weight STRING
)
STORED AS PARQUET
TBLPROPERTIES ("parquet.compress"="SNAPPY");



DROP TABLE IF EXISTS db.price_quote;
CREATE TABLE db.price_quote (
tube_assembly_id STRING,
supplier STRING,
quote_date STRING,
annual_usage STRING,
min_order_quantity STRING,
bracket_pricing STRING,
quantity STRING,
cost STRING
)
STORED AS PARQUET
TBLPROPERTIES ("parquet.compress"="SNAPPY");