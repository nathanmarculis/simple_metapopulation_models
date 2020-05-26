% Parameter values
n = 2000;
M = linspace(1,10,n);
E = linspace(0,1,n);
H = 1;
T = 1000;
p(1)= 0.1;

Epartial = linspace(1-2/3*H,1,n);
Epartial2 = linspace(0,0.5,n);

% for j=1:n
%     for i=1:n      
%         for t=1:T
%             p(t+1) = M(i)*(1-E(j))*p(t)*(H-(1-E(j))*p(t));
%         end
%         if max(p) < 1
%             M1(i) = M(i);
%         else
%             M1(i) = 0;
%         end
%     end
%     [val, idx] = max(M1);
%     if idx == n
%        Mplot(j)=M(idx)+1;
%     else
%        Mplot(j)=M(idx+1);
%     end
% end

%E_interp = linspace(min(E), max(E));
%Mplot_interp = interp1(E, Mplot, E_interp, 'pchip');

subplot(1,2,1);
hold on;
title('Parameter space');
rectangle('Position',[0 3 0.5 2],'LineStyle','--','EdgeColor','b','LineWidth',2);
plot(E,1./(H*(1-E)),'k-','LineWidth',2);
plot(E,3./(H*(1-E)),'k-','LineWidth',2);
plot(E,(1+sqrt(6))./(H*(1-E)),'k-','LineWidth',2);
plot(E,3.54409./(H*(1-E)),'k-','LineWidth',2);
plot(E,3.56995./(H*(1-E)),'k-','LineWidth',2);
plot(E,4./(H*(1-E)),'k-','LineWidth',2);
%plot(Epartial,1./((H+Epartial-1).*(1-Epartial)),'k-','LineWidth',2);
plot(Epartial2,4/H*Epartial2./Epartial2,'r-','LineWidth',2);
%plot(E,Mplot,'r-','LineWidth',2);
axis([0 1 1 10]);
xlabel('Probability of patch extinction $(E)$');
ylabel('Growth rate $(M)$');
hold off;
subplot(1,2,2);
hold on;
title('Zoomed Parameter space');

plot(E,3./(H*(1-E)),'k-','LineWidth',2);
plot(E,(1+sqrt(6))./(H*(1-E)),'k-','LineWidth',2);
plot(E,3.54409./(H*(1-E)),'k-','LineWidth',2);
plot(E,3.56995./(H*(1-E)),'k-','LineWidth',2);
plot(E,4./(H*(1-E)),'k-','LineWidth',2);
%plot(Epartial,1./((H+Epartial-1).*(1-Epartial)),'k-','LineWidth',2);
plot(Epartial2,4/H*Epartial2./Epartial2,'r-','LineWidth',2);
%plot(E,Mplot,'r-','LineWidth',2);
axis([0 0.5 3 5]);
xlabel('Probability of patch extinction $(E)$');
ylabel('Growth rate $(M)$');
hold off;

