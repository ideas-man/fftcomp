close all, clear all

I = rgb2gray(imread('fig_03.jpg'));

BW = ~imbinarize(I);
% BW = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.6);

[B,~] = bwboundaries(BW,8,'holes');

bwim = bound2im(B{1},size(BW,1),size(BW,2));
figure,imshow(bwim)

z = frdescp(B{1});
N = 8;
zz = [z(1 : N + 1); z(end - N + 1 : end)]


Ks = sqrt(abs(zz(2))^2 + abs(zz(end))^2)

zzks = zz(1:end)/Ks

Kr = exp(-1i/2*(angle(zz(2)) + angle(zz(end))))

zzkskr = zzks * Kr

vinv = arctan((imag(zz(2)) + imag(zz(end)))/(real(zz(2)) - real(zz(end))))


% z196 = ifrdescp(z,round(size(z,1)/24));
z196im = bound2im(zz,size(BW,1),size(BW,2));
figure,imshow(z196im)