[imgNoisyG, sigma] = AddGaussianNoise(MRIT1w, 7);
f = figure;
set(f,'name','Coupe 90 - Bruit Gaussien','numbertitle','off')
imagesc(imgNoisyG(:,:,90));
colormap(gray);
axis image;

imgDenoisedB = BilateralDenoising(imgNoisyG, 40, 40, [5,5,5]);

PSNRB = ComputePsnr(MRIT1w, imgDenoisedB);
fprintf('Q.C2 : PSNR %f\n',PSNRB);

f = figure;
set(f,'name','Coupe 90 - Débruité par filtre Bilateral','numbertitle','off')
imagesc(imgDenoisedB(:,:,90));
colormap(gray);
axis image;
