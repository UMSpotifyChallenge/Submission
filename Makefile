data :
  cd db_adapter; bundle install; 
  cd db_adapter; cd confing; ln -s database_flux.yml database.yml;
  cd db_adapter; rails runner "Playlist.load_mod_json" &> log/load_mod_json.txt &
  cd db_adapter; rails runner "Track.request_spotify_api" &> log/request_spotify_api.txt &


RWR :
  cd RWR_baseline/dataProcess; python convertToOldFrmt.py 0.80; python makeEdgeLists.py;
  cd RWR_baseline/dataProcess/playlistSplit; cp ../songIDToSongNum.p .; python genTeleSets.py 0.50;
  cd RWR_baseline/dataProcess; ./base_RWR.sh; mv playlistSplit/pred_sets .; mv playlistSplit/tele_sets .; python evalRWR.py 35661

#1. run pyHON/main to generate HON you need to provide playlist-list. you can leave other params as defaults (edited)
#2. run evaluate/pagerank to get personalized pagerank you will find inputs to run in the code: generated HON, and testing set
#3. run evaluate/evaluate to get score
# results will be in /hon/result.csv
HON :
  cd hon; python pyHON/main.py --data hon_training_1000.txt;
  cd hon; python evaluation/hon-pagerank.py --data hon_training_1000.txt --test hon_testing_1000.txt
  cd hon; mkdir results; cp data/rank* results/; cd results; python ../evaluation/evaluation.py --size 35661 --path ./; mv result* ..

RWR :
  cd RWR_baseline/dataProcess; python convertToOldFrmt.py 0.80; python makeEdgeLists.py;
  cd RWR_baseline/dataProcess/playlistSplit; cp ../songIDToSongNum.p .; python genTeleSets.py 0.50;
  cd RWR_baseline/dataProcess; ./base_RWR.sh

HON :
  cd hon; python pyHON/main.py --data hon_training_10000.txt
  cd hon; python evaluation/hon-pagerank.py --data hon_training_10000.txt --test hon_testing_10000.txt

hypergraph :
  cd MESH; ./runRWR.sh
