#! /bin/sh

fails=0

for file in $*; do
    if ! [ -e $file ]; then
        echo "Error: $file does not exists"
        fails=$(($fails + 1))
    fi
done

if [ $fails -ne 0 ]; then
    echo "$fails errors found"
    exit 1
fi
