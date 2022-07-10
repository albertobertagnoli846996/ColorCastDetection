function K1 = CastFactorK1(I, A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[n, m] = size(I);
lab = rgb2lab(I);
GS = rgb2gray(I);

Img_a = double(lab(:,:,2))./255;
Img_b = double(lab(:,:,3))./255;


a_mean = mean2(Img_a);
b_mean = mean2(Img_b);
D = sqrt((a_mean)^2 + (b_mean)^2);

a_var = sum(sum((Img_a - a_mean).^2)/(n*m));
b_var = sum(sum((Img_b - b_mean).^2)/(n*m));
M = sqrt((a_var)^2 + (b_var)^2);

%K = D/M;

GS_var = sum(sum((GS - mean2(GS)).^2)/(n*m));
K1 = D / (M * max(abs(min(GS_var - A, 1)), 1));


%Impostato il limite di cast a 650
if K1 > 650 
    K1 = 650; 
end

% disp(K1);
% 
% if K1 < A
%     IsCast = false;
% else 
%     IsCast = true;
% end

