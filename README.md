# GenomeDotBlot
This reporsitory makes genome dot blots to compare the chr4 across three different zebrafish strains (AB, GrcZ11 and Tu).
# Step1 : RepeatMask genomes
Genomes contains loats repetitive elements such as transposable elements which can give false matches so they need to be masked first
```
./RepeatMasker -species "Danio rerio" -dir /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_ABH_RepeatMasker_out /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_ABH.fasta
./RepeatMasker -species "Danio rerio" -dir /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_GRCz11_RepeatMasker_out /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_GRCz11.fasta
./RepeatMasker -species "Danio rerio" -dir /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_TuH_RepeatMasker_out /Users/rpurkant/Work/Research/MPI-UNIL/GenomeDotBlots/chr4_TuH.fasta
```
Will get a file *.fa.masked which we use for mapping against one another.

# Step2: Pairwise Alignment
Align the masked genomes against one another using minimap2. Will get alignments in paf format
```
minimap2 -x asm5 -t 36 chr4_GRCz11_RepeatMasker_out/chr4_GRCz11.fasta.masked chr4_ABH_RepeatMasker_out/chr4_ABH.fasta.masked > chr4_align_GRCz11_ABH_minimap2.paf
minimap2 -x asm5 -t 36 chr4_GRCz11_RepeatMasker_out/chr4_GRCz11.fasta.masked chr4_TuH_RepeatMasker_out/chr4_TuH.fasta.masked > chr4_align_GRCz11_TuH_minimap2.paf
minimap2 -x asm5 -t 36 chr4_ABH_RepeatMasker_out/chr4_ABH.fasta.masked chr4_TuH_RepeatMasker_out/chr4_TuH.fasta.masked > chr4_align_ABH_TuH_minimap2.paf
```
# Step3: Visualize the pair-wise alignments

To visualize the pair-wise alignments, I first tried dotPlotly (online tool). However, dotPlotly doesnt give me much control over how I want the dotplot to look like so I installed pafr in R studio to read paf files. I will use dotplot function to plot.
```
MakeGenomeDotBlot.R
```
