function d = DoChinhXac(nNeighbors)
    imgTrainImagesAll = loadMNISTImages('train-images.idx3-ubyte');
	lblTrainLabelsAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestImagesAll = loadMNISTImages('t10k-images.idx3-ubyte');
	lblTestLabelsAll = loadMNISTLabels('t10k-labels.idx1-ubyte'); 
    Md1 = fitcknn(imgTrainImagesAll', lblTrainLabelsAll, 'NumNeighbors', nNeighbors,'Standardize',1);
%   Md1 = fitcknn(imgTrainImagesAll', lblTrainLabelsAll, 'NumNeighbors', nNeighbors,'NSMethod','exhaustive','Distance','minkowski','Standardize',1);
    nNumTestImgs = size(imgTestImagesAll,2);
    count = 0;
    for nNumber = 1 : nNumTestImgs
        img = imgTestImagesAll(:,nNumber);
        lblPredictTest = predict(Md1, img');
        if(lblPredictTest == lblTestLabelsAll(nNumber))
           count = count + 1;
        end
    end
    d = (count / nNumTestImgs) * 100;
end

