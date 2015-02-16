tabErrM = zeros();
tabErrV = zeros();

for i=1:21    
    [imgNoisyR, sigma] = AddRicianNoise(MRIT1w, i);
        
    localMeans = ComputeLocalMeans(imgNoisyR, 2);
    sigmaLM = AjaLocalMeans(localMeans);
    
    localVars = ComputeLocalVar(imgNoisyR, 2);
    sigmaLV = AjaLocalVar(localVars, 5);
    
    tabErrM(i) = abs(1 - (sigma/sigmaLM));
    tabErrV(i) = abs(1 - (sigma/sigmaLV));
end

tabErrM = tabErrM .* 100;
tabErrV = tabErrV .* 100;

f = figure;
set(f,'name','Erreur Moyenne entre l ecart type réel et estimé','numbertitle','off')
plot(tabErrM);
hold on;
plot(tabErrV, 'g');
legend('LocalMeans','LocalVars');