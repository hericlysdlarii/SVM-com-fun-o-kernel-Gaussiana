function visualizeBoundaryLinear(X, y, model1, model2, model3, model4)
% Essa função plota a fronteira de decisão linear 
% definida no treinamento do SVM

% f(x) = wx + b
% x -> amostras de treino
% w -> vetor de coeficientes gerado pelo modelo treinado
% wx -> produto escalar, onde é calculada a soma dos produtos dos componentes vetoriais 
% b -> uma constante que define o viés do modelo

w = model1.w;
b = model1.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
plotData(X, y);
title('Fronteira de decisão');
hold on;
plot(xp, yp, 'linewidth', 2); 

w = model2.w;
b = model2.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
hold on;
plot(xp, yp, 'linewidth', 2); 

w = model3.w;
b = model3.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
hold on;
plot(xp, yp, 'linewidth', 2); 

w = model4.w;
b = model4.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
hold on;
plot(xp, yp, 'linewidth', 2); 


legend('positivo', 'negativo', 'para C=1', 'para C=10', 'para C=100', 'para C=1000');


hold off;

end
