clear all;close all;
L=200;
m=2;
X=rand(2,L)*6;
for ii=1:L
    if ii>L/2
        X(:,ii)=randn(m,1)+[12;2];
    else
        X(:,ii)=randn(m,1)+[2;-6];
    end
end
X1=X(:,1:L/2);
X2=X(:,1+L/2:end);

m1=mean(X1')';
m2=mean(X2')';
%Sd
Sd=(m1-m2)*(m1-m2)';
% Ss
Ss=zeros(m);
for ii=1:L/2
    x1=X1(:,ii);
    x2=X2(:,ii);
    Ss=Ss+(x1-m1)*(x1-m1)'+(x2-m2)*(x2-m2)';
end

[U1,lamda]=eig(inv(Ss)*Sd);

w1=U1(:,1);
A=w1;

x1=-6:0.1:16;
y1=A(2)/A(1)*x1;

P1=A*inv(A'*A)*A'*X1;
P2=A*inv(A'*A)*A'*X2;


figure,hold on;
plot(x1,y1,'b');
plot(X1(1,:),X1(2,:),'r*');
plot(P1(1,:),P1(2,:),'ro');
plot(X2(1,:),X2(2,:),'k*');
plot(P2(1,:),P2(2,:),'ko');

axis([-6 16 -10 12]);
%% PCA
R=X*X';
[U2,lamda2]=svd(R);
w2=U2(:,1);
A=w2;
x1=-6:0.1:16;
y2=A(2)/A(1)*x1;
P1=A*inv(A'*A)*A'*X1;
P2=A*inv(A'*A)*A'*X2;

wsx=U2(:,1)'*X; 

figure,hold on;
plot(x1,y2,'b');
plot(X1(1,:),X1(2,:),'r*');
plot(P1(1,:),P1(2,:),'ro');
plot(X2(1,:),X2(2,:),'k*');
plot(P2(1,:),P2(2,:),'ko');
axis([-6 16 -10 12]);

figure,plot(wsx,'b');
