[imgNoisyG, sigma] = AddGaussianNoise(MRIT1w, 7);
f = figure;
set(f,'name','Coupe 90 - Bruit Gaussien','numbertitle','off')
imagesc(imgNoisyG(:,:,90));
colormap(gray);
axis image;
w = waitbar(0,'Application du filtre Gaussien');
set(w,'Name','Progression du filtre Gaussien');

PSNR = zeros();
PSNR(1) = ComputePsnr(MRIT1w,imgNoisyG);

j = 2;
for i=1:1:5
    img = GaussianDenoising(imgNoisyG, [2,2,2], i);
    PSNR(j) = ComputePsnr(img, MRIT1w);
    j = j+1;
    waitbar(i/5);
end
close(w);

f = figure;
set(f,'name','PSNR','numbertitle','off')
hist(PSNR);

f = figure;
set(f,'name','Coupe 90 - Débruitée','numbertitle','off')
imagesc(img(:,:,90));
colormap(gray);
axis image;