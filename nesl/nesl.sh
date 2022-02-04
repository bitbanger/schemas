#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "need one argument (number of stories to generate)"
		exit 1
fi

BATCH_SIZE=20

DIV=$(( ${1} / 20 ))
MOD=$(( ${1} % 20 ))

rm nesl_output.txt 2>/dev/null

touch nesl_output.txt
touch tmp_nesl_output.txt

for i in $(seq 1 $DIV); do cp nesl_output.txt tmp_nesl_output.txt; ./synth-schemas.sh $BATCH_SIZE | tee nesl_output.txt; cat nesl_output.txt >> tmp_nesl_output.txt; echo "updating webpage..."; ./update-webpage.sh; echo "done"; mv tmp_nesl_output.txt nesl_output.txt; done

cp nesl_output.txt tmp_nesl_output.txt
./synth-schemas.sh $MOD | tee nesl_output.txt
cat nesl_output.txt >> tmp_nesl_output.txt
echo "updating webpage..."
./update-webpage.sh
echo "done"
mv tmp_nesl_output.txt nesl_output.txt

# python extract_composites.py nesl_output.txt | tee nesl_composites.txt
