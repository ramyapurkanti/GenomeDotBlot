library(pafr)
library(ggplot2)
#dotPlotly doesnt give me much control over how I want the dotplot to look like so I installed pafr in R studio to read paf files. I will use dotplot function to plot
test_alignment <- "/Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_align_GRCz11_ABH_minimap2.paf"
ali <- read_paf(test_alignment)
#To label miR430 gene cluster
miR430 <- data.frame(chrom="chr4_GRCz11|NC_007115.7", start=28675391, end=28709600)
#To save as tiff file
tiff("/Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/Genome_DotBlot_GRCz11_ABH.tiff", units="in", width=5, height=5, res=300)
# insert ggplot code
dotplot(ali, order_by = c("qstart"), label_seqs = FALSE, dashes = TRUE, ordering = list(), alignment_colour = "black", xlab = "ABH", ylab = "GRCz11", line_size = 0.5) + theme_bw() + highlight_target(miR430,fill="yellow",colour="red")
dev.off()