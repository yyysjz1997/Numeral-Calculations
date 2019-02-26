


function K = kernel(X,Y,type)
%X ά��*����
switch type
case 'linear'   %��ʱ�������Ժ�
    K = X'*Y;
case 'rbf'      %��ʱ�����˹��
    delta = 5;
    delta = delta*delta;
    XX = sum(X'.*X',2);%2��ʾ�������еİ���Ϊ��λ�������
    YY = sum(Y'.*Y',2);
    XY = X'*Y;
    K = abs(repmat(XX,[1 size(YY,1)]) + repmat(YY',[size(XX,1) 1]) - 2*XY);
    K = exp(-K./delta);
end
end