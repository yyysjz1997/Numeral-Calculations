


function K = kernel(X,Y,type)
%X 维数*个数
switch type
case 'linear'   %此时代表线性核
    K = X'*Y;
case 'rbf'      %此时代表高斯核
    delta = 5;
    delta = delta*delta;
    XX = sum(X'.*X',2);%2表示将矩阵中的按行为单位进行求和
    YY = sum(Y'.*Y',2);
    XY = X'*Y;
    K = abs(repmat(XX,[1 size(YY,1)]) + repmat(YY',[size(XX,1) 1]) - 2*XY);
    K = exp(-K./delta);
end
end