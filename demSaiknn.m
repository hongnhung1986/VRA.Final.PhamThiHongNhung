function demSaiknn()   
    imgTrainImagesAll = loadMNISTImages('train-images.idx3-ubyte');
	lblTrainLabelsAll = loadMNISTLabels('train-labels.idx1-ubyte');
    Md1 = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
    imgTestImagesAll = loadMNISTImages('t10k-images.idx3-ubyte');
	lblTestLabelsAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    dem=0;
    for nNumber = 1:10000
        img = imgTestImagesAll(:,nNumber);
        lblPredictTest = predict(Md1, img');
        if(lblPredictTest ~= lblTestLabelsAll(nNumber))
            dem = dem +1;
        end
    end
    fprintf('\n So luong anh nhan dang sai %d:',dem);
end





