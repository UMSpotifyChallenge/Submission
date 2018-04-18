# Submission

EECS 598 Project
Members: Drew Davis, Jungho Bang, Siddharth Venkatesan

Our project explores different methods for Automatic Playlist Continuation. Specifically, we expirement with RWR, HON, and hypergraphs. This submission directory contains all of the code we wrote, modified, cloned, and/or used to complete this project.

The git repo for this project can be seen at https://github.com/UMSpotifyChallenge/Submission.

## makefile

The makefile can be used to test parts of the code. Considering the complex and multi-purpose nature of the code structure, not every line of code will be run through the makefile. Full excerising of the code would be undesirable anyway, as it would take days/weeks to finish the makefile.


## Hierarchy
- Data (/DatabaseAdapter, /SpotifySynthesis, /hadoop_playlist_statistics)

- Homogeneous RWR (/RWR_baseline)
  - This directory contains all of the files needed to run RWR on the playlist data provided.
  - The RWR is performed by PEGASUS hadoop package provided by CMU (http://www.cs.cmu.edu/~pegasus/).
  - All code for pre-processing data and evaluating results was created by the team.

- HON (/hon)
  - This directory contains all of the files needed to perform HON/PageRank analysis on the playlist data provided.
  - The HON structure is built using the code published by Notre Dame (https://github.com/xyjprc/hon).
  - The PageRank analysis is performed by the NetworkX package (https://networkx.github.io/).
  - The HON use of the NetworkX PageRank code was mdoified to handle biased PageRank analysis.
  - All code for pre-processing data and evaluating results was created by the team.
  
- Hypergraph RWR (/mesh_hypergraph)
