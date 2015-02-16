function [ outputImg ] = GaussianDenoising(noiseImg, kernSize, spatialKern)
kern = GaussianKernel(kernSize, spatialKern);
outputImg = convn(noiseImg, kern,'same');
end

