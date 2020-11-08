%Nora Basha- 10/21/2019 - ECE 565
%Non-linear LeastSquares Ten Iterations with 3 Anchor Nodes
NewNominalx=0;
NewNominaly=0;
for k=1:10
Xco=[1,1,-1];
Yco=[1,-1,1];
d=[];
for i=1:3
    d(i)=sqrt((0.3-Xco(i))^2+(-0.2-Yco(i))^2);
    syms x y
    Y(i)=sqrt((x-Xco(i))^2+(y-Yco(i))^2);
end
 s =jacobian(Y,[x,y]);
 x=NewNominalx;
 y=NewNominaly;
 nom= double(subs(Y));
 Jacob= double(subs(s));
 Estimation=(((Jacob.' * Jacob)^-1)* Jacob.' *(d-nom).')+[NewNominalx ; NewNominaly];
 fprintf('Iteration Number= %d\n',k)
 fprintf('X coordinate of Location= %d\n',Estimation(1,1))
 fprintf('Y coordinate of Location= %d\n',Estimation(2,1))
 NewNominalx= Estimation(1,1);
 NewNominaly=Estimation(2,1);
end
