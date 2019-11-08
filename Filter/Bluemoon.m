%% Picture into matrix
moon = imread('blurry-moon.tif');
dt =.1;
%Parameter l: changes the blurry/sharp -ness of the picture
l=0.8;

x = -5:dt:5; y = -5:dt:5;

h = zeros(length(x),length(y));
[X,Y]=meshgrid(x,y);

delta = zeros(length(x),length(y));
delta(((length(x)+1)/2),((length(y)+1)/2)) = 1;

% Generating the a given delta function.
for i=((length(h)+1)/2)-2:((length(h)+1)/2)+2
    for j=((length(h)+1)/2)-2:((length(h)+1)/2)+2
    h(i,j)= 1/25;
    end
end

% Formulating the filter and other functions for signal analysis
g = delta + l*delta - l*h;
H = fftshift(fft2(h));
G = fftshift(fft2(g));
h=h(((length(h)+1)/2)-2:((length(h)+1)/2)+2,((length(h)+1)/2)-2:((length(h)+1)/2)+2);
sharpmoon = clydeconv2d(moon,g);
blurrymoon = clydeconv2d(moon,h);

%% Displaying ouput Images
montage({abs(blurrymoon),abs(sharpmoon)})
title('Blurred moon and sharped moon at \lambda=0.8')
colormap(gray(256));
truesize;

subplot(121)
mesh(X,Y,abs(H))
title('|H(e^{j\mu},e^{j\nu})|')
xlabel('\mu')
ylabel('\nu')
axis([-pi pi -pi pi 0 1])
xticks([-pi 0 pi])
xticklabels({'-\pi','0','\pi'})
yticks([-pi 0 pi])
yticklabels({'-\pi','0','\pi'})

subplot(122)
mesh(angle(H))
title('\angle H(e^{j\mu},e^{j\nu})')
xlabel('\mu')
ylabel('\nu')
axis([-pi pi -pi pi -5 5])
xticks([-pi 0 pi])
xticklabels({'-\pi','0','\pi'})
yticks([-pi 0 pi])
yticklabels({'-\pi','0','\pi'})

subplot(121)
mesh(X,Y,abs(G))
title('G(e^{j\mu},e^{j\nu}) at \lambda=1.5')
xlabel('\mu')
ylabel('\nu')
xticks([-pi 0 pi])
xticklabels({'-\pi','0','\pi'})
yticks([-pi 0 pi])
yticklabels({'-\pi','0','\pi'})

subplot(122)
mesh(X,Y,angle(G))
title('\angle G(e^{j\mu},e^{j\nu})')
xlabel('\mu')
ylabel('\nu')
xticks([-pi 0 pi])
xticklabels({'-\pi','0','\pi'})
yticks([-pi 0 pi])
yticklabels({'-\pi','0','\pi'})