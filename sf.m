function []=sf(a,b,m,M,d) 
% ���Ӷ���ʽa����ĸ����ʽb����������m,��������M,�Լ����㾫��d 
f=poly2sym(a)/poly2sym(b)     %���ڸ��û���ʾ������������ʽ
%�������ι�ʽ�������ֵ����  
disp('�������ι�ʽ������ֵ���ֵĽ��') 
kk=zeros();   %���ڴ�Ž��

kk(1,1)=1/2*(M-m)/1*(subs(f,'x',m)+subs(f,'x',M)) %�ȴ洢����
for i=1:1:2^30    
    t=0;       
    for j=0:1:2^(i-1)-1                       
        v=m+(2*j+1)*(M-m)/(2^i)           
        vv=polyval(a,v)/polyval(b,v);       
        t=t+(M-m)/(2^i)*vv       
    end
    y=1/2*kk(i,1)+t                          %ͨ�ʽ�������ֵ   
    kk(i+1,1)=y                              %�洢������   
    f=i+1;                                  %��¼����������ֵ���±�      
    if(1/3*(kk(i+1,1)-kk(i,1))<=d)        
        break;         
    end
end 
fprintf('The result is %f\n', kk(f,1))