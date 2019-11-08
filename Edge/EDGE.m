clear all
clc
img = imread("defective-weld.tif");
img =double(img);

[imgx,imgy] = size(img);
% for i =1:imgx
%     for j=1:imgy
         %Y = ConnectedSet([255 139], T, img, 1);
                  Yadjusted = ConnectedSet([1 1], 35, img, 1);
                  Y68 = ConnectedSet([1 1], 68, img, 1);
                  
       imshowpair(uint8(Y68),uint8(Yadjusted),'montage')
%     end