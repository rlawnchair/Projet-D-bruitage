[imgNoisyR, sigmaR] = AddRicianNoise(MRIT1w, 7);
localMeansR = ComputeLocalMeans(imgNoisyR, 8);
sigmaLM = AjaLocalMeans(localMeansR);
fprintf('Q.C3-LocalMeans: Ecart-type réel %f, Ecart-type estimé %f\n',sigmaR, sigmaLM);
localVarsR = ComputeLocalVar(imgNoisyR, 5);
sigmaLV = AjaLocalVar(localVarsR, 7);
fprintf('Q.C3-LocalVariances: Ecart-type réel %f, Ecart-type estimé %f\n',sigmaR, sigmaLV);