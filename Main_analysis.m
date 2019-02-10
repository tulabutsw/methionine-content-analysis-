%% Count frequency of a given amino acid in a window across all proteins, 2017.10.26
clearvars 
clc

%% Read in all protein sequences
data_file = 'orf_trans.fasta';

[Header, Sequence] = fastaread(data_file);
Header = string(Header(:));
Sequence = string(Sequence(:));
N = numel(Sequence);
pro_len = arrayfun(@strlength,Sequence);


%% Sliding window
win_sz = 150;
aa = 'M';

aa_freq = cell(numel(Sequence),1);

for i = 1:numel(aa_freq)
    L = strlength(Sequence(i));
    seq = char(Sequence(i));
    
    % build sliding window index
    idx = buffer(1:L,win_sz,win_sz-1)';
    to_remove = idx(:,1)==0;
    idx(to_remove,:) = [];
    
    if isempty(idx)
%         seq_buff = seq;
    else
        seq_buff = seq(idx);
    end
    is_aa = seq_buff == aa;
    aa_freq{i} = sum(is_aa,2);
end

%% Pull out short proteins
is_short = pro_len<win_sz;
figure,
histogram(cell2mat(aa_freq(is_short)))


%% Ask for significance
n_obs = 24;

aa_freq_pool = cell2mat(aa_freq);
% aa_freq_pool = cell2mat(aa_freq(~is_short));
figure,
histogram(aa_freq_pool)

hold on 
y = get(gca,'YLim');
plot([n_obs,n_obs],y,'r','linewidth',2)

p_val = mean(aa_freq_pool>n_obs);
title(['p-value: ' num2str(p_val,'%.2e')])
xlabel('#Met')

%% What are those proteins with higher frequency?
is_higher = cellfun(@(x) any(x>=n_obs),aa_freq);

high_header = Header(is_higher)
high_aa_freq = aa_freq(is_higher);

figure,
for i = 1:numel(high_aa_freq)
    subplot(numel(high_aa_freq),1,i)
    plot(high_aa_freq{i},'k','linewidth',2)
    
    gene_info = split(high_header{i});
    title(gene_info{2})
    ylabel('#Met')
    if i == numel(high_aa_freq)
        xlabel('Position (N->C)')
    end
end










%% Protein length statistics
figure,
subplot(1,2,1)
histogram(pro_len)

subplot(1,2,2)
boxplot(pro_len)
% [mean(pro_len), std(pro_len)]

win_sz = 150;
n_short = nnz(pro_len<win_sz);
disp([num2str(n_short) '(' num2str(n_short/N*100,'%.1f%%')...
      ') proteins are shorter than ' num2str(win_sz)])

%% 

n_M = count(Sequence,'M');
pct_M = n_M./pro_len;

tbl = table(Header,n_M,pct_M);


%% Find a specific protein (for exploration)
protein = 'PBP1';
is_match = contains(Header,protein);

Header(is_match)
Sequence(is_match)
pro_len(is_match)
strlength(Sequence(is_match)) % sanity check









