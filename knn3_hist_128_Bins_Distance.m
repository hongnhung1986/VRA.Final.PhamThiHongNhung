function knn3_hist_128_Bins_Distance( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    nBins = 128;
    nNumTrain = size(imgTrain, 2);
    imgTrain_hist = zeros(nBins, nNumTrain);
    for i=1:nNumTrain
        imgTrain_hist(:,i) = imhist(imgTrain(:,i),nBins);
    end
    Mdl = fitcknn(imgTrain_hist',lblTrain,'NumNeighbors',3,'Distance','Cityblock');
    imgTest = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTest = loadMNISTLabels('t10k-labels.idx1-ubyte');
    nNumTest = size(imgTest,2);
    imgTest_hist = zeros(nBins, nNumTest);
    for i=1:nNumTest
        imgTest_hist(:,i) = imhist(imgTest(:,i),nBins);
    end
    lblResult = predict(Mdl,imgTest_hist');
    nResult = (lblResult == lblTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end
% Ket qua chay la: 2890


