function knn_histHOG( )
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    imgI = imgTrain(:,1);
    img2D = reshape(imgI,28,28);
    [featureVector,hogVisualization] = extractHOGFeatures(img2D,'CellSize',[8 8]); %Tuong tu cho CellSize [4 4] va [8 8]
    nBins = size(featureVector,2);
    nNumTrain = size(imgTrain, 2);
    imgTrain_hist = zeros(nBins, nNumTrain);
    for i=1:nNumTrain
        imgI = imgTrain(:,i);
        img2D = reshape(imgI,28,28);
        [featureVector,hogVisualization] = extractHOGFeatures(img2D,'CellSize',[8 8]); %Tuong tu cho CellSize [4 4] va [8 8]
        imgTrain_hist(:,i) = featureVector;
    end
    Mdl = fitcknn(imgTrain_hist',lblTrain);
    imgTest = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTest = loadMNISTLabels('t10k-labels.idx1-ubyte');
    nNumTest = size(imgTest,2);
    imgTest_hist = zeros(nBins, nNumTest);
    for i=1:nNumTest
        imgI = imgTest(:,i);
        img2D = reshape(imgI,28,28); 
        imgTest_hist(:,i) = extractHOGFeatures(img2D,'CellSize',[8 8]); %Tuong tu cho CellSize [4 4] va [8 8]
    end
    lblResult = predict(Mdl,imgTest_hist');
    nResult = (lblResult == lblTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n',nCount);
end
% Ket qua chay CellSize [2 2] la: 9772
% Ket qua chay CellSize [4 4] la: 9767
% Ket qua chay CellSize [8 8] la: 9709
