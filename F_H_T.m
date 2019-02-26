function T_n = F_H_T(a,b,n)
h = (b - a) /n;
for k = 0 : n
    x(k+1) = a + k*h;
end

T_1 = h/2*(f(x(1))+f(x(n+1)));

for i = 2 : n
    F(i) = h * f(x(i));
end

T_2 = sum(F);
T_n = T_1 + T_2;