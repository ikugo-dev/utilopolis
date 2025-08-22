#!/bin/bash
if [[ $# -lt 1 ]] || [[ $# -gt 3 ]]; then
    echo "Usage: $0 <file_name> [-o <output_file_name>]"
    exit 1
fi
file_name=$1

if [[ $# -eq 2 ]]; then
    file_name_no_suffix=$2
else
    file_name_no_suffix=${file_name%.pdf}
fi

pdftoppm -jpeg -r 300 "$file_name" "$file_name_no_suffix"
