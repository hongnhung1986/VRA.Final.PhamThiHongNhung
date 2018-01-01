function m = isprime(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    count = 0;
    for i=2:(sqrt(n))
        if (mod (n,i) == 0)
            count = count + 1;
        end
    end
    m = (count == 0);
end

