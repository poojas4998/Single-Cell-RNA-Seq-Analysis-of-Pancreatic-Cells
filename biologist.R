setwd("/projectnb/bf528/users/group_5/project_4/biologist/")


#iterate this code and make it shorter ##project 4 Biologist Role

library("tidyverse")

#Load clusters data
#marker_genes <- read.csv(file="GSM2230760_marker_genes.csv")
marker_genes <- read.csv(file="novel_marker_proj4.csv")

# 
# clsuter 0 - "Delta", 
# cluster 1- "Mesenchymal1",
# cluster 2 -  "A", 
# cluster 3 - "Ductal1", 
# cluster 4- "Beta1", 
# cluster 5 - "Alpha", 
# cluster 6 - "Ductal2", 
# cluster 7 -"Mesenchymal2", 
# cluster 8 - "Acinar", 
# cluster 9 - "Ductal3", 
# cluster 10 -"Gamma", 
# cluster 11 - "Beta2", 
# cluster 12 - "Endothelial", 
# cluster 13 - "Mast"

#Store  DEGs for each cluster
# c0 <- filter(marker_genes, marker_genes$cluster == 0)
# c1 <- filter(marker_genes, marker_genes$cluster == 1)
# c2 <- filter(marker_genes, marker_genes$cluster == 2)
# c3 <- filter(marker_genes, marker_genes$cluster == 3)
# c4 <- filter(marker_genes, marker_genes$cluster == 4)
# c5 <- filter(marker_genes, marker_genes$cluster == 5)
# c6 <- filter(marker_genes, marker_genes$cluster == 6)
# c7 <- filter(marker_genes, marker_genes$cluster == 7)
# c8 <- filter(marker_genes, marker_genes$cluster == 8)
# c9 <- filter(marker_genes, marker_genes$cluster == 9)
# c10 <- filter(marker_genes, marker_genes$cluster == 10)
# c11<- filter(marker_genes, marker_genes$cluster == 11)
# c12 <- filter(marker_genes, marker_genes$cluster == 12)

c0 <- filter(marker_genes, marker_genes$cluster == "Delta")
c1 <- filter(marker_genes, marker_genes$cluster == "Mesenchymal1")
c2 <- filter(marker_genes, marker_genes$cluster == "A")
c3 <- filter(marker_genes, marker_genes$cluster == "Ductal1")
c4 <- filter(marker_genes, marker_genes$cluster == "Beta1")
c5 <- filter(marker_genes, marker_genes$cluster == "Alpha")
c6 <- filter(marker_genes, marker_genes$cluster == "Ductal2")
c7 <- filter(marker_genes, marker_genes$cluster == "Mesenchymal2")
c8 <- filter(marker_genes, marker_genes$cluster == "Acinar")
c9 <- filter(marker_genes, marker_genes$cluster == "Ductal3")
c10 <- filter(marker_genes, marker_genes$cluster == "Gamma")
c11<- filter(marker_genes, marker_genes$cluster == "Beta2")
c12 <- filter(marker_genes, marker_genes$cluster == "Endothelial")
c13 <- filter(marker_genes, marker_genes$cluster == "Mast")

# #Filter DEGs with a logFC greater than 0 and adjusted p-value less than 0.05
# c0_DEGs <- filter(c0, avg_logFC > 0 & p_val_adj< 0.05)
# c1_DEGs <- filter(c1, avg_logFC > 0 & p_val_adj < 0.05)
# c2_DEGs <- filter(c2, avg_logFC > 0 & p_val_adj < 0.05)
# c3_DEGs <- filter(c3, avg_logFC > 0 & p_val_adj < 0.05)
# c4_DEGs <- filter(c4, avg_logFC > 0 & p_val_adj < 0.05)
# c5_DEGs <- filter(c5, avg_logFC > 0 & p_val_adj < 0.05)
# c6_DEGs <- filter(c6, avg_logFC > 0 & p_val_adj < 0.05)
# c7_DEGs <- filter(c7, avg_logFC > 0 & p_val_adj < 0.05)
# c8_DEGs <- filter(c8, avg_logFC > 0 & p_val_adj < 0.05)
# c9_DEGs <- filter(c9, avg_logFC > 0 & p_val_adj < 0.05)
# c10_DEGs <- filter(c10, avg_logFC > 0 & p_val_adj < 0.05)
# c11_DEGs <- filter(c11, avg_logFC > 0 & p_val_adj < 0.05)
# c12_DEGs <- filter(c12, avg_logFC > 0 & p_val_adj < 0.05)


