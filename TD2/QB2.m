[imgNoisyG, sigma] = AddGaussianNoise(MRIT1w, 7);
f = figure;
set(f,'name','Coupe 90 - Bruit Gaussien','numbertitle','off')
imagesc(imgNoisyG(:,:,90));
colormap(gray);
axis image;


imgDenoisedW = WaveletDenoising(imgNoisyG, sigma);
[m,n,o] = size(MRIT1w);
psnrW = ComputePsnr(MRIT1w,imgDenoisedW(1:m,1:n,1:o));
fprintf('Q.B2: PSNR après débruitage par Ondelette %f\n',psnrW);


f = figure;
set(f,'name','Coupe 90 - Débruitée par ondelette','numbertitle','off')
imagesc(imgDenoisedW(:,:,90));
colormap(gray);
axis image;