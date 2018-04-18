data :
  cd db_adapter; bundle install; 
  cd db_adapter; cd confing; ln -s database_flux.yml database.yml;
  cd db_adapter; rails runner "Playlist.load_mod_json" &> log/load_mod_json.txt &
  cd db_adapter; rails runner "Track.request_spotify_api" &> log/request_spotify_api.txt &
  
RWR_1000_getdata :
  

RWR : RWR_1000_getdata
  cd RWR_baseline/dataProcess; python convertToOldFrmt.py 0.80; python makeEdgeLists.py;
  cd RWR_baseline/dataProcess/playlistSplit; cp ../songIDToSongNum.p .; python genTeleSets.py 0.50;
  cd RWR_baseline/dataProcess; ./base_RWR.sh

HON :
  cd hon; python pyHON/main.py --data hon_training_10000.txt
  cd hon; python evaluation/hon-pagerank.py --data hon_training_10000.txt --test hon_testing_10000.txt

hypergraph :
  cd MESH; ./runRWR.sh
