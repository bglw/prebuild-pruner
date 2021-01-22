#!/bin/bash

{
    read
    while IFS=, read -r item hide || [ -n "$item" ];
    do
        if [ "$hide" = 'true' ]; then
            rm $item
            echo "Deleted $item"
        fi
    done 
} < _data/filter.csv