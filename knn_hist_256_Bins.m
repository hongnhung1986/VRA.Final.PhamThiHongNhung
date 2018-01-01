function knn_hist_256_Bins( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    nBins = 256;
    nNumTrain = size(imgTrain, 2);
    imgTrain_hist = zeros(nBins, nNumTrain);
    for i=1:nNumTrain
        imgTrain_hist(:,i) = imhist(imgTrain(:,i),nBins);
    end
    Mdl = fitcknn(imgTrain_hist',lblTrain);
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
% Ket qua chay la: 3039


