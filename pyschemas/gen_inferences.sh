for t in $(cat emnlp_topics.txt); do python inference.py ${t} | tee inference_results/${t}.txt; done
