%%%%%%%%%%%%%%%%%%%%%%%
% Various Contiditons %
%%%%%%%%%%%%%%%%%%%%%%%

%set 1
x0 = [0 0 0 0 0 0 0 0 0 5 5 10]'; % step signal input (hover)
u0 = [-12.6; 12.6; 25.3; 8];
y0 = x0;

% set 2 works
% x0 = [0 0 0 0 0 0 0 0 0 20 10 20]'; % ramp signal input with slope of 1 (x), run for 80s
% u0 = [0; 12.57; 25.3; 8];
% y0 = x0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%commands to trim and linearise %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to trim

[x1,u1,y1,dx] = trim('HeliModel', x0, u0, y0);

%to linearise
%note that it takes the steady state values from the trim command

[A,B,C,D]=linmod('HeliModel',x1,u1);



% save the vectors and extract state space
%set 1
save('A1',"A");
save('B1',"B");
save('C1',"C");
save('D1',"D");


% set2
% save('A2',"A");
% save('B2',"B");
% save('C2',"C");
% save('D2',"D");