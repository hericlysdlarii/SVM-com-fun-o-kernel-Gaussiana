%% Inicialização
clear ; close all; clc

%Carregando a amostra
file_contents = readFile('emailSample3.txt');

fprintf('\nRealizando a limpeza ...\n');

% Pré-processando o texto
word_indices = processEmail(file_contents);

fprintf('Indice das Palavras: \n');
fprintf(' %d', word_indices);
fprintf('\n\n');

% Extraindo Características 
fprintf('\nExtraindo as características ...\n');
fprintf('\n\n');
features = emailFeatures(word_indices);

fprintf('Tamanho do vetor de características: %d\n', length(features));
fprintf('Número de entradas diferentes de  zero: %d\n\n', sum(features > 0));
  
x = sum(features);
y = length(file_contents);

if (x > (y/4))
  fprintf('O email é um spam!\n');
end

if (x <= (y/4))
  fprintf('O email não é um spam!\n');
end


% Carregando o conjunto de treinamento (X, y) 
load('spamTrain.mat');

fprintf('\nTreinando o SVM (Spam Classification), isso pode levar alguns minutinhos ... \n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);

fprintf('Acurária de treinamento: %f\n', mean(double(p == y)) * 100);

% Load the test dataset
% % Carregando o conjunto de treinamento (Xtest,ytest) 
load('spamTest.mat');

% Realizando a classificação na base de teste a partir do modelo treinado
p = svmPredict(model, Xtest);

fprintf('Acurácia de Teste: %f\n', mean(double(p == ytest)) * 100);
pause;



