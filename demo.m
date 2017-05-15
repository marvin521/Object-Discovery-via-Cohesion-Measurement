imgPath='./pics/test4.bmp';
outputPath='./outputEigens/';
opts.tol = 1e-3;
imgSupremum=120;

[img,imSZ]=readImage(imgPath,imgSupremum);
figure;
colNum=1;
vecNum=1;
subplot(colNum,vecNum+1,1);
imshow(img);
title('Original img');
L=getAffinityMatrix(img);
try
    [eigenVectors,eigenValues]=eigs(L);
catch
    [eigenVectors,eigenValues]=eigs(L,6,'LR',opts);
end
vecNum=size(eigenVectors,2);


%%%%%%%%%%%% show the eigenvectors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:vecNum
    eigenVector=reshape(eigenVectors(:,i),imSZ);
    subplot(colNum,vecNum+1,i+1);
    imshow(1-eigenVector,[]);
    eigenName=['E_' num2str(i)];
    title(eigenName);
    imgName=[eigenName '.jpg'];
    eigenVector=normalizeImg(eigenVector);
    imwrite(1-eigenVector,[outputPath imgName]);
end

%%%%%%%%%%%%%%% draw color line of the given test image  %%%%%%%%%%%%%%%%
figure;
[h,w,c]=size(img);
imgMat=reshape(img,[h*w,c]);
scatter3(imgMat(:,1),imgMat(:,2),imgMat(:,3),3,double(imgMat),'filled');
xlabel('R');
ylabel('G');
zlabel('B');
box on;
title('color line');