# methionine-content-analysis-
The Matlab script documents the methionine content analysis for Yu et al. Cell 2019.

## Method
To estimate the significance of the enrichment of methionine in the C-terminal low complexity region (150
a.a.) of Pbp1, we counted the number of methionines in all possible windows of 150 amino acids of all
protein sequences in the genome of S. cerevisiae. A total of 5917 protein sequences obtained from the
Saccharomyces Genome Database were analyzed:
(https://downloads.yeastgenome.org/sequence/S288C_reference/orf_protein/orf_trans.fasta.gz, 13-
Jan-2015 12:21). 
Each protein sequence was analyzed using a sliding window of a length of 150 amino
acids. Therefore, a given protein sequence of X amino acids will give (X–150+1) windows. Proteins that
are shorter than 150 amino acids were treated as one window. The number of methionines in each
window was counted, which serves as the null distribution of methionine enrichment. The significance (pvalue) of the observed methionine enrichment of in the C-terminal low complexity region of Pbp1 was
evaluated by the percentage of windows in the null distribution that contains more methionine than the
observed one in the C-terminal low complexity region of Pbp1.

## Usage
Run under the folder containing the script and orf_trans.fasta.
