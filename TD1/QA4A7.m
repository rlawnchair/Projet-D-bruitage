[imgnoisyR, sigma] = AddRicianNoise(MRIT1w, 5);
fprintf('Q.A4 à A7: Ecart-type %f\n',sigma);
%psnr = ComputePsnr(MRIT1w, imgnoisyR);
f = figure;
set(f,'name','Coupe 90 - Bruit Ricien','numbertitle','off')
imagesc(imgnoisyR(:,:,90));
colormap(gray);
axis image;

psnr1 = zeros();
for i=1:21
    [imgNoisyG, etb] = AddGaussianNoise(MRIT1w, i);
    psnr1(i) = ComputePsnr(MRIT1w, imgNoisyG);
end

psnr2 = zeros();
for i=1:21
    [imgNoisyR, etb] = AddRicianNoise(MRIT1w, i);
    psnr2(i) = ComputePsnr(MRIT1w, imgNoisyR);
end

f = figure;
set(f,'name','PSNR','numbertitle','off')
plot(psnr1);
hold on;
plot(psnr2, 'g');
legend('PSNR du bruit gaussien','PSNR du bruit ricien');
