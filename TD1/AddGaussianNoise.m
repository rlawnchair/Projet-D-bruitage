function [outputImg, sigma] = AddGaussianNoise(img,noise)
pxMax = max(img(:));
sigma = noise / 100 * pxMax;
outputImg = sigma * randn(size(img)) + img;
end

