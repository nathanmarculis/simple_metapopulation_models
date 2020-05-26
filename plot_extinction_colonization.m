% parameters
alpha = 1.5;
alpha2 = 2;
beta = 1.5;
beta2 = 2;
beta3 = 0.5;
beta4 = 0.75;
E = 0.5;
n = 1000;
p = linspace(0,1,n);

subplot(1,2,1);
hold on
plot(p,p,'k--','LineWidth',2);
plot(p,(1-E)*p, 'k-','LineWidth',2);
plot(p,(1-E)*p.^alpha,'b-','LineWidth',2);
plot(p,(1-E)*p.^alpha2,'b--','LineWidth',2);
%plot(p,beta3*(1-E)*p./(1+(beta3-1)*p),'b-','LineWidth',2);
%plot(p,beta4*(1-E)*p./(1+(beta4-1)*p),'b--','LineWidth',2);
plot(p,beta*(1-E)*p./(1+(beta-1)*p),'r-','LineWidth',2);
plot(p,beta2*(1-E)*p./(1+(beta2-1)*p),'r--','LineWidth',2);
legend('$g(p)=p$','$Linear$','$\alpha = 1.5$','$\alpha = 2$','$\beta = 1.5$','$\beta = 2$')
hold off

% parameters
M1 = 3;
M2 = 3;
H = 1;
n = 1000;
p = linspace(0,1.1,n);
subplot(1,2,2);
hold on
plot(p,p,'k--','LineWidth',2);
plot(p,M1*p./(1+(M1-1)/H.*p), 'b-','LineWidth',2);
plot(p,M2*p.*(H-p),'r-','LineWidth',2);
plot(p,p.*exp(log(M2)*(1-p/H)),'k-','LineWidth',2)
legend('$f(p)=p$','Beverton-Holt','Logistic','Ricker')
hold off