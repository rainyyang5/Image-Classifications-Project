
function [X_new]=convert2gray(X_rgb)
    count=size(X_rgb,1);
    X_new=zeros(count,2480);
    for i=1:count
        line=X_rgb(i,:);
        temp=reshape(line,[32,32,3]);
        %gray=rgb2gray(temp);
        %gline=reshape(gray,[1,1024]);
        hog = vl_hog(im2single(temp), 8, 'verbose');
        extra=double(reshape(hog,[1,496]));
        hog2 = vl_hog(im2single(temp), 4, 'verbose');
        extra2=double(reshape(hog2,[1,1984]));
        
        X_new(i,:)=[extra extra2];
    end
end

function [T]=feature_extract(f) 
GLCM2 = graycomatrix(f); 
T = graycoprops(GLCM2,{'contrast','homogeneity','correlation','energy'});
T=struct2array(T);
end  