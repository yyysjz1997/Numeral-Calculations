function []=sf(a,b,m,M,d) 
% 分子多项式a，分母多项式b，积分下限m,积分上限M,以及计算精度d 
f=poly2sym(a)/poly2sym(b)     %用于给用户显示被积函数的形式
%利用梯形公式计算此数值积分  
disp('利用梯形公式计算数值积分的结果') 
kk=zeros();   %用于存放结果

kk(1,1)=1/2*(M-m)/1*(subs(f,'x',m)+subs(f,'x',M)) %先存储首项
for i=1:1:2^30    
    t=0;       
    for j=0:1:2^(i-1)-1                       
        v=m+(2*j+1)*(M-m)/(2^i)           
        vv=polyval(a,v)/polyval(b,v);       
        t=t+(M-m)/(2^i)*vv       
    end
    y=1/2*kk(i,1)+t                          %通项公式计算各项值   
    kk(i+1,1)=y                              %存储其他项   
    f=i+1;                                  %记录符合条件的值的下标      
    if(1/3*(kk(i+1,1)-kk(i,1))<=d)        
        break;         
    end
end 
fprintf('The result is %f\n', kk(f,1))