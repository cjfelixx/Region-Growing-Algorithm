function Y = ConnectedSet(s, T, img, Label)
%CONNECTEDSET Region growing for edge detection.
[imgx,imgy] = size(img);
seedx=s(1);seedy=s(2);
observed=zeros(imgx,imgy);
observed(seedx,seedy)=Label;
mask=zeros(imgx,imgy);
Y=zeros(imgx,imgy);

while length(seedx)~=0
mask=zeros(imgx,imgy);

for i=1:length(seedx)
    %       Top-left
try
    if observed(seedx(i)-1,seedy(i)-1)~=Label 
    observed(seedx(i)-1,seedy(i)-1)=Label;
        
        if abs(img(seedx(i)-1,seedy(i)-1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)-1,seedy(i)-1)=Label;
        end
    end
end
 try
    %       Top
    
    if observed(seedx(i)-1,seedy(i))~=Label 
    observed(seedx(i)-1,seedy(i))=Label;
        
        if abs(img(seedx(i)-1,seedy(i))-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)-1,seedy(i))=Label;
        end
    end
 end
 
    %       Top-right
    try
    if observed(seedx(i)-1,seedy(i)+1)~=Label 
    observed(seedx(i)-1,seedy(i)+1)=Label;
        
        if abs(img(seedx(i)-1,seedy(i)+1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)-1,seedy(i)+1)=Label;
        end 
    end
    end
 
    %       Left
    try
    if observed(seedx(i)-1,seedy(i)+1)~=Label 
    observed(seedx(i),seedy(i)-1)=Label;
        
        if abs(img(seedx(i),seedy(i)-1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i),seedy(i)-1)=Label;
        end
    end
    end
 
    %       Right
    try
    if observed(seedx(i),seedy(i)+1)~=Label
    observed(seedx(i),seedy(i)+1)=Label;
        
        if abs(img(seedx(i),seedy(i)+1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i),seedy(i)+1)=Label;
        end
    end
    end 
 
    %       Bottom-left
    try
    if observed(seedx(i)+1,seedy(i)-1)~=Label 
    observed(seedx(i)+1,seedy(i)-1)=Label;
        
        if abs(img(seedx(i)+1,seedy(i)-1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)+1,seedy(i)-1)=Label;
        end
    end
    end
 
    %       Bottom
try
    if observed(seedx(i)+1,seedy(i))~=Label 
    observed(seedx(i)+1,seedy(i))=Label;
        
        if abs(img(seedx(i)+1,seedy(i))-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)+1,seedy(i))=Label;
        end
    end
end
 
    %       Bottom-right
   try 
    if observed(seedx(i)+1,seedy(i)+1)~=Label 
    observed(seedx(i)+1,seedy(i)+1)=Label;
        
        if abs(img(seedx(i)+1,seedy(i)+1)-img(seedx(i),seedy(i)))<=T
            mask(seedx(i)+1,seedy(i)+1)=Label;
        end
    end
   end
Y=Y+mask;
end
[seedx,seedy]=find(mask);

if length(seedx)==0
    Y(s(1),s(2))=Label;
    [valuesx,valuesy] = find(Y);
    for j=1:length(valuesx)
        Y(valuesx(j),valuesy(j)) = Label;
    end
    return
end
end
end