c0_DEGs <- filter(c0, avg_log2FC > 0 & p_val_adj< 0.05)
c1_DEGs <- filter(c1, avg_log2FC > 0 & p_val_adj < 0.05)
c2_DEGs <- filter(c2, avg_log2FC > 0 & p_val_adj < 0.05)
c3_DEGs <- filter(c3, avg_log2FC > 0 & p_val_adj < 0.05)
c4_DEGs <- filter(c4, avg_log2FC > 0 & p_val_adj < 0.05)
c5_DEGs <- filter(c5, avg_log2FC > 0 & p_val_adj < 0.05)
c6_DEGs <- filter(c6, avg_log2FC > 0 & p_val_adj < 0.05)
c7_DEGs <- filter(c7, avg_log2FC > 0 & p_val_adj < 0.05)
c8_DEGs <- filter(c8, avg_log2FC > 0 & p_val_adj < 0.05)
c9_DEGs <- filter(c9, avg_log2FC > 0 & p_val_adj < 0.05)
c10_DEGs <- filter(c10, avg_log2FC > 0 & p_val_adj < 0.05)
c11_DEGs <- filter(c11, avg_log2FC > 0 & p_val_adj < 0.05)
c12_DEGs <- filter(c12, avg_log2FC > 0 & p_val_adj < 0.05)
c13_DEGs <- filter(c13, avg_log2FC > 0 & p_val_adj < 0.05)

#Write gene list to txt files
writeLines(c0$gene,paste("genelistc",0,".txt",sep=''),sep='\n')
writeLines(c1$gene,paste("genelistc",1,".txt",sep=''),sep='\n')
writeLines(c2$gene,paste("genelistc",2,".txt",sep=''),sep='\n')
writeLines(c3$gene,paste("genelistc",3,".txt",sep=''),sep='\n')
writeLines(c4$gene,paste("genelistc",4,".txt",sep=''),sep='\n')
writeLines(c5$gene,paste("genelistc",5,".txt",sep=''),sep='\n')
writeLines(c6$gene,paste("genelistc",6,".txt",sep=''),sep='\n')
writeLines(c7$gene,paste("genelistc",7,".txt",sep=''),sep='\n')
writeLines(c8$gene,paste("genelistc",8,".txt",sep=''),sep='\n')
writeLines(c9$gene,paste("genelistc",9,".txt",sep=''),sep='\n')
writeLines(c10$gene,paste("genelistc",10,".txt",sep=''),sep='\n')
writeLines(c11$gene,paste("genelistc",11,".txt",sep=''),sep='\n')
writeLines(c12$gene,paste("genelistc",12,".txt",sep=''),sep='\n')
writeLines(c13$gene,paste("genelistc",13,".txt",sep=''),sep='\n')


writeLines(c0_DEGs$gene,paste("genelist",0,".txt",sep=''),sep='\n')
writeLines(c1_DEGs$gene,paste("genelist",1,".txt",sep=''),sep='\n')
writeLines(c2_DEGs$gene,paste("genelist",2,".txt",sep=''),sep='\n')
writeLines(c3_DEGs$gene,paste("genelist",3,".txt",sep=''),sep='\n')
writeLines(c4_DEGs$gene,paste("genelist",4,".txt",sep=''),sep='\n')
writeLines(c5_DEGs$gene,paste("genelist",5,".txt",sep=''),sep='\n')
writeLines(c6_DEGs$gene,paste("genelist",6,".txt",sep=''),sep='\n')
writeLines(c7_DEGs$gene,paste("genelist",7,".txt",sep=''),sep='\n')
writeLines(c8_DEGs$gene,paste("genelist",8,".txt",sep=''),sep='\n')
writeLines(c9_DEGs$gene,paste("genelist",9,".txt",sep=''),sep='\n')
writeLines(c10_DEGs$gene,paste("genelist",10,".txt",sep=''),sep='\n')
writeLines(c11_DEGs$gene,paste("genelist",11,".txt",sep=''),sep='\n')
writeLines(c12_DEGs$gene,paste("genelist",12,".txt",sep=''),sep='\n')
writeLines(c13_DEGs$gene,paste("genelist",13,".txt",sep=''),sep='\n')



