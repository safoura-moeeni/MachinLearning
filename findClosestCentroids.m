function [idx, Jfun] = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

K = size(centroids, 1);

idx = zeros(size(X,1), 1);
Jfun=0;

m = size(X,1);

for i = 1:m
    distance_array = zeros(1,K);
    for j = 1:K
        distance_array(1,j) = sqrt(sum(power((X(i,:)-centroids(j,:)),2)));
    end
    [d, d_idx] = min(distance_array);
    Jfun= Jfun+ d;
    idx(i,1) = d_idx;
end


end

