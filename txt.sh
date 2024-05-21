#!/bin/bash

echo "Please enter the file path:"
read file

if [ -f "$file" ]
then
    echo "$file found."
else
    echo "$file not found."
    exit 1
fi

num_lines=$(wc -l <"$file")
echo "Number of lines in $file: $num_lines"

num_words=$(wc -w <"$file")
echo "Number of words in $file: $num_words"

num_chars=$(wc -m <"$file")
echo "Number of characters in $file: $num_chars"

echo "Most frequent words:"
cat $file | tr ' ' '\n' | sort | uniq -c | sort -nr | head -10

echo "Most frequent characters:"
cat $file | fold -w1 | sort | uniq -c | sort -nr | head -10

echo "Lines containing the word 'error':"
grep -n 'error' $file

