# Projeto Teste Boa Vista

Projeto para ingestão de dados em Python e GCP.


# Solução

![alt text](https://github.com/VitorPaes/BoaVista_TST/blob/main/_exp.png?raw=true)

A solução consiste em armazenar os dados disponibilizados (formato .csv) em um bucket  Google Storage, carregá-los por meio do framework Pyspark pelo cluster Dataproc convertendo-o para o formato colunar parquet disponibilizados no mesmo ambiente. Após a ingesta dos dados os mesmo ficam disponíveis na ferramenta Big Query podendo extrair relatório com o Data Studio.  


## Execução

Fazer Login no servidor enviado e executar o comando:

```bash
cd scripts 
./00_create_tables.sh "/home/boavista/scripts"
```


## Visualização 

Link do Relatório:
https://datastudio.google.com/reporting/24944dd3-0288-4b8c-8066-cf546252d6e9/page/ZqzkB
