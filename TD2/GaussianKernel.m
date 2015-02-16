function [kernel] = GaussianKernel(kernelSize, sigma)
kernel = zeros();
tsigma = 2 * sigma^2;

for x=1:kernelSize(1)
    for y=1:kernelSize(2)
        for z=1:kernelSize(3)
            radsquare = (x-kernelSize(1)/2)^2 + (y-kernelSize(2)/2)^2 + (z-kernelSize(3)/2)^2;
            kernel(x, y, z) = exp(-radsquare/tsigma);
        end
    end
end

max= norm(kernel(:));

kernel = kernel/max;
end