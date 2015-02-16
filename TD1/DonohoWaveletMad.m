function [ std ] = DonohoWaveletMad( HHH )
std = median(abs(HHH))/0.6745;
end

