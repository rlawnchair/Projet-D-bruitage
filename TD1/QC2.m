localVars = ComputeLocalVar(MRIT1w, 3);
f = figure;
set(f,'name','Variances Locales','numbertitle','off')
imagesc(localVars(:,:,90));
colormap gray;