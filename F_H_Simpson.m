function S_n = F_H_Simpson(a,b,n)
h = (b - a) / n;
for k = 0 : n
    x(k+1) = a + k*h;
    x_k(k+1) = x(k+1)+1/2*h;
end

S_1 = h/6*(f(x(1))+f(x(n+1)));
for i = 2:n
    F_1(i) = h/3*f(x(i));
end

for j = 1:n
    F_2(j) = 2*h/3*f(x_k(j));
end

S_2 = sum(F_1)+sum(F_2);
S_n = S_1+S_2;

    

