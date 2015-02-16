tabErr = zeros();
J=1;
[af, sf] = farras;
for i=1:21    
    [imgNoisyG, sigmaG] = AddGaussianNoise(MRIT1w, i);
    padMRIT1w = zeropad(imgNoisyG);

    dwtpadMRIT1w = dwt3D(padMRIT1w, J, af);
    
    HHH = dwtpadMRIT1w{1}{7}(:);
    sigmaDonoho = DonohoWaveletMad(HHH);
    tabErr(i) = abs(1 - (sigmaG/sigmaDonoho));
end
tabErr = tabErr .* 100;
f = figure;
set(f,'name','Erreur Moyenne entre l ecart type réel et estimé','numbertitle','off')
plot(tabErr);