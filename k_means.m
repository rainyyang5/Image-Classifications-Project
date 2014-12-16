
function [clusterCenters, clusterBelonging] = k_means(data, k, startPoints)
[m,n] = size(data);
if nargin < 3
    randIndex = randperm(m);
    startPoints = data(randIndex(1:k),:);
end
tmp = zeros(m,1);
clusterCentroid = startPoints;
while  1
    distMatrix = zeros(m,k);
    distMatrix = pdist2(data,clusterCentroid);
    [minDistance, indexInRow] = min(distMatrix, [], 2);
    %find the closest cluster center for each data point
    %stop the loop if clustering current clustering is optimal
    if indexInRow==tmp
        break;
    else
        tmp = indexInRow;
    end
    %re-determine the centroid in each cluster
    for i=1:k
        clusterCentroid(i,:)=mean(data(find(indexInRow==i),:),1);
    end
end
clusterCenters = clusterCentroid;
clusterBelonging = indexInRow;

end