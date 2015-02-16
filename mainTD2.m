% L'execution peut etre très longue, des progress bar ont été ajoutées pour
% donner une idée du temps restant

load('MRIT1w.mat');
clc;
tic;

%% Q.A2:
run('TD2/QA2.m');

%% B2:
run('TD2/QB2.m');

%% C2:
run('TD2/QC2.m');

toc;