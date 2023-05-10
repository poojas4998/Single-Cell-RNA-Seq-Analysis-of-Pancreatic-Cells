library(tidyverse)

#load the 3 barcode count files 
sample1_barcode_file <- read.table("SRR3879604_barcode_counts.txt", header=FALSE, col.names=c("Barcode", "Count"))
sample2_barcode_file <- read.table("SRR3879605_barcode_counts.txt", header=FALSE, col.names=c("Barcode", "Count"))
sample3_barcode_file <- read.table("SRR3879606_barcode_counts.txt", header=FALSE, col.names=c("Barcode", "Count"))

merged_df1 <- rbind(sample1_barcode_file, sample2_barcode_file)
grouped_df <- merged_df1 %>% group_by(Barcode) %>% summarise(Count_New = sum(Count))
grouped_df <- grouped_df %>% rename(Count = Count_New)

merged_final_df <- rbind(grouped_df, sample3_barcode_file)
grouped_final_df <- merged_final_df %>% group_by(Barcode) %>% summarise(Count_New = sum(Count))
grouped_final_df <- grouped_final_df %>% rename(Count = Count_New) #this has the counts of every barcode over the 3 samples

write.table(grouped_final_df, "grouped_barcodes.txt", sep = "\t", row.names = FALSE, col.names = FALSE)

#Plot the distribution to decide what to whitelist 
cdf <- ecdf(grouped_final_df$Count)
plot(cdf, main="Cumulative Distribution of Barcode Counts", xlab="Barcode Count", ylab="Cumulative Proportion")
plot(cdf, main="Cumulative Distribution of Barcode Counts", xlab="Barcode Count", ylab="Cumulative Proportion", xlim=c(0, 10000), xticks=seq(0, 10000, 1000))
#plot focused only on the region of inflection
plot(cdf, main="Cumulative Distribution of Barcode Counts", xlab="Barcode Count", ylab="Cumulative Proportion", xlim=c(0, 1000)) 

#trying the same using ggplot
ggplot(grouped_final_df, aes(x=Count)) + stat_ecdf() + scale_x_log10() + ggtitle("Cumulative Distribution of Barcode Counts") + xlab("Barcode Count") + ylab("Cumulative Proportion")





