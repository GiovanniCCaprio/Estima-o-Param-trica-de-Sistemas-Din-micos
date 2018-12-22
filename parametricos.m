    %% C�digo ARX 

    clc
    clear all
    
    load dados.mat      %carrega os dados
    
    Z = [y u];          %gera vetor entradas por sa�da
    periodogram(y),hold on      %mostra o periodograma das sa�das
    title('Periodograma')
    NN= [1 1 1];      %mostra os coef a se utilizar em na, nb e nk
    TH_arx = iv4(Z,NN)  %gera a parametriza��o ARX
    figure(2)
    plot(TH_arx)
    IU=1;               %default
    [NUM,DEN] = th2tf(TH_arx,IU)    %gera a f.t. associada a parametriza��o
    E=pe(TH_arx,Z);     %compara a parametriza��o com os dados gerando um erro
    soma_erro=0;                    
    for i=1:size(E)
    soma_erro= soma_erro + (E(i)^2);
    end
    soma_erro           %geramos a soma do erro m�dio quadrado para analise
    lag=10;             %queremos analisar o gr�fico de cov com um lag 10   
    
    %Gera Gr�fico da Covari�ncia
    ir=covf(E,lag); ir=ir/ir(1);
    t=0:(lag-1); l=ones(lag,1)*1.96/sqrt(length(E)); % Gera o intervalo de confian�a
    plot(t,ir,t,l,'k:',t,-l,'k:',0,1,'k.',0,-1,'k.')
    title('Gr�fico de Covari�ncia')
    
    %% C�gido ARMAX
    
    
    clc
    clear all
    
    load dados.mat      %carrega os dados
    figure(1)
    Z = [y u];          %gera vetor entradas por sa�da
    periodogram(y)      %mostra o periodograma das sa�das
    title('Periodograma')
    NN= [2 2 2 1];      %mostra os coef a se utilizar em na, nb, nc e nk
    TH_armax = armax(Z,NN,'trace')    %gera a parametriza��o ARMAX
    figure(2)
    plot(TH_armax)
    IU=1;               %default
    [NUM,DEN] = th2tf(TH_armax,IU)    %gera a f.t. associada a parametriza��o
    E=pe(TH_armax,Z);     %compara a parametriza��o com os dados gerando um erro
    soma_erro=0;                    
    for i=1:size(E)
    soma_erro= soma_erro + (E(i)^2);
    end
    soma_erro           %geramos a soma do erro m�dio quadrado para analise
    lag=10;             %queremos analisar o gr�fico de cov com um lag 10   
   
    %Gera Gr�fico da Covari�ncia
    ir=covf(E,lag); ir=ir/ir(1);
    t=0:(lag-1); l=ones(lag,1)*1.96/sqrt(length(E)); % Gera o intervalo de confian�a
    plot(t,ir,t,l,'k:',t,-l,'k:',0,1,'k.',0,-1,'k.')
    title('Gr�fico de Covari�ncia')