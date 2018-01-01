function Handwriten_Digits_kNN_LBP_Radius()
    strDataTrain = 'train-images.idx3-ubyte';
    strDataLabelTrain = 'train-labels.idx1-ubyte';
    [imgDataTrain, lblDataTrain] = loadData(strDataTrain, strDataLabelTrain);
    
    featuresDataTrain = ExtractFeaturesLBP(imgDataTrain,8,4);
    Mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    strDataTest = 't10k-images.idx3-ubyte';
    strDataLabelTest = 't10k-labels.idx1-ubyte';
    [imgDataTest, lblActualDataTest] = loadData(strDataTest, strDataLabelTest);
    
    featuresDataTest = ExtractFeaturesLBP(imgDataTest, 8, 4);
    
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblActualDataTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d', nCount);
end