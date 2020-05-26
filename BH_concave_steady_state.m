n=500;
M=5;
E=0.1;
H=1;
xlin = linspace(0,2,n);
betalin = linspace(1,1/(1-E),n);
ss = zeros(n,3);

for j=1:n
myfun = @(x,beta) (M*beta*(1-E)*x/(1+(beta-1)*x))/(1+(M-1)/(H)*beta*(1-E)*x/(1+(beta-1)*x))-x;  % parameterized function
beta = betalin(j);                    % parameter
fun = @(x) myfun(x,beta);    % function of x alone
for i=1:n
    x(i) = fzero(fun,xlin(i));
    if x(i)<0
        x(i) = 0;
    end
end
x(isnan(x))=0;
ss(j,1:length(uniquetol(x,10^(-2)))) = uniquetol(x,10^(-2));
end
betaplot=zeros(n,size(ss,2));
for j=1:n
    betaplot(j,:) = betalin(j);
end

subplot(1,2,1);
scatter(reshape(betaplot,[],1),reshape(ss,[],1),'filled');
if 1/((1-E)*M)>1
    xline(1/((1-E)*M),'k','LineWidth',2);
end

M=5;
E=0.9;
H=1;
xlin = linspace(0,2,n);
betalin = linspace(1,1/(1-E),n);
ss = zeros(n,3);

for j=1:n
myfun = @(x,beta) (M*beta*(1-E)*x/(1+(beta-1)*x))/(1+(M-1)/(H)*beta*(1-E)*x/(1+(beta-1)*x))-x;  % parameterized function
beta = betalin(j);                    % parameter
fun = @(x) myfun(x,beta);    % function of x alone
for i=1:n
    x(i) = fzero(fun,xlin(i));
    if x(i)<0
        x(i) = 0;
    end
end
x(isnan(x))=0;
ss(j,1:length(uniquetol(x,10^(-2)))) = uniquetol(x,10^(-2));
end
betaplot=zeros(n,size(ss,2));
for j=1:n
    betaplot(j,:) = betalin(j);
end

subplot(1,2,2);
scatter(reshape(betaplot,[],1),reshape(ss,[],1),'filled');
if 1/((1-E)*M)>1
    xline(1/((1-E)*M),'k','LineWidth',2);
end
