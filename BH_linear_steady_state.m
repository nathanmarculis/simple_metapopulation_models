% Parameter values
n = 10000;
M = linspace(1,10,n);
E = linspace(0,1,n);
H = 0.5;

for i=1:n
    for j=1:n
        if M(i) > 1/(1-E(j))
            steady_state(i,j) = H*((M(i)*(1-E(j))-1)/((M(i)-1)*(1-E(j))));
        else
            steady_state(i,j) = 0;
        end
    end
end

hold on;
pcolor(E,M,steady_state);
shading interp;
colorbar;
title('Steady state');
ylabel('Growth rate $(M)$');
xlabel('Probability of patch extinction $(E)$');
plot(E,1./(1-E),'w--','LineWidth',2);
axis([0 1 1 10]);
hold off;