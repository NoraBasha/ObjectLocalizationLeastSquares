%Nora Basha- 10/21/2019 - ECE 565
%Non-linear LeastSquares Ten Iterations with Four Anchor Nodes
NewNominalx=0;
NewNominaly=0;
for k=1:10
%Observations and Model Matrices
Xco=[1,1,-1,-1];
Yco=[1,-1,1,-1];
d=[];
for i=1:4
    d(i)=sqrt((0.3-Xco(i))^2+(-0.2-Yco(i))^2);
    syms x y
    Y(i)=sqrt((x-Xco(i))^2+(y-Yco(i))^2);
end
%Linearization
 s =jacobian(Y,[x,y]);
 x=NewNominalx;
 y=NewNominaly;
 nom= double(subs(Y));
 Jacob= double(subs(s));
 %Least Squares Estimation
 Estimation=(((Jacob.' * Jacob)^-1)* Jacob.' *(d-nom).')+[NewNominalx ; NewNominaly];
 fprintf('Iteration Number= %d\n',k)
 fprintf('X coordinate of Location= %d\n',Estimation(1,1))
 fprintf('Y coordinate of Location= %d\n',Estimation(2,1))
 %Nominal point updating
 NewNominalx= Estimation(1,1);
 NewNominaly=Estimation(2,1);
end
