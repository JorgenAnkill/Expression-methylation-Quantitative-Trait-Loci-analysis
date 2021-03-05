# Epigenetic alterations at distal enhancers are linked to proliferation in human breast cancer


*Jørgen Ankill, Miriam Ragle Aure, Sunniva Bjørklund, Severin Langberg, OSBREAC, Xavier Tekpli, Valeria Vitelli, Vessela N. Kristensen, Thomas Fleischer*

Contact: jorgen.ankill2@rr-research.no 
#
**Descrption:**

This repository contains a simplified script that may be used for genom-wide expression-methylation Quantitative Trait Loci analysis (emQTL) related to the manuscript above and example data for running the code. In the first part of the code, the DNA methylation levels of all CpGs with an interquartile range more than 0.1 and genes with non-zero variance are correlated by Pearson correlation. The inverse correlation coefficient values (correlation coefficient*-1) are then biclustered by spectral co-clustering[1]. The Python code necessary for the biclustering is included in the Spectral co-clustering folder. For each run, a average mean square residue (MSR) score[2] is imputed to provide an estimate of the number of biclusters to select for the spectral co-clustering algorithm. The output from the code is a heatmap marked with the biclusters identifed and files showing the list of CpGs and genes in each bicluster.

The example data provided includes DNA methylation- and expression data for 20.000 randomly selected CpGs and 5000 genes is obtained from the XenaBrowser using the UCSCXenaTools R-package[3] version 1.4.0. A total of 100 random primary breast tumor samples with matching DNA methylation- (HumanMethylation450) and expression data (HiSeqV2) is extracted from the The Cancer Genome Atlas breast cancer (TCGA-BRCA) dataset[4].
#
**References:**

1. Pedregosa, F. et al. Scikit-learn: Machine Learningin Python. J. Mach. Learn. Res. 12, 2825-2830 (2011).
2. Cheng, Y. & Church, G.M. Biclustering of expression data. Proc Int Conf Intell Syst Mol Biol 8, 93-103 (2000).
3. Goldman, Mary, et al. "The UCSC Xena Platform for cancer genomics data visualization and interpretation." BioRxiv (2019): 326470.
4. Comprehensive molecular portraits of human breast tumors. Nature 490, 61-70 (2012).
