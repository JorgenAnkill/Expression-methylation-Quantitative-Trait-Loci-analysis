# Epigenetic alterations at distal enhancers are linked to proliferation in human breast cancer

Jørgen Ankill, Miriam Ragle Aure, Sunniva Bjørklund, Severin Langberg, OSBREAC, Xavier Tekpli, Valeria Vitelli, Vessela N. Kristensen, Thomas Fleischer.

Contact email adress: jorgen.ankill2@rr-research.no

This repository contains the script used for genome-wide expression methylation Quantitative Trait Loci analysis (emQTL) in the manuscript refered to above and example data for running the code. This is a simplified code that may be used to perform emQTL analysis in the example dataset.

DNA methyaltion-, expression- and clinical example data is first obtained by from XenaBrowser using the UCSCXenaTools R-package version 1.4.0. DNA methylation- and expression data first obtained from 100 primary tumor samples. The DNA methylation levels of all CpGs with an interquartile range more than 0.1 and genes with non-zero variance are correlated by Pearson correlation. All the significant CpG-gene associations (emQTLs) are then validated in 100 other random samples from the same dataset in TCGA. In the manuscript, validation was performed in two independent breast cancer cohorts (OSL2 and TCGA). The inverse correlation coefficient values (correlation coefficient*-1) are then biclustered by spectral co-clustering. The Python code necessary for the biclustering is included in the Spectral co-clustering folder. 

