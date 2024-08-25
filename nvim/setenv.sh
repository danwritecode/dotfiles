#!/bin/bash

while IFS='=' read -r key value
do
    # remove any leading/trailing whitespace
    key=$(echo $key | xargs)
    value=$(echo $value | xargs)
    
    # skip empty lines and comments
    if [[ ! -z "$key" && ! "$key" =~ ^# ]]; then
        export "$key=$value"
    fi
done < ~/.config/nvim/.env
