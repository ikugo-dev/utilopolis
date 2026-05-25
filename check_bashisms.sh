#!/bin/sh

find . -type f -name "*.sh" -exec sh -c '
    echo -n "Checking: $0 -> "
    checkbashisms "$0" && echo "No" || echo "Yes"
' {} \;
