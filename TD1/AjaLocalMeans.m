function [std] = AjaLocalMeans(lm)
    std = sqrt(2/pi)*mode(lm(:));
end