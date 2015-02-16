function [ outputImg ] = WaveletDenoising( inputImg , sigma)

padMRIT1w = zeropad(inputImg);
[af, sf] = farras;
J = 1;
dwtpadMRIT1w = dwt3D(padMRIT1w,J,af);
threshold = sigma*sqrt(2*log(length(inputImg(:))));
for k=1:7
    found = abs(dwtpadMRIT1w{J}{k}) > threshold;
    dwtpadMRIT1w{J}{k} = found .* dwtpadMRIT1w{J}{k};
end
outputImg = idwt3D(dwtpadMRIT1w, J, sf);