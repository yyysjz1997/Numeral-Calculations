function[] = Romberg(a,b,m,M,d)
disp('请输入分子多项式a，分母多项式b，积分下限m，积分上限M，计算精度')
f = poly2sym(a)/poly2sym(b)                      %用于给用户显示被积函数的形式 
disp('利用梯形公式计算数值积分的结果')
kk = zeros();
kk(1,1)=1/2*(M-m)/1*(subs(f,'x',m)+subs(f,'x',M)); %先存储首项?
for  i=1:1:2^40
    t=0;
    for  j=0:1:2^(i-1)-1
        v=m+(2*j+1)*(M-m)/(2^i);
        vv=polyval(a,v)/polyval(b,v);
        t=t+(M-m)/(2^i)*vv;
    end
    y=1/2*kk(i,1)+t;  %通项公式计算各项值?????????
    kk(i+1,1)=y %存储其他项?
    if(abs(1/3*(kk(i+1,1)-kk(i,1)))<=d)  %判断梯形公式值是否达到要求????
        disp('The?result?is:')
        kk()
        kk(i+1,1)%梯形值满足要求，输出结果??????????
        break;
    else
        s=(4*kk(i+1,1)-kk(i,1))/(4-1);%构造simpson各项?????????
        kk(i+1,2)=s %存储????????????
        if(i+1>=3)
            if(i+1>=3 & abs(1/15*(kk(i+1,2)-kk(i,2)))<=d)
                kk()
                disp('The result is:')
                kk(i+1,2) %simpson值满足要求，输出结果?
                pan1=0;
                break;
            else
                c=(4^2*kk(i+1,2)-kk(i,2))/(4^2-1);%构造cotes值????????????????????
                kk(i+1,3)=c%存储cotes值
            if(i+1>=4)
                if(i+1>=4 & abs(1/63*(kk(i+1,3)-kk(i,3)))<=d)
                     disp('The result is:')
                     kk(i+1,3)
                     break;
                else
                     r=(4^3*kk(i+1,3)-kk(i,3))/(4^3-1)%构造romberg值????
                     kk(i+1,4)=r%存储romberg值????
                if(i+1>=5)
                     if(i+1>=5 & abs(1/127*(kk(i+1,4)-kk(i,4)))<=d)
                         disp('The result is:')
                         kk(i+1,4)
                         break;
                     end
                end
                end
            end
            end
        end
    end
end

