#!/bin/bash

while :

do clear

tail -n +3 page.html > tmp_page.html

echo "</div>" >> tmp_page.html

scp tmp_page.html cycle3:/u/www/u/llawley/el-parser-output.html

echo "uploaded"

sleep 30

done
