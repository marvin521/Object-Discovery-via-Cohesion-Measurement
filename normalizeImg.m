function [ outputImg ] = normalizeImg( inputImg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
imgVec=inputImg(:);
MaxValue=max(imgVec);
MinValue=min(imgVec);
outputImg=(inputImg-MinValue)/(MaxValue-MinValue);

end

