#!/bin/bash
temp_script=`mktemp`
temp_result=`mktemp`

cat << '+++' >> $temp_script
#/bin/bash
php -l $1 >/dev/null 2>> $2
+++
chmod +x $temp_script

find . -name '*.php' -exec $temp_script {} $temp_result \;
rm -f $temp_script
set `wc -c $temp_result`
num_bytes=$1
if test $num_bytes -ne 0; then
  cat $temp_result
  ret=1
else
  ret=0
fi
rm -f $temp_result

exit $ret
