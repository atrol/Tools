#!/bin/bash
ret=0
for f in $(find . -name '*.php')
do 
    php -l $f >/dev/null
    if [ $? -gt 0 ]
    then
        ret=1
    fi
done
exit $ret
