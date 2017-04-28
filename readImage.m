function [ img,imSZ ] = readImage( imgPath,imgSupremum )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
img=imread(imgPath);
    [h,w,c]=size(img);
    maxSide=max(h,w);
    if maxSide>imgSupremum
        scaleR=imgSupremum/maxSide;
        imSZ=int32(scaleR*[h,w]);
    else
        imSZ=[h,w];
    end
    img=imresize(img,imSZ);
    img=double(img)/255;

end

