function detectSURF_matchFeatures_estimateGeometricTransform( )
    imgI = imread('stapleRemover.jpg');
    arrPointI = detectSURFFeatures(imgI);
    imgJ = imread('clutteredDesk.jpg');
    arrPointJ = detectSURFFeatures(imgJ);
    [arrfeatureI,arrValidPointI] = extractFeatures(imgI,arrPointI);
    [arrfeatureJ,arrValidPointJ] = extractFeatures(imgJ,arrPointJ);
    arrIndexPair = matchFeatures(arrfeatureI,arrfeatureJ);
    arrMatchedPointI = arrValidPointI(arrIndexPair(:,1),:);
    arrMatchedPointJ = arrValidPointJ(arrIndexPair(:,2),:);
    [tform,inliermatchedPointsJ,inliermatchedPointsI] = estimateGeometricTransform(arrMatchedPointJ,arrMatchedPointI,'similarity');
    nNum = size(inliermatchedPointsI,1);
    fprintf('\nSo luong diem detect boi SURF Features la: %d\n',nNum);
    
end
% So luong diem (detect boi SURF feature detector) khi dung
% estimateGeometricTransform la: 4 hoac 5

