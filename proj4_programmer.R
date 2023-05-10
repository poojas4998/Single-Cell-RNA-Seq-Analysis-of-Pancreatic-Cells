library(Seurat)
library(tximport)
library(eds)
library(biomaRt)
library(tibble)
library(dplyr)

#load data file
data <- file.path("/projectnb/bf528/users/group_5/project_4/data_curator/salmon_output/alevin/quants_mat.gz")
file.exists(data)
#use txi to import data
txi <- tximport(data, type="alevin")

#to rid of version number in row name of ensembl id
remove_ids <- gsub("\\..*", "", rownames(txi$counts))


id_name <- "hgnc_symbol"
table <- tibble(remove_ids)


listEnsembl()
listMarts()
ensembl_name <- useEnsembl(biomart = "genes")
dat <- listDatasets(ensembl_name)
ensembl_name <- useMart("ensembl", dat = "hsapiens_gene_ensembl")
look_up <- getBM(attributes = c("ensembl_gene_id", id_name),
                 filters = "ensembl_gene_id",
                 values = remove_ids,
                 mart = ensembl_name)
#renames column
colnames(look_up)[1] ="remove_ids"



# merges to match ensembl id number to gene name
merged_table <- merge(table, look_up, by.x = "remove_ids", by.y = "remove_ids", sort = FALSE)
merged_table$hgnc_symbol[is.na(merged_table$hgnc_symbol)] <- merged_table$remove_ids
merged_table <-merged_table[!(merged_table$hgnc_symbol==""), ]


#removing blanks
rownames(txi$counts) <- merged_table$hgnc_symbol[match(txi_remove_ids, merged_table$remove_ids)]
txi$counts<-txi$counts[!is.na(rownames(txi$counts)),] 

#Take counts data matrix and creates Seurat object,
pan_data <- CreateSeuratObject(counts = txi$counts, min.cells = 3, min.features = 200)

#Remove lowquality
pan_data <- subset(pan_data, subset = nFeature_RNA < 5000)

#Normalize
pan_data <- NormalizeData(pan_data, normalization.method = "LogNormalize", scale.factor = 10000)

#Filter for high variation
pan_data <- FindVariableFeatures(pan_data, selection.method = "vst", nfeatures = 2000)

all.genes <- rownames(pan_data)

#Scales data
pan_data <- ScaleData(pan_data, features = all.genes)

#Creates PCA plot
pan_data <- RunPCA(pan_data, features = VariableFeatures(object = pan_data))

#Performs clustering
pan_data <- FindNeighbors(pan_data, dims = 1:10)
pan_data <- FindClusters(pan_data, resolution = 0.5)

#Generates umap
pan_data <- RunUMAP(pan_data, dims = 1:10)
DimPlot(pan_data, reduction = "umap")