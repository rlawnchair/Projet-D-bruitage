localMeans = ComputeLocalMeans(MRIT1w, 3);
f = figure;
set(f,'name','Moyennes Locales','numbertitle','off')
imagesc(localMeans(:,:,90));
colormap gray;