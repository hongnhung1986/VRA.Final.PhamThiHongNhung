function saveprime(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    rArray = findnarray(n);
    strNameFile = ['prime',num2str(n),'.mat'];
    save(strNameFile,'rArray');

end

