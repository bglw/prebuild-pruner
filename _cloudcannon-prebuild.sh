#!/bin/bash

{
    read
    while IFS=, read -r item hide || [ -n "$item" ];
    do
        if [[ "$hide" = *'true'* ]]; then
            echo "Suppressing $item"

            # Crude addition of the published flag (assuming none exists)
            sed -i '' -e '1 s/---/---\npublished: false/g' "_items/$item.html"

            # Alternate: crude deletion
            #rm "_items/$item.html"
        fi
    done 
} < _data/filter.csv