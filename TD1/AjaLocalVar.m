function [ std ] = AjaLocalVar( lv, N )
    std = sqrt((2/(4-pi))*(N/(N-1))*mode(lv(:)));
end

