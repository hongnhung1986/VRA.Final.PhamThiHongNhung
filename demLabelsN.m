function demLabelsN()
    imgTrainImagesAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainLabelsAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    nNumTrainImages = size(imgTrainImagesAll, 2);
    n = randi([1 nNumTrainImages]); % Co the nhap n tu ban phim
    dem = 0;
    for i=1:60000
        if lblTrainLabelsAll(i)==lblTrainLabelsAll(n)
            dem = dem + 1;
        end
    end
    fprintf('\nSo luong anh co Lables %d la: %d',lblTrainLabelsAll(n),dem);
end

