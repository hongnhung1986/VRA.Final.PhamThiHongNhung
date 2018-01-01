function count = DemSoLuongAnhLabelN_Train(n)
    count = 0;
	lblTrainLabelsAll = loadMNISTLabels('train-labels.idx1-ubyte');
    nNumLabel = size(lblTrainLabelsAll, 1);
    for i = 1: nNumLabel
        if(lblTrainLabelsAll(i) == n)
            count = count + 1;
        end
    end
end

