#!/bin/bash

###############################################################################
# Name: Criação de Tabelas	                                        	      #
# Function: Create Tables()                           					      #
# Authors: Vitor Paes Gonçalves   					                          #
# Requirements: Run steps in order of appearance.                             #
###############################################################################

path_log=/home/vhgoncalves2017/scripts/hql_script/

hive -f $path_log/create_tables.hql 
