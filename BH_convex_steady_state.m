n=250;
R=5;
E=0.1;
H=1;
xlin = linspace(0,H,n);
alphalin = linspace(1,4,n);
ss = zeros(n,3);

for j=1:n
myfun = @(x,alpha) R*(1-E)*x^alpha/(1+(R-1)/H*(1-E)*x^alpha)-x;  % parameterized function
alpha = alphalin(j);                    % parameter
fun = @(x) myfun(x,alpha);    % function of x alone
for i=1:n
    x(i) = fzero(fun,xlin(i));
    if x(i)<0
        x(i) = 0;
    end
end
x(isnan(x))=0;
ss(j,1:length(uniquetol(x,10^(-2)))) = uniquetol(x,10^(-2));
end
alphaplot=zeros(n,size(ss,2));
for j=1:n
    alphaplot(j,:) = alphalin(j);
end

subplot(1,3,1);
scatter(reshape(alphaplot,[],1),reshape(ss,[],1),'filled')

R=5;
E=0.7;
H=1;
xlin = linspace(0,H,n);
alphalin = linspace(1,1.5,n);
ss = zeros(n,3);

for j=1:n
myfun = @(x,alpha) R*(1-E)*x^alpha/(1+(R-1)/H*(1-E)*x^alpha)-x;  % parameterized function
alpha = alphalin(j);                    % parameter
fun = @(x) myfun(x,alpha);    % function of x alone
for i=1:n
    x(i) = fzero(fun,xlin(i));
    if x(i)<0
        x(i) = 0;
    end
end
x(isnan(x))=0;
ss(j,1:length(uniquetol(x,10^(-2)))) = uniquetol(x,10^(-2));
end
alphaplot=zeros(n,size(ss,2));
for j=1:n
    alphaplot(j,:) = alphalin(j);
end

subplot(1,3,2);
scatter(reshape(alphaplot,[],1),reshape(ss,[],1),'filled')

R=5;
E=0.9;
H=1;
xlin = linspace(0,H,n);
alphalin = linspace(1,4,n);
ss = zeros(n,3);

for j=1:n
myfun = @(x,alpha) R*(1-E)*x^alpha/(1+(R-1)/H*(1-E)*x^alpha)-x;  % parameterized function
alpha = alphalin(j);                    % parameter
fun = @(x) myfun(x,alpha);    % function of x alone
for i=1:n
    x(i) = fzero(fun,xlin(i));
    if x(i)<0
        x(i) = 0;
    end
end
x(isnan(x))=0;
ss(j,1:length(uniquetol(x,10^(-2)))) = uniquetol(x,10^(-2));
end
alphaplot=zeros(n,size(ss,2));
for j=1:n
    alphaplot(j,:) = alphalin(j);
end

subplot(1,3,3);
scatter(reshape(alphaplot,[],1),reshape(ss,[],1),'filled')