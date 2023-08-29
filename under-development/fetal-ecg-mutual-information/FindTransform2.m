clear;
close all;

load('FOETAL_ECG.dat');
data = FOETAL_ECG(:,2:end)';
time = FOETAL_ECG(:,1)';
clear FOETAL_ECG;
I = 1231:1320;
%//////////////////////////////////////////////////////////////////////////
N = length(I);
fs = 250;
%time = [0:N-1]/fs;

% mother params
F_m = 1.359;
teta0_m = -pi/3.05;
%teta0_m = -pi/1.96;

teta_iso = -1.4;
%teta0_m = -pi;
%//////////////////////////////////////////////////////////////////////////
tetai_m.x  = [-1.09  -0.83   -0.19     -.07  0 .06        0.22    1.2 1.42 1.68];% 2.9];
alphai_m.x = [0.03   .08    -0.13    .85 1.11 .75     0.06   0.1  0.17 0.39];% .03];
bi_m.x     = [0.0906    0.1057    0.0453    0.0378    0.0332    0.0302    0.0378    0.6040 0.3020    0.1812];% .5];
% OK

tetai_m.y  = [-1.1  -0.9 -0.76       -0.11   -.01       0.065  0.8      1.58];% 2.9];
alphai_m.y = [0.035 0.015 -0.019     0.32    .51     -0.32    0.04   0.08];% .014];
bi_m.y     = [0.07  .07  0.04        0.055    0.037    0.0604  0.450  0.3];% .5];
% OK

tetai_m.z  = [-1.1  -0.93 -0.7      -.4     -0.15    .095    1.05 1.25 1.55];% 2.8];
alphai_m.z = [-0.03 -0.14 -0.035    .045     -0.4    .46    -.12 -.2 -.35];% -.035];
bi_m.z     = [.03  .12  .04         .4    .045       .05    .8 .4 .2];% .4];

%//////////////////////////////////////////////////////////////////////////
[DIPm tetam] = DipoleGenerator(N,fs,F_m,alphai_m,bi_m,tetai_m,teta0_m);%,teta_iso);
s = [DIPm.x;DIPm.y;DIPm.z];
H = data(1:5,I)/s;
s2 = H*s;
%//////////////////////////////////////////////////////////////////////////
L = 1;
close all;
%for i = 1:size(data,1),
for i = [1:8],
    figure(floor((i-1)/L)+1);
    subplot(L,1,mod(i-1,L)+1);
%     plot(s2(i,:),'b');
%     hold on;
    plot(data(i,:));
%    plot(100*s(1,:)','r');
    grid;
end

% % % figure;
% % % plot(time,data(1,:));
% % % grid

%//////////////////////////////////////////////////////////////////////////
% % % [DIPm tetam] = DipoleGenerator(10000,fs,F_m,alphai_m,bi_m,tetai_m,teta0_m,teta_iso);
% % % s = [DIPm.x;DIPm.y;DIPm.z];
% % % figure
% % % plot(s');
% % % grid;
