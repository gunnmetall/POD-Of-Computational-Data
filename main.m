clear all, close all, clc
load CYLINDER_ALL.mat
load CCcool.mat

%%
m = 21;
X = VORTALL(:,1:m);
Mean = mean(X,2);
Xd = X - Mean;

%%
[U,S,V] = svd(Xd,'econ');

r = m;  
U = U(:,1:r);
S = S(1:r,1:r);
V = V(:,1:r);

%%
mode1 = reshape(U(:,1), nx, ny);
mode2 = reshape(U(:,2), nx, ny);
mode3 = reshape(U(:,3), nx, ny);
mode4 = reshape(U(:,4), nx, ny);

%%
colormap(CC);

figure(1)
subplot(2,3,1);
imagesc(reshape(X(:,2),nx,ny));
title('Instantious');

subplot(2,3,4);
imagesc(reshape(Mean,nx,ny));
title('Mean');

subplot(2,3,2);
imagesc(mode1);
title('mode1');

subplot(2,3,3);
imagesc(mode2);
title('mode2');

subplot(2,3,5);
imagesc(mode3);
title('mode3');

subplot(2,3,6);
imagesc(mode4);
title('mode4');
hold off
%%
% x = zeros(m,1);
% for i=1:m
%     x(i) = S(i,i);
% end
% figure(2)
% plot(x);

%%


% VidObj = VideoWriter('movie1.avi', 'Uncompressed AVI'); %set your file name and video compression
% VidObj.FrameRate = 30; %set your frame rate
% open(VidObj);
% 
% for t=1:m
%     temp = zeros(nx, ny);
%     for i=1:4
%         X_ = S(i,i)*U(:,i)*(V(:,i)');
%         temp = temp + reshape(X_(:,t), nx, ny);
%     end
%     writeVideo(VidObj, mat2gray(temp));
% end
% 
% close(VidObj);

% load CCcool.mat 
% 
% 
% figure(1)
% colormap(CC)
% image(X3_,'CDataMapping','scaled');
% 
% 
% figure(2)
% colormap(CC)
% image(X4_,'CDataMapping','scaled');