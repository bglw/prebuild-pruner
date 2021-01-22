#!/bin/bash

{
    read
    while IFS=, read -r item hide || [ -n "$item" ];
    do
        if [[ "$hide" = *'true'* ]]; then
            echo "Deleting $item"
            rm "_items/$item.html"
        fi
    done 
} < _data/filter.csv