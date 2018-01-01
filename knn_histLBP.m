function knn_histLBP( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    imgI = imgTrain(:,1);
    img2D = reshape(imgI,28,28);
    featureVector = extractLBPFeatures(img2D,'NumNeighbors',8,'Radius',4);
    nSize = length(featureVector);
    nNumTrain = size(imgTrain, 2);
    featuresDataTrain = zeros(nSize, nNumTrain);
    for i=1:nNumTrain
        imgI = imgTrain(:,i);
        img2D = reshape(imgI,28,28);
        featuresDataTrain(:,i) = extractLBPFeatures(img2D,'NumNeighbors',8,'Radius',4);
    end
    Mdl = fitcknn(featuresDataTrain',lblTrain);
    imgTest = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTest = loadMNISTLabels('t10k-labels.idx1-ubyte');
    nNumTest = size(imgTest,2);
    featuresDataTest = zeros(nSize, nNumTest);
    for i=1:nNumTest
        imgI = imgTest(:,i);
        img2D = reshape(imgI,28,28);
        featuresDataTest(:,i) = extractLBPFeatures(img2D,'NumNeighbors',8,'Radius',4);
    end
    lblResult = predict(Mdl,featuresDataTest');
    nResult = (lblResult == lblTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end
% S? l??ng m?u ?úng khi dùng ??c tr?ng LBP la: 6652
