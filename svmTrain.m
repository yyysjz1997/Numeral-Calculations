function svm = svmTrain(X,Y,kertype,C)

% Options�����������㷨��ѡ�������������optimset�޲�ʱ������һ��ѡ��ṹ�����ֶ�ΪĬ��ֵ��ѡ��
options = optimset;
options.LargeScale = 'off';%LargeScaleָ���ģ������off��ʾ�ڹ�ģ����ģʽ�ر�
options.Display = 'off';    %��ʾ�����

%���ι滮��������⣬����������help quadprog�鿴����
n = length(Y);  %����Y�ά��
H = (Y'*Y).*kernel(X,X,kertype);    
f = -ones(n,1); %fΪ1*n��-1,f�൱��Quadprog�����е�c
A = [];
b = [];
Aeq = Y; %�൱��Quadprog�����е�A1,b1
beq = 0;
lb = zeros(n,1); %�൱��Quadprog�����е�LB��UB
ub = C*ones(n,1);
a0 = zeros(n,1);  % a0�ǽ�ĳ�ʼ����ֵ
[a,fval,eXitflag,output,lambda]  = quadprog(H,f,A,b,Aeq,beq,lb,ub,a0,options);
%a���������������Ľ�
%fval��Ŀ�꺯���ڽ�a����ֵ
%eXitflag>0,����������ڽ�x��=0�����ļ���ﵽ����������<0�������޿��н⣬���������ʧ��
%output����������е�ĳЩ��Ϣ
%lambdaΪ�ڽ�a����ֵLagrange����

epsilon = 1e-8;  
 %0<a<a(max)����ΪxΪ֧������,find����һ����������X��ÿ������Ԫ�ص����������������� 
sv_label = find(abs(a)>epsilon) ;   
svm.a = a(sv_label);
svm.Xsv = X(:,sv_label);
svm.Ysv = Y(sv_label);
svm.svnum = length(sv_label);
%svm.label = sv_label;
end

