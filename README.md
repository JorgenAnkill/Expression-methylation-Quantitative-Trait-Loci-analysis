# Epigenetic alterations at distal enhancers are linked to proliferation in human breast cancer

Jørgen Ankill, Miriam Ragle Aure, Sunniva Bjørklund, Severin Langberg, OSBREAC, Xavier Tekpli, Valeria Vitelli, Vessela N. Kristensen, Thomas Fleischer.

Contact email adress: jorgen.ankill2@rr-research.no

This repository contains a simplified script that may be used for genom-wide expression-methylation Quantitative Trait Loci analysis (emQTL) related to the manuscript above and example data for running the code. In the first part of the code, the DNA methylation levels of all CpGs with an interquartile range more than 0.1 and genes with non-zero variance are correlated by Pearson correlation. In the manuscript, validation was performed in two independent breast cancer cohorts (OSL2 and TCGA). The inverse correlation coefficient values (correlation coefficient*-1) are then biclustered by spectral co-clustering[1]. The Python code necessary for the biclustering is included in the Spectral co-clustering folder. 

DNA methyaltion-, expression- and clinical example data is first obtained by from XenaBrowser using the UCSCXenaTools R-package version 1.4.0. In the example data, 100 random samples with matching DNA methylation- and expression data was obtained from 100 primary breast tumor samples.  

References:
1. Pedregosa, F. et al. Scikit-learn: Machine Learningin Python. J. Mach. Learn. Res. 12, 2825-2830 (2011).



Goldman, Mary, et al. "The UCSC Xena Platform for cancer genomics data visualization and interpretation." BioRxiv (2019): 326470.
