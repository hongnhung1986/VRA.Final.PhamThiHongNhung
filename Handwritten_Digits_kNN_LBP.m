function Handwritten_Digits_kNN_LBP()
    strData = 'train-images.idx3-ubyte';
    strLabel = 'train-labels.idx1-ubyte';
    [imgDataTrain, lblDataTrain] = loadData(strData, strLabel);
    featuresDataTrain = ExtractFeaturesLBP(imgDataTrain);
    Mdl = fitcknn(featuresDataTrain', lblDataTrain)]=
    
    
    strData = 't10k-images.idx3-ubyte';
    strLabel = 't10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest] = loadData(strData, strLabel);
    featuresDataTest = ExtractFeaturesLBP(imgDataTest);
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
    
end

