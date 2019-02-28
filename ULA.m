%% K-Means Clustering
%
%  Safoura Moeeni
%  ------------
%
%  June 18, 2018
%

%% Initialization
clear ; close all; clc
%% ================= Part 1: Find Closest Centroids ====================
% %  I have divided the learning algorithm 
% %  into two functions -- findClosestCentroids and computeCentroids. 
% %
% fprintf('Finding closest centroids.\n\n');
% 
% % Load an example dataset that we will be using
% X=load('JMP_ILFS_ML1980.out');
% 
% % Select an initial set of centroids
% K = 5; % 3 Centroids
% %initial_centroids = [15 0; 40 48; 54 0];
% initial_centroids = X([50000 100000 150000 200000 300000], [1:8]) ;
% 
% 
% % Find the closest centroids for the examples using the
% % initial_centroids
% idx = findClosestCentroids(X, initial_centroids);
% 
% fprintf('Closest centroids for the first 3 examples: \n')
% fprintf(' %d', idx(1:3));
% fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;

% %% ===================== Part 2: Compute Means =========================
% %  After implementing the closest centroids function, you should now
% %  complete the computeCentroids function.
% %
% fprintf('\nComputing centroids means.\n\n');
% 
% %  Compute means based on the closest centroids found in the previous part.
% centroids = computeCentroids(X, idx, K);
% 
% fprintf('Centroids computed after initial finding of closest centroids: \n')
% fprintf(' %f %f %f %f %f %f %f %f \n' , centroids');
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;

%% =================== Part 3: K-Means Clustering      ======================
%   run the K-Means algorithm on the dataset
%
clear ; close all; clc
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
Data= load('12JMP_ILFS_ML1980.out');
%Number of features: columns of X
No_features=size(Data, 2);
% first column is Personal ID (Pkey)
X=Data(:, [2:No_features]);
max_iters = 50;
max_K=10;
JF=zeros(max_iters,max_K);
%Elbow Method
for K=1:max_K
    fprintf('K-Means for K=%d...\n', K);
    randidx = randperm(size(X, 1));
    initial_centroids = X(randidx(1:K), :);
    [centroids, idx, Jfunction] = runkMeans(X, initial_centroids, max_iters, true);
    JF(:,K)=Jfunction;
end    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings for running K-Means
clear ; close all; clc
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
Data= load('12JMP_ILFS_ML1980.out');
No_features=size(Data, 2);
X=Data(:, [2:No_features]);
K = 4; % from Elbow Method
max_iters = 100;

% For consistency, here I set centroids 
% (1) to specific values:
%initial_centroids = X([150000], [1:8]) ;
%initial_centroids = X([50000 150000], [1:8]) ;
%initial_centroids = X([50000 100000 150000], [1:8]) ;
initial_centroids = X([50000 100000 150000 200000], [1:No_features-1]) ;
%initial_centroids = X([50000 100000 150000 200000 300000], [1:No_features]) ;
%initial_centroids = X([50000 100000 150000 200000 300000 350000], [1:8]) ;
%initial_centroids = X([50000 100000 150000 200000 250000 300000 350000], [1:8]) ;

% % (2) random values: Initialize the centroids to be random examples
% % Randomly reorder the indices of examples
% randidx = randperm(size(X, 1));
% % Take the first K examples as centroids
% initial_centroids = X(randidx(1:K), :);


% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx, Jfunction] = runkMeans(X, initial_centroids, max_iters, true);
%save 32idx_1980.mat idx
newdata = [Data,idx];
save 32_idx_1980_2Fs.mat  newdata
csvwrite('32 idx_1980_2Fs.csv',newdata);
fprintf('\nK-Means Done.\n\n');

%% ===================             Cohort 1986          ======================
%% =================== Part 3: K-Means Clustering      ======================
%   run the K-Means algorithm on the dataset
%
clear ; close all; clc
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
Data= load('12JMP_ILFS_ML1986.out');
%Number of features: columns of X
No_features=size(Data, 2);
% first column is Personal ID (Pkey)
X=Data(:, [2:No_features]);
max_iters = 50;
max_K=10;
JF=zeros(max_iters,max_K);
%Elbow Method
for K=1:max_K
    fprintf('K-Means for K=%d...\n', K);
    randidx = randperm(size(X, 1));
    initial_centroids = X(randidx(1:K), :);
    [centroids, idx, Jfunction] = runkMeans(X, initial_centroids, max_iters, true);
    JF(:,K)=Jfunction;
end    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings for running K-Means
clear ; close all; clc
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
Data= load('12JMP_ILFS_ML1986.out');
No_features=size(Data, 2);
X=Data(:, [2:No_features]);
K = 3; % from Elbow Method
max_iters = 100;

% For consistency, here I set centroids 
% (1) to specific values:
%initial_centroids = X([150000], [1:8]) ;
%initial_centroids = X([50000 150000], [1:8]) ;
%initial_centroids = X([50000 100000 150000], [1:8]) ;
initial_centroids = X([50000 300000 400000], [1:No_features-1]) ;
%initial_centroids = X([50000 100000 150000 200000 300000], [1:No_features]) ;
%initial_centroids = X([50000 100000 150000 200000 300000 350000], [1:8]) ;
%initial_centroids = X([50000 100000 150000 200000 250000 300000 350000], [1:8]) ;

% % (2) random values: Initialize the centroids to be random examples
% % Randomly reorder the indices of examples
% randidx = randperm(size(X, 1));
% % Take the first K examples as centroids
% initial_centroids = X(randidx(1:K), :);


% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx, Jfunction] = runkMeans(X, initial_centroids, max_iters, true);
%save 32idx_1980.mat idx
newdata = [Data,idx];
save 32_idx_1986_2Fs.mat  newdata
csvwrite('32 idx_1986_2Fs.csv',newdata);
fprintf('\nK-Means Done.\n\n');



