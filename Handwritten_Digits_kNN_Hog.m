function Handwritten_Digits_kNN_Hog()
    strData = 'train-images.idx3-ubyte';
    strLabel = 'train-labels.idx1-ubyte';
    [imgDataTrain, lblDataTrain] = loadData(strData, strLabel);
    featuresDataTrain = ExtractFeaturesHog(imgDataTrain);
    Mdl = fitcknn(featuresDataTrain', lblDataTrain);
    strData = 't10k-images.idx3-ubyte';
    strLabel = 't10k-labels.idx1-ubyte';
    [imgDataTest, lblActualDataTest] = loadData(strData, strLabel);
    featuresDataTest = ExtractFeaturesHog(imgDataTest);
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblActualDataTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end

