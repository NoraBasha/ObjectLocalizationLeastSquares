d(1)=sqrt((0.3-1)^2+(-0.2-1)^2);
d(2)=sqrt((0.3-1)^2+(-0.2+1)^2);
d(3)=sqrt((0.3+1)^2+(-0.2-1)^2);
d(4)=sqrt((0.3+1)^2+(-0.2+1)^2);
% v=[1 1;1 -1;-1 1;-1 -1];
% k=1;
% for i=1:4
%     for j=1:2
%     Y(k)= sqrt((0.3-v(i,j))^2+(-0.2-v(i,j+1))^2);
%     k=k+1;
%     
%     end
%    k=k+1;
%    
% end
syms x y

Y(1)=sqrt((x-1)^2+(y-1)^2);
Y(2)=sqrt((x-1)^2+(y+1)^2);
Y(3)=sqrt((x+1)^2+(y-1)^2);
Y(4)=sqrt((x+1)^2+(y+1)^2);
s =jacobian(Y,[x,y])
x=0;
y=0;
nom= double(subs(Y))
Jacob= double(subs(s))
Estimation=(((Jacob.' * Jacob)^-1)* Jacob.' *(d-nom).')+[0;0]





