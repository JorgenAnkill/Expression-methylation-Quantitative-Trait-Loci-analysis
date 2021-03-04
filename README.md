# Epigenetic alterations at distal enhancers are linked to proliferation in human breast cancer

Jørgen Ankill, Miriam Ragle Aure, Sunniva Bjørklund, Severin Langberg, OSBREAC, Xavier Tekpli, Valeria Vitelli, Vessela N. Kristensen, Thomas Fleischer.

Contact email adress: jorgen.ankill2@rr-research.no

This repository contains the script used for genome-wide expression methylation Quantitative Trait Loci analysis (emQTL) in the manuscript refered to above and example data for running the code. This is just an example of how the emQTL analysis is performed in a simple example dataset. 

The DNA methylation levels of all CpGs with an interquartile range more than 0.1 are correlated with the expression levels of all genes. All the significant CpG-gene associations (emQTLs) are then validated in another dataset with different samples. The inverse correlation coefficient values (correlation coefficient*-1) are then biclustered by spectral co-clustering. The Python code necessary for the biclustering is included in the Spectral co-clustering folder. 

