function [ p ] = precipitation( T )
%PRECIPITATION Summary of this function goes here
%   Detailed explanation goes here

    %+T -> -p
    
    p = -atan((T-(273+40))/10)./pi + 0.5;

end

