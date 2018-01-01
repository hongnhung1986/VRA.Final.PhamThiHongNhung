function numDetect_Harris(  )
    imgI = imread('cameraman.jpg'); % doc anh gray
    points = detectHarrisFeatures(imgI);
    nNum = length(points);
    fprintf('\nSo luong diem detect duoc: %d\n',nNum)
end
% So luong diem detect duoc dung Harris la: 182

