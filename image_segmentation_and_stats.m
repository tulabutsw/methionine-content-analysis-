%
%%%%%%%%%%%%%%%%%%%%%   segmentation_and_stats.m   %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Objective: determining the cell cytoplasm and calculating the mean,
% standard deviation, and the coefficient of variation of the
% pixel intensities.
%--------------------------------------------------------------------------
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY.
%--------------------------------------------------------------------------
% For feedback and questions please contact us at:
% nezgiwood@gmail.com
% Benjamin.Tu@UTSouthwestern.edu
%--------------------------------------------------------------------------
%This script takes as input a fluorescent channel image, segments the image to determine the cell cytoplasm and returns the basic statistics of
%the pixel intensities that make up the cell cytoplasm.

clearvars; close all; clc
%##Read the image.##
%Example Image 1
I=imread('Image1_SD.tif');  I=double(I);
%Example Image 2
%I=imread('Image2_SL.tif');  I=double(I);

%##Segmentation of the cell cytoplasm by global intensity thresholding using Otsu's method##
I_sc=((I-min(I(:)))./(max(I(:))-min(I(:)))).*255; %scaled image
Ithr=imbinarize(uint8(I_sc)); %thresholded black-white image. imbinarize function uses Otsu's method.
Ithr=bwareaopen(Ithr,25); %Remove connected components that are less than 25 pixels.
Ithr=imclose(Ithr,ones(5,5)); %Apply morphological closing to close the gaps, if any.

%##Labeled image: Individual cells are labeled so that they can be processed separately.##
IL=bwlabel(Ithr); %labeled image
number_of_cells=max(IL(:)); %Maximum of the labeled image will give the number of cells the image has.
cell_labels=1:number_of_cells;
Stats=zeros(number_of_cells,3); %initialize the Stats matrix. This matrix will hold the mean, standard deviation and the coefficient of variation of the pixel intensities.
for j=cell_labels %Go over the cells one-by-one. 
    current_cell=I(IL==j);
    %##Statistics##
    Stats(j,:)=[mean(current_cell) std(current_cell) std(current_cell)/mean(current_cell)];
end

clc
fprintf('mean STD CV \n') %Mean Intensity, Standard Deviation, Coefficient of Variation
disp(Stats)

