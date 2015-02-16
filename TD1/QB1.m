padMRIT1w = zeropad(MRIT1w);

[af, sf] = farras;
J = 1;
dwtpadMRIT1w = dwt3D(padMRIT1w,J,af);
f = figure;
set(f,'name','Coupe 45 - LLL','numbertitle','off')
imagesc(dwtpadMRIT1w{2}(:,:,45))
colormap gray;
axis image;

f = figure;
set(f,'name','Coupe 45 - HHH','numbertitle','off')
imagesc(dwtpadMRIT1w{J}{7}(:,:,45))
colormap gray;
axis image;

