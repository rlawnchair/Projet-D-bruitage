[imgnoisy, sigma] = AddGaussianNoise(MRIT1w, 5);
f = figure;
set(f,'name','Coupe 90 - Bruit Gaussien','numbertitle','off')
imagesc(imgnoisy(:,:,90));
colormap(gray);
axis image;
fprintf('Q.A3: Ecart-type %f\n',sigma);

