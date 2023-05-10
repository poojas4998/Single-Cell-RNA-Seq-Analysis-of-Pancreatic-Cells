library(Seurat)
#Reads the seurat object
nw <-readRDS(file ="/projectnb/bf528/users/group_5/project_4/analyst/seurat_3.rds")
#gets data from cell types column
nw$CellType <- Idents(nw)
table(Idents(nw))
#calculates the proportion of cells in each cluster
counts <-prop.table(table(Idents(nw)))
#plots the proportion of cells in each cluster
barplot(counts,xlab="Cell Cluster Number",ylab= "Proportion of Cells in Cluster", ylim = c(0, 0.30))
