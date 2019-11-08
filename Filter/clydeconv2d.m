function img = clydeconv2d(f,h)
%% Own 2d Convolution
% This is to understand how the process of the convolution method
f=double(f);
    img=[];
    p = padarray(f,[(length(h)+1)/2 (length(h)+1)/2],0);
   
   
   for i=1:length(f(:,1))
       
       for j=1:length(f(1,:))
           
       img(i,j) = sum(sum(h.*p(i:i+length(h)-1,j:length(h)+j-1)));
       end
  img = uint8(img);
   end


