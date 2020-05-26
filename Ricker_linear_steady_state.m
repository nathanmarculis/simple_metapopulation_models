% Parameter values
n = 1000;
M = linspace(0,2.5,n);
E = linspace(0,1,n);

for i=1:n
    H = 1;
    for j=1:n
        if M(i) > -log(1-E(j)) && M(i) < -log(1-E(j))/E(j) %&& M(i) < 1/((1-E(j))*(H1+E(j)-1))
            steady_state(i,j) = H*(M(i)+log(1-E(j)))/(M(i)*(1-E(j)));
        elseif M(i) > -log(1-E(j))/E(j)
            steady_state(i,j) = NaN;
        else
            steady_state(i,j) = 0;
        end
    end
end


hold on;
pcolor(E,M,steady_state);
shading interp;
colorbar
title('Steady state');
plot(E,-log(1-E),'w--','LineWidth',2);
plot(E,-log(1-E)./E,'k--','LineWidth',2);
plot(E,1./(1-E),'b--','LineWidth',2);
axis([0 1 0 2.5]);
hold off;