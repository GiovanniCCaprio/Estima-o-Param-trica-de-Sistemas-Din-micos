    %% Código ARX 

    clc
    clear all
    
    load dados.mat      %carrega os dados
    
    Z = [y u];          %gera vetor entradas por saída
    periodogram(y),hold on      %mostra o periodograma das saídas
    title('Periodograma')
    NN= [1 1 1];      %mostra os coef a se utilizar em na, nb e nk
    TH_arx = iv4(Z,NN)  %gera a parametrização ARX
    figure(2)
    plot(TH_arx)
    IU=1;               %default
    [NUM,DEN] = th2tf(TH_arx,IU)    %gera a f.t. associada a parametrização
    E=pe(TH_arx,Z);     %compara a parametrização com os dados gerando um erro
    soma_erro=0;                    
    for i=1:size(E)
    soma_erro= soma_erro + (E(i)^2);
    end
    soma_erro           %geramos a soma do erro médio quadrado para analise
    lag=10;             %queremos analisar o gráfico de cov com um lag 10   
    
    %Gera Gráfico da Covariância
    ir=covf(E,lag); ir=ir/ir(1);
    t=0:(lag-1); l=ones(lag,1)*1.96/sqrt(length(E)); % Gera o intervalo de confiança
    plot(t,ir,t,l,'k:',t,-l,'k:',0,1,'k.',0,-1,'k.')
    title('Gráfico de Covariância')
    
    %% Cógido ARMAX
    
    
    clc
    clear all
    
    load dados.mat      %carrega os dados
    figure(1)
    Z = [y u];          %gera vetor entradas por saída
    periodogram(y)      %mostra o periodograma das saídas
    title('Periodograma')
    NN= [2 2 2 1];      %mostra os coef a se utilizar em na, nb, nc e nk
    TH_armax = armax(Z,NN,'trace')    %gera a parametrização ARMAX
    figure(2)
    plot(TH_armax)
    IU=1;               %default
    [NUM,DEN] = th2tf(TH_armax,IU)    %gera a f.t. associada a parametrização
    E=pe(TH_armax,Z);     %compara a parametrização com os dados gerando um erro
    soma_erro=0;                    
    for i=1:size(E)
    soma_erro= soma_erro + (E(i)^2);
    end
    soma_erro           %geramos a soma do erro médio quadrado para analise
    lag=10;             %queremos analisar o gráfico de cov com um lag 10   
   
    %Gera Gráfico da Covariância
    ir=covf(E,lag); ir=ir/ir(1);
    t=0:(lag-1); l=ones(lag,1)*1.96/sqrt(length(E)); % Gera o intervalo de confiança
    plot(t,ir,t,l,'k:',t,-l,'k:',0,1,'k.',0,-1,'k.')
    title('Gráfico de Covariância')