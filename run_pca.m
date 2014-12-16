clear all;
load('data.mat');

%load the image data and form the matrix for training PCA
Data = [];
[m,n] = size(X_train);
[s,t] = size(X_test);
x = 500; %number of PCs
for i = 1:m
    Data = [Data; double(X_train(i,:))];  
end
for i = 1:s
    Data = [Data; double(X_test(i,:))];  
end
[coeff,score,latent,tsquared,explained,mu] = pca(Data);
train_reconstructimage=zeros([m,n]);
train_score=zeros([m,x]);
test_reconstructimage=zeros([s,t]);
test_score=zeros([s,x]);
for i=1:m
    %reconstruct the images 
    train_reconstructimage(i,:) = mu+(coeff(:,1:x)*score(i,1:x)')';
    train_score=score(i,1:x);
end
for i=1:s
    %reconstruct the images 
    test_reconstructimage(i,:) = mu+(coeff(:,1:x)*score(m+i,1:x)')';
    test_score=score(m+i,1:x);
end

save('train_score.mat','train_score');
save('test_score.mat','test_score');
save('re_train_1000.mat', 'train_reconstructimage');
save('re_test_100.mat', 'test_reconstructimage');