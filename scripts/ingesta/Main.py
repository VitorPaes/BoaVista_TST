import pyspark
import sys
from google.cloud import storage
from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession
from pyspark.sql import HiveContext
import logging

spark = SparkSession \
    .builder \
    .appName("Load_And_WRITe_TABLES") \
    .config('spark.sql.parquet.compression.codec', 'snappy') \
    .getOrCreate()

bill_of_materials = "gs://dados_boavista/TesteEngenheiroDados/bill_of_materials.csv"
comp_boss = "gs://dados_boavista/TesteEngenheiroDados/comp_boss.csv"
price_quote = "gs://dados_boavista/TesteEngenheiroDados/price_quote.csv"


#Ler os CSVs no Google Storege
def read_csv_file(filename):
    df = spark.read.option("header",True) \
        .csv(filename)
    return df


def main():
    print("::::::: INICIANDO A A LEIURA DO CSV ::::::")
    try:
        df_bill_of_materials = read_csv_file(bill_of_materials)
        df_comp_bosss = read_csv_file(comp_boss)
        df_price_quote = read_csv_file(price_quote)
        #df.show()
               
    except Exception as ex:
        print(ex)





if __name__ == '__main__':
	main()
