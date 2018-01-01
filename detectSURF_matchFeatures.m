function detectSURF_matchFeatures( )
    imgI = imread('stapleRemover.jpg');
    imgJ = imread('clutteredDesk.jpg');
    arrPointI = detectSURFFeatures(imgI);
    arrPointJ = detectSURFFeatures(imgJ);
    [arrfeatureI,arrValidPointI] = extractFeatures(imgI,arrPointI);
    [arrfeatureJ,arrValidPointJ] = extractFeatures(imgJ,arrPointJ);
    arrIndexPair = matchFeatures(arrfeatureI,arrfeatureJ);
    nNum = size(arrIndexPair,1);
    fprintf('\nSo luong diem detect boi SURF Features la: %d\n',nNum);   
end
% So luong diem (detect boi SURF feature detector) duoc khop la: 17

