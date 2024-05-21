This repository contains three Bash scripts for interacting with databases and analyzing text files.

## 1. psql_query.sh

This script connects to a PostgreSQL database and executes a SQL query. It prompts the user to enter the database connection parameters (host, port, username, password, and database name) and a SQL query. The script then connects to the database, executes the query, and saves the output to a file named output.txt. Finally, it prints the number of lines in the output file and displays the contents of the file.

### Usage

./psql_query.sh

Follow the prompts to enter the required information.

## 2. mongo.sh

This script connects to a MongoDB database and executes a query. It prompts the user to enter the database connection parameters (host, port, and database name) and a MongoDB query. The script then connects to the database, executes the query, and saves the output to a file named output.txt. Finally, it prints the number of lines in the output file, the number of documents in the collection, and the number of unique documents in the collection.

### Usage

./mongo.sh

Follow the prompts to enter the required information.

## 3. txt.sh

This script analyzes a text file. It prompts the user to enter the file path and then checks if the file exists. If the file exists, the script prints the number of lines, words, and characters in the file. It also displays the 10 most frequent words and characters in the file, and prints all lines containing the word "error".

### Usage

./txt.sh

Follow the prompt to enter the file path.

## Prerequisites

- Bash
- PostgreSQL (for psql_query.sh)
- MongoDB (for mongo.sh)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
