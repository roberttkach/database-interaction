#!/bin/bash

echo "Enter database host:"
read db_host
echo "Enter database port:"
read db_port
echo "Enter database name:"
read db_name

echo "Enter your query:"
read query

echo "conn = new Mongo('$db_host:$db_port'); db = conn.getDB('$db_name'); $query" | mongo --quiet > output.txt

if [ -f "output.txt" ]
then
    echo "File output.txt created."
else
    echo "File output.txt not created."
    exit 1
fi

num_lines=$(wc -l <"output.txt")
echo "Number of lines in output.txt: $num_lines"

num_docs=$(echo "conn = new Mongo('$db_host:$db_port'); db = conn.getDB('$db_name'); db.your_collection.count()" | mongo --quiet)
echo "Number of documents in the collection: $num_docs"

num_unique_docs=$(echo "conn = new Mongo('$db_host:$db_port'); db = conn.getDB('$db_name'); db.your_collection.distinct('_id').length" | mongo --quiet)
echo "Number of unique documents in the collection: $num_unique_docs"

