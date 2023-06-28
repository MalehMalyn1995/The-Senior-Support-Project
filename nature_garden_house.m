%The Senior Support Project

% 1. Imports data from an excel file for further analysis
[num,txt,raw] = xlsread('Senior_Support_Data.xlsx','Data');

% 2. Extracts the column headings
data_columns = txt(1,:);

% 3. Finds the number of observations in the dataset
num_observations = size(raw,1);

% 4. Extracts the data from the raw matrix
data = raw(2:num_observations,:);

% 5. Calculates the mean and variance of each variable
mean_data = mean(data);
var_data = var(data);

% 6. Computes the correlation matrix
corr_data = corrcoef(data);

% 7. Plots a histogram of the values for each variable
figure;
for i = 1:length(data_columns)
   subplot(length(data_columns),1,i);
   histogram(data(:,i));
   xlabel(data_columns{i});
   ylabel('Count');
end

% 8. Computes the z-score for each observation for each variable
z_score_data = zscore(data);

% 9. Plots the correlation matrix
figure;
imagesc(corr_data);
colorbar;

% 10. Separates the data into observations before and after a given date
date_idx = find(strcmp(data_columns,'Date'));
date_cutoff = '01/01/2000';
cutoff_idx = find(data(:,date_idx) > datetime(date_cutoff));
data_after_date = data(cutoff_idx,:);

% 11. Imports the data into a database
dbconn = database('Senior_Support_DB','root','password');
datainsert(dbconn,'seniorsupport','data',data);

% 12. Computes the linear regression coefficients for each variable
coef_data = zeros(length(data_columns),1);
for i = 1:length(data_columns)
   coef_data(i) = regress(data(:,i),[ones(num_observations,1) data(:,1:end-1)]);
end

% 13. Collects the data from the database and displays it
data_db = fetch(dbconn,'SELECT * FROM seniorsupport');
disp(data_db);

% 14. Calculates the covariance matrices for each variable
cov_data = cov(data);

% 15. Uses the linear regression coefficients to predict the values of each
% variable
pred_data = [ones(num_observations,1) data]*coef_data;

% 16. Calculates the Pearson correlation coefficient between each pair of
% variables
pearson_data = corr(data);

% 17. Computes the chi-square statistic for each variable
chi_data = zeros(length(data_columns),1);
for i = 1:length(data_columns)
   chi_data(i) = chi2gof(data(:,i));
end

% 18. Plots a scatter plot matrix of the data
figure;
scatterplotmatrix(data);

% 19. Performs a principal component analysis on the data
[pc_data,score_data,latent_data] = pca(data);

% 20. Creates a contour plot of the principal components
figure;
contour(score_data(1,:),score_data(2,:),score_data(3,:));
xlabel('PCA 1');
ylabel('PCA 2');
zlabel('PCA 3');