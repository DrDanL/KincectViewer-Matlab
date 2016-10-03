function stamp = ReadTimeStamps(loc)
%This function read's in the timestamp of a specific file location. We read
%in the timestamp for each time period.
%
%Input:
%   loc - location of the timestamp master file
%
%Output:
%   stamp - timestamp sequence
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

if (exist(loc, 'file') == 2)
    %Read in the file. We use the dlmread to read in each line.
    [A] = dlmread(loc);
    
    %weird: for some reason reading in the value doesn't work. We have to cast
    %over to uint 64, not sure why. Matlab reads in as a double, converting it
    %to a decimal
    A = uint64(A);
    
    %Pass over and return
    stamp = A;
    
else
    stamp = [];
    
end

end

