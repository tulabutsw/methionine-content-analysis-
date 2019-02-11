# Code_for_methionine_content_analysis
This Matlab script is used to perform the methionine content analysis described in Yang et al. Cell 2019.

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

# image_segmentation_and_stats.m
This MATLAB script is used for the image processing described in Yang et al. Cell 2019.  

## Method
The script takes as an input a fluorescence channel image that has Pbp1-GFP expressed in the cytoplasm. First, it segments the cell cytoplasm by global intensity thresholding using Otsu’s method. Next, it returns the mean, standard deviation and coefficient of variation of the pixel intensities that make up the cytoplasm.

## Requirements
The code is implemented in MATLAB 2018a. It is not tested on earlier versions of MATLAB. 
Image Processing Toolbox is required.

## Usage
Run under the folder containing the script and the two example images. The default script runs with the first example image. To run the second example image, comment out line 20, and uncomment line 22.  

If you have questions or problems, please do not hesitate and contact us at Benjamin.Tu@UTSouthwestern.edu . We will be glad to help.
