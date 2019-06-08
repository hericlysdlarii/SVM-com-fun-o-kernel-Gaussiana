%% Inicialização
clear ; close all; clc

%Carregando os dados
load('ex6data1.mat');

% Plotando o dataset 1
% X:matriz de características dos exemplos de treinamento
% Y: alvo (+) positivo (o) negativo
plotData(X, y);

% Treinando o SVM linear
C = [1,10,100,1000];
% @linearKernel -> função kernel
% 1e-3 -> determina o limite de casas para comparar 2 números flutuantes
% 10 -> número de iterações
model1 = svmTrain(X, y, C(1), @linearKernel, 1e-3, 10);
model2 = svmTrain(X, y, C(2), @linearKernel, 1e-3, 10);
model3 = svmTrain(X, y, C(3), @linearKernel, 1e-3, 10);
model4 = svmTrain(X, y, C(4), @linearKernel, 1e-3, 10);

%Função que plota a fonteira de decisão
visualizeBoundaryLinear(X, y, model1, model2, model3, model4);

% Avaliando a função Kernel que deve ser implementada em gaussianKernel.m

x1 = [1 2 1]; x2 = [0 4 -1]; sigma = 2;
sim = gaussianKernel(x1, x2, sigma);

fprintf('O valor da função gaussiana é ...\n') 
sim

% a fim de validar o resultado, o valor retornado por sim para os parâmetros 
% acima deve 0.32465

% Carregando e vizualizando o dataset2 
load('ex6data2.mat');

% Plotando o dataset2
% X:matriz de características dos exemplos de treinamento
% Y: alvo (+) positivo (o) negativo
figure
plotData(X, y);
fprintf('Isso pode levar alguns minutinhos ...\n');

% SVM Parameters
C = 1; 
sigma1 = 0.01;
sigma2 = 0.03;
sigma3 = 0.1;
sigma4 = 0.3;
sigma5 = 1;

model1= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma1));
model2= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma2));
model3= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma3));
model4= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma4));
model5= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma5));

visualizeBoundary(X, y, model1, model2, model3, model4, model5);

