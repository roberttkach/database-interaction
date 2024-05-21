#!/bin/bash

echo "Please enter the connection parameters:"
read -p "Enter database host: " db_host
read -p "Enter database port: " db_port
read -p "Enter database username: " db_user
read -s -p "Enter database password: " db_pass
echo
read -p "Enter database name: " db_name

if [[ -z "$db_host" || -z "$db_port" || -z "$db_user" || -z "$db_pass" || -z "$db_name" ]]; then
    echo "One or more connection parameters are missing. Please enter all parameters."
    exit 1
fi

sql_query="SELECT * FROM your_table"

if ! PGPASSWORD=$db_pass psql -h $db_host -p $db_port -U $db_user -d $db_name -c '\q'; then
    echo "Failed to connect to the database. Please check your connection parameters."
    exit 1
fi

PGPASSWORD=$db_pass psql -h $db_host -p $db_port -U $db_user -d $db_name -c "$sql_query" > output.txt

if [ -f "output.txt" ]
then
    echo "File output.txt created."
else
    echo "File output.txt not created."
    exit 1
fi

num_lines=$(wc -l <"output.txt")
echo "Number of lines in output.txt: $num_lines"

echo "Analyzing data in file output.txt:"
awk '{print $0}' output.txt

