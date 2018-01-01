function count = DemSoLuongAnhNhanSai_NhanN( n )
    imgTrainImagesAll = loadMNISTImages('train-images.idx3-ubyte');
	lblTrainLabelsAll = loadMNISTLabels('train-labels.idx1-ubyte');
    imgTestImagesAll = loadMNISTImages('t10k-images.idx3-ubyte');
	lblTestLabelsAll = loadMNISTLabels('t10k-labels.idx1-ubyte');  
    Md1 = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
    nNumTestImgs = size(imgTestImagesAll,2);
    count = 0;
    for nNumber = 1 : nNumTestImgs
        fprintf('\n%d',nNumber);
        img = imgTestImagesAll(:,nNumber);
        lblPredictTest = predict(Md1, img');
        if(lblPredictTest ~= lblTestLabelsAll(nNumber))
            if(lblTestLabelsAll(nNumber) == n)
                count = count + 1;
            end
        end
    end
end

