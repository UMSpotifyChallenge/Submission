# Submission

EECS 598 Project
Members: Drew Davis, Jungho Bang, Siddharth Venkatesan

Our project explores different methods for Automatic Playlist Continuation. Specifically, we expirement with RWR, HON, and hypergraphs. This submission directory contains all of the code we wrote, modified, cloned, and/or used to complete this project.

The git repo for this project can be seen at https://github.com/UMSpotifyChallenge/Submission.

## makefile

The makefile can be used to test parts of the code. Considering the complex and multi-purpose nature of the code structure, not every line of code will be run through the makefile. Full excerising of the code would be undesirable anyway, as it would take days/weeks to finish the makefile.

There are 4 make commands available

- data

- RWR
  - Must be on hadoop servers
  - This will run RWR on the random 1000 playlist set. Results will be in /RWR_baseline directory.
- HON
  - This will run HON on the random 1000 playlist set. Results will be in /hon directory.
- hypergraph
  - Must be on flux servers
  - This will run hypergraph on the random 1000 playlist set. Results will be in /spotify_hypergraph_playlist directory.


## Hierarchy
- Data (/DatabaseAdapter, /SpotifySynthesis, /hadoop_playlist_statistics)
  - SpotifySynthesis contains all of the files needed to generate the synthetic data used in the project.
  - DatabaseAdapter contains all of the files needed to orginize the Million Playlist Dataset, load and store track audio features, and prepare data for the RWR, HON, and hypergraph learning methods.
  - hadoop_playlist_statistics contains all of the files needed to calculate statistical information about the Million Playlist Dataset.

- Homogeneous RWR (/RWR_baseline)
  - This directory contains all of the files needed to run RWR on the playlist data provided by DatabaseAdapter.
  - The RWR is performed by PEGASUS hadoop package provided by CMU (http://www.cs.cmu.edu/~pegasus/).
  - All code for pre-processing data and evaluating results was created by the team.

- HON (/hon)
  - This directory contains all of the files needed to perform HON/PageRank analysis on the playlist data provided by DatabaseAdapter.
  - The HON structure is built using the code published by Notre Dame (https://github.com/xyjprc/hon).
  - The PageRank analysis is performed by the NetworkX package (https://networkx.github.io/).
  - The HON use of the NetworkX PageRank code was mdoified to handle biased PageRank analysis.
  - All code for pre-processing data and evaluating results was created by the team.
  
- Hypergraph RWR (/mesh_hypergraph)
  - This directory contains all of the files needed to construct a hypergraph from the data provided by DatabaseAdapter and perform a modified RWR on it.
  - The Hypergraph structure is built using modified code (MESH) pubslished by the University of Minnesota (http://mesh.cs.umn.edu/).
  - The RWR code had to be modifed and added to the MESH code to perform a logical random walk on hypergraphs.
  - All code for pre-processing data and evaluating results was created by the team.
