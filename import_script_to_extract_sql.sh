grep -oP '(?<=^ [SF] ).*?(?= rows:\d+$)' path/to/your/file.txt | sed 's/$/;/'

