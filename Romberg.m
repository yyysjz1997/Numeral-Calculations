function[] = Romberg(a,b,m,M,d)
disp('��������Ӷ���ʽa����ĸ����ʽb����������m����������M�����㾫��')
f = poly2sym(a)/poly2sym(b)                      %���ڸ��û���ʾ������������ʽ 
disp('�������ι�ʽ������ֵ���ֵĽ��')
kk = zeros();
kk(1,1)=1/2*(M-m)/1*(subs(f,'x',m)+subs(f,'x',M)); %�ȴ洢����?
for  i=1:1:2^40
    t=0;
    for  j=0:1:2^(i-1)-1
        v=m+(2*j+1)*(M-m)/(2^i);
        vv=polyval(a,v)/polyval(b,v);
        t=t+(M-m)/(2^i)*vv;
    end
    y=1/2*kk(i,1)+t;  %ͨ�ʽ�������ֵ?????????
    kk(i+1,1)=y %�洢������?
    if(abs(1/3*(kk(i+1,1)-kk(i,1)))<=d)  %�ж����ι�ʽֵ�Ƿ�ﵽҪ��????
        disp('The?result?is:')
        kk()
        kk(i+1,1)%����ֵ����Ҫ��������??????????
        break;
    else
        s=(4*kk(i+1,1)-kk(i,1))/(4-1);%����simpson����?????????
        kk(i+1,2)=s %�洢????????????
        if(i+1>=3)
            if(i+1>=3 & abs(1/15*(kk(i+1,2)-kk(i,2)))<=d)
                kk()
                disp('The result is:')
                kk(i+1,2) %simpsonֵ����Ҫ��������?
                pan1=0;
                break;
            else
                c=(4^2*kk(i+1,2)-kk(i,2))/(4^2-1);%����cotesֵ????????????????????
                kk(i+1,3)=c%�洢cotesֵ
            if(i+1>=4)
                if(i+1>=4 & abs(1/63*(kk(i+1,3)-kk(i,3)))<=d)
                     disp('The result is:')
                     kk(i+1,3)
                     break;
                else
                     r=(4^3*kk(i+1,3)-kk(i,3))/(4^3-1)%����rombergֵ????
                     kk(i+1,4)=r%�洢rombergֵ????
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

