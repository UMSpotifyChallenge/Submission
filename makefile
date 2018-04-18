
RWR :
  cd RWR_baseline/dataProcess; python convertToOldFrmt.py 0.80; python makeEdgeLists.py;
  cd RWR_baseline/dataProcess/playlistSplit; cp ../songIDToSongNum.p .; python genTeleSets.py 0.50;
  cd RWR_baseline/dataProcess; ./base_RWR.sh

#1. run pyHON/main to generate HON you need to provide playlist-list. you can leave other params as defaults (edited)
#2. run evaluate/pagerank to get personalized pagerank you will find inputs to run in the code: generated HON, and testing set
#3. run evaluate/evaluate to get score
# results will be in /hon/result.csv
HON :
  cd hon; python pyHON/main.py --data hon_training_1000.txt;
  cd hon; python evaluation/hon-pagerank.py --data hon_training_1000.txt --test hon_testing_1000.txt
  cd hon; mkdir results; cp data/rank* results/; cd results; python ../evaluation/evaluation.py --size 35661 --path ./; mv result* ..
  

hypergraph :
  cd MESH; ./runRWR.sh
