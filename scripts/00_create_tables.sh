#!/bin/bash

###############################################################################
# Name: Criação de Tabelas	                                        	      #
# Function: Data Load Workflow                           					      #
# Authors: Vitor Paes Gonçalves   					                          #
# Requirements: Run steps in order of appearance.                             #
###############################################################################


#/home/vhgoncalves2017/scripts
home=$1


###############################################################################
## 			               	Criação de Tabelas HQL				             ##
###############################################################################

echo "Iniciando Criação de Tabelas HIVE"

hql="$home/hql_script" 

hive -f $hql/create_tables.hql 

echo "FIM das Tabelas HIVE"


###############################################################################
## 			               	Execução Script Pyspark				             ##
###############################################################################

echo "Iniciando Execução INGESTA UTILIZANDO PYSPARK"

spark="$home/ingesta"

spark-submit $spark/Main.py

echo "FIM INGESTA"



	

###############################################################################
## 			               	Criação de Tabelas BIGQUERY			             ##
###############################################################################

echo "Criação de Tabelas BIGQUERY	"

#Remoção da tabela db.comp_boss se exisitir
bq rm \
-f \
-t \
lucid-parsec-292923:db.comp_boss


#Criação de Tabelas db.comp_boss
bq mk \
--table \
--expiration 3600 \
--description "This is my table" \
--label organization:development \
lucid-parsec-292923:db.comp_boss \

#Load Parquet
bq load \
--autodetect \
--source_format=PARQUET \
lucid-parsec-292923:db.comp_boss "gs://tables_boavista/comp_boss/*.parquet"


##################################################################################################



#Remoção da tabela db.bill_of_materials se exisitir
bq rm \
-f \
-t \
lucid-parsec-292923:db.bill_of_materials


#Criação de Tabelas db.bill_of_materials
bq mk \
--table \
--expiration 3600 \
--description "This is my table" \
--label organization:development \
lucid-parsec-292923:db.bill_of_materials \

#Load Parquet
bq load \
--autodetect \
--source_format=PARQUET \
lucid-parsec-292923:db.bill_of_materials "gs://tables_boavista/bill_of_materials/*.parquet"


##################################################################################################


#Remoção da tabela db.price_quote se exisitir
bq rm \
-f \
-t \
lucid-parsec-292923:db.price_quote


#Criação de Tabelas db.price_quote
bq mk \
--table \
--expiration 3600 \
--description "This is my table" \
--label organization:development \
lucid-parsec-292923:db.price_quote \

#Load Parquet
bq load \
--autodetect \
--source_format=PARQUET \
lucid-parsec-292923:db.price_quote "gs://tables_boavista/price_quote/*.parquet"


echo "fim Criação de Tabelas BIGQUERY	"

