#!/bin/bash

while :

do clear

tail -n +3 mar-2-parse.html > tmp_mar_2_page.html

echo "</div>" >> tmp_page.html

scp tmp_mar_2_page.html cycle3:/u/www/u/llawley/march-el-parser-output.html

echo "uploaded"

sleep 30

done
