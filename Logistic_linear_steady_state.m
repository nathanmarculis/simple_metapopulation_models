% Parameter values
n = 1000;
M = linspace(1,10,n);
E = linspace(0,1,n);

for i=1:n
    H1 = 0.2;
    for j=1:n
        if M(i) > 1/(H1*(1-E(j))) && M(i) < 3/(H1*(1-E(j))) %&& M(i) < 1/((1-E(j))*(H1+E(j)-1))
            steady_state1(i,j) = H1/(1-E(j)) - 1/(M(i)*(1-E(j))^2);
        elseif M(i) > 3/(H1*(1-E(j)))
            steady_state1(i,j) = NaN;
        elseif M(i) > 1/((1-E(j))*(H1*E(j)))
            steady_state1(i,j) = NaN;
        else
            steady_state1(i,j) = 0;
        end
    end
end

for i=1:n
    H2 = 0.4;
    for j=1:n
        if M(i) > 1/(H2*(1-E(j))) && M(i) < 3/(H2*(1-E(j))) && M(i) < 1/((1-E(j))*(H2*E(j)))
            steady_state2(i,j) = H2/(1-E(j)) - 1/(M(i)*(1-E(j))^2);
        elseif M(i) > 3/(H2*(1-E(j)))
            steady_state2(i,j) = NaN;
        elseif M(i) > 1/((1-E(j))*(H2*E(j)))
            steady_state2(i,j) = NaN;
        else
            steady_state2(i,j) = 0;
        end
    end
end

for i=1:n
    H3 = 0.6;
    for j=1:n
        if M(i) > 1/(H3*(1-E(j))) && M(i) < 3/(H3*(1-E(j))) && M(i) < 1/((1-E(j))*(H3*E(j)))
            steady_state3(i,j) = H3/(1-E(j)) - 1/(M(i)*(1-E(j))^2);
        elseif M(i) > 3/(H3*(1-E(j)))
            steady_state3(i,j) = NaN;
        elseif M(i) > 1/((1-E(j))*(H3*E(j)))
            steady_state3(i,j) = NaN;
        else
            steady_state3(i,j) = 0;
        end
    end
end

Epartial = linspace(1/3,1,n);

subplot(1,3,1);
hold on;
pcolor(E,M,steady_state1);
shading interp;
colorbar;
title('Steady state');
ylabel('Growth rate $(M)$');
plot(E,1./(H1*(1-E)),'w--','LineWidth',2);
axis([0 1 1 10]);
hold off
subplot(1,3,2);
hold on;
pcolor(E,M,steady_state2);
shading interp;
colorbar;
title('Steady state');
xlabel('Probability of patch extinction $(E)$');
plot(E,1./(H2*(1-E)),'w--','LineWidth',2);
plot(E,3./(H2*(1-E)),'k--','LineWidth',2);
axis([0 1 1 10]);
hold off;
subplot(1,3,3);
hold on;
pcolor(E,M,steady_state3);
shading interp;
colorbar;
title('Steady state');
plot(E,1./(H3*(1-E)),'w--','LineWidth',2);
plot(E,3./(H3*(1-E)),'k--','LineWidth',2);
plot(Epartial,1./((H3*Epartial).*(1-Epartial)),'b--','LineWidth',2);
axis([0 1 1 10]);
hold off;