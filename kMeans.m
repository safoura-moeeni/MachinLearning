function [centroids, idx, Jfunction] = runkMeans(X, initial_centroids, ...
                                      max_iters, plot_progress)
% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);
Jfunction=zeros(max_iters,1);


% Run K-Means
for i=1:max_iters
    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % For each example in X, assign it to the closest centroid
    [idx Jfun]= findClosestCentroids(X, centroids);
    Jfunction(i,1)= Jfun;
    previous_centroids = centroids;
    
    % Given the memberships, compute new centroids
    centroids = computeCentroids(X, idx, K);
end


end

