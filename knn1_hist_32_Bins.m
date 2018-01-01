function knn1_hist_32_Bins( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    nBins = 32;
    nNumTrain = size(imgTrain, 2);
    imgTrain_hist = zeros(nBins, nNumTrain);
    for i=1:nNumTrain
        imgTrain_hist(:,i) = imhist(imgTrain(:,i),nBins);
    end
    Mdl = fitcknn(imgTrain_hist',lblTrain,'NumNeighbors',5); %Tuong tu cho k=1 va k=3
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
% Ket qua chay k = 1 la: 2669
% Ket qua chay k = 3 la: 2708
% Ket qua chay k = 5 la: 2856

