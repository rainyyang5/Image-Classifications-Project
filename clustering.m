clear all;
load('test_score.mat');
load('train_score.mat')

combine=[train_score;test_score];
[m,n]=size(train_score);
[s,t]=size(test_score);
X_train=zeros([m,n]);
X_test=zeros([s,t]);
for i=1:m
    [clusterCenters, clusterBelonging] = k_means(train_score(i,:)', 50);
    X_train(i,:)=clusterBelonging';
end
for i=1:s
    [clusterCenters, clusterBelonging] = k_means(test_score(i,:)', 50);
    X_test(i,:)=clusterBelonging';
end
save('k_50.mat','X_train','X_test');
