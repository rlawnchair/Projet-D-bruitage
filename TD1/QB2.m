[imgNoisyG, sigmaG] = AddGaussianNoise(MRIT1w, 7);
padMRIT1w = zeropad(imgNoisyG);
[af, sf] = farras;
J = 1;
dwtpadMRIT1w = dwt3D(padMRIT1w,J,af);
HHH = dwtpadMRIT1w{1}{7}(:);
sigmaDonoho = DonohoWaveletMad(HHH);
fprintf('Q.B2: Ecart-type réel %f, Ecart-type estimé %f\n',sigmaG, sigmaDonoho);