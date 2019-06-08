function x = emailFeatures(word_indices)

% Número total de palavras do dicionário
n = 1899;

% Inicializando o vetor de características
x = zeros(n, 1);

% Pegue o word_indices e contrua um vetor de característica binário 
% que indica se uma determinada palavra ocorre (1) ou não ocorre (0) no e-mail.
m = length(word_indices);

for i=1:n
  for j=1:m
     if (word_indices(j) == i)
       x(i) = 1;
     end
  end
end
 
endfunction
