function buildData()
% %%  Load Data Train
%     strData = 'train-images.idx3-ubyte';
%     strDataLabel = 'train-labels.idx1-ubyte';
%     [imgDataTrain,lblDataTrain] = loadData(strData,strDataLabel);
% %%  Create Folder Data
%     mkdir DataTrain;
% 	mkdir DataTrain 0;
% 	mkdir DataTrain 1;
% 	mkdir DataTrain 2;
% 	mkdir DataTrain 3;
% 	mkdir DataTrain 4;
% 	mkdir DataTrain 5;
% 	mkdir DataTrain 6;
% 	mkdir DataTrain 7;
% 	mkdir DataTrain 8;
% 	mkdir DataTrain 9;
% %%  Build Data Train
%     nCount = zeros(1,10);
%     nDataTrain = size(imgDataTrain,2);
%     for i = 1:nDataTrain
%         img1D = imgDataTrain(:,i);
%         img2D = reshape(img1D,28,28);
%         
%         lblI = lblDataTrain(i);
%         nCount(lblI+1) = nCount(lblI+1) + 1;               
%         
%         nID = nCount(lblI+1);
%         if(nID<10)
%             strNumber = ['000' num2str(nID)];
%         elseif(nID<100)
%                 strNumber = ['00' num2str(nID)];
%             elseif(nID<1000)
%                     strNumber = ['0' num2str(nID)];
%                 else
%                     strNumber = num2str(nID);
%         end
%         
%         strNameFile = ['DataTrain\' num2str(lblI) '\image_' strNumber '.jpg'];
%         imwrite(img2D,strNameFile);
%     end
%%  Load Data Test
    strData = 't10k-images.idx3-ubyte';
    strDataLabel = 't10k-labels.idx1-ubyte';
    [imgDataTest,lblActualDataTest] = loadData(strData,strDataLabel);
%%  Create Folder Data
    mkdir Test;
	mkdir Test 0;
	mkdir Test 1;
	mkdir Test 2;
	mkdir Test 3;
	mkdir Test 4;
	mkdir Test 5;
	mkdir Test 6;
	mkdir Test 7;
	mkdir Test 8;
	mkdir Test 9;
%% Build Data Test
    nCount = zeros(1,10);
    nDataTest = size(imgDataTest,2);
    for i = 1:nDataTest
        img1D = imgDataTest(:,i);
        img2D = reshape(img1D,28,28);
        
        lblI = lblActualDataTest(i);
        fprintf('\n lblActualDataTest(i): %d',lblI);
        fprintf('\n nCount(lblI+1): %d',nCount(lblI+1));
        nCount(lblI+1) = nCount(lblI+1) + 1; 
        fprintf('\n nCount(lblI+1) + 1: %d',nCount(lblI+1)+1);
        
        nID = nCount(lblI+1);
        fprintf('\n nID: %d',nID);
%         if(nID<10)
%             strNumber = ['000' num2str(nID)];
%         elseif(nID<100)
%                 strNumber = ['00' num2str(nID)];
%             elseif(nID<1000)
%                     strNumber = ['0' num2str(nID)];
%                 else
%                     strNumber = num2str(nID);
%         end
        
%         strNameFile = ['Test\' num2str(lblI) '\image_' strNumber '.jpg'];
%         imwrite(img2D,strNameFile);
    end    
end
