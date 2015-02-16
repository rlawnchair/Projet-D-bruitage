function [img] = BilateralDenoising(imgn, sigma_i, sigma_s, kernelSize)

kGauss = GaussianKernel(2.*kernelSize+1, sigma_s);

w = waitbar(0,'Application du filtre bilatéral');
set(w,'Name','Progression du filtre bilatéral');
tic;

dim = size(imgn);
img = zeros(dim);

for i = 1:dim(1)
         iMin = max(i-kernelSize(1),1);
         iMax = min(i+kernelSize(1),dim(1));
   for j = 1:dim(2)
         jMin = max(j-kernelSize(2),1);
         jMax = min(j+kernelSize(2),dim(2));
       for k = 1:dim(3)

         kMin = max(k-kernelSize(3),1);
         kMax = min(k+kernelSize(3),dim(3));
         Itmp = imgn(iMin:iMax,jMin:jMax, kMin:kMax);

         H = exp(-(Itmp-imgn(i,j,k)).^2/(2*sigma_i^2));

         W = H.*kGauss((iMin:iMax)-i+kernelSize(1)+1,(jMin:jMax)-j+kernelSize(2)+1,(kMin:kMax)-k+kernelSize(3)+1 );
         img(i,j,k) = sum(W(:).*Itmp(:))/sum(W(:));

       end      
   end
   waitbar(i/dim(1));
end
toc;

close(w);

end