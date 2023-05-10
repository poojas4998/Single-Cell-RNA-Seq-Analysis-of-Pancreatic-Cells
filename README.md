# Project Description

Repository contains files for BF528 Project 4 for Group 5. It contains R scripts used by the group members, output files, and the final report.

For the fourth project, we attempted to recreate the results of the study called, 'A Single-Cell Transcriptomic Map of the Human and Mouse Pancreas Reveals Inter- and Intra-cell Population Structure'. In this study, the authors analysed scRNAseq data of over 12,000 individual pancreatic cells from four human donors and two mouse strains to investigate the mammalian pancreatic transcriptome. For this project we downloaded and processed the data, clustered it using a UMAP and analysed cell types based on differentially expressed marker genes.

# Contributors

Group 5

Vrinda Jethalia - Data Curator (vrindajethalia799)

Manasa Rapuru - Programmer (manasarapuru)

Pragya Rawat - Analyst (rpragya17)

Pooja Savla - Biologist (poojas4998)


# Repository Contents

analyst_new.Rmd - contains script used by the analyst in this project to cluster and label cell types, identify markers, novel markers, and generate labeled UMAP (Fig3 in written report) and heatmaps (Fig4, Fig5 in written report).

barplot_script.R - contains script used by the programmer in this project to create the barplot (Fig6 in written report)

proj4_programmer.R - contains script used by the programmer to process the UMI counts matrix generated as a result of processing the data.

Data_Curator_Scripts - this directory contains the qsub files and R script developed by the data curator to obtain the UMI counts matrix. 

biologist.R - contains script used by the biologist to process the the clusters given by the analyst and run it through DAVID

BF528-Group-5-Project-4.pdf - final written report including all figures and results as well as a discussion of the results
