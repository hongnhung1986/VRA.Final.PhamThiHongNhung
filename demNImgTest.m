function demNImgTest()
    imgTrainImagesAll = loadMNISTImages('train-images.idx3-ubyte');
	lblTrainLabelsAll = loadMNISTLabels('train-labels.idx1-ubyte');
    Md1 = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
    imgTestImagesAll = loadMNISTImages('t10k-images.idx3-ubyte');
	lblTestLabelsAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    nNumTestImgs = size(imgTestImagesAll,2);
    n = randi([1 nNumTestImgs]);
    dem=0;
    for i = 1:nNumTestImgs
        img = imgTestImagesAll(:,n);
        lblPredictTest = predict(Md1, img');
        if(lblPredictTest ~= lblTestLabelsAll(n))
            dem = dem +1;
        end
    end
        fprintf('\nSo luong anh Label %d bi nhan dang sai: %d',lblTestLabelsAll(n),dem);
end





