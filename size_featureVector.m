function size_featureVector( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    imgI = imgTrain(:,1);
    img2D = reshape(imgI,28,28);
    [featureVector,hogVisualization] = extractHOGFeatures(img2D,'CellSize',[8 8]); %Tuong tu cho CellSize [4 4] va [2 2]
    sizeFeatureVectorHang = size(featureVector,1);
    sizeFeatureVectorCot = size(featureVector,2);
    fprintf('\nKich thuoc featureVector:');
    fprintf('\n - So hang: %d',sizeFeatureVectorHang);
    fprintf('\n - So cot: %d\n',sizeFeatureVectorCot);
end
% Kích thuoc c?a featureVector [2 2] la: 1 6048
% Kích th??c c?a featureVector [4 4] la: 1 1296
% Kích th??c c?a featureVector [8 8] la: 1 144

