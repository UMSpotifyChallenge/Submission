data :
  
RWR_1000_getdata :
  

RWR : RWR_1000_getdata
  cd RWR_baseline/dataProcess; python convertToOldFrmt.py 0.80; python makeEdgeLists.py;
  cd RWR_baseline/dataProcess/playlistSplit; cp ../songIDToSongNum.p .; python genTeleSets.py 0.50;
  cd RWR_baseline/dataProcess; ./base_RWR.sh
HON :

hypergraph :
  bash MESH/runRWR.sh
