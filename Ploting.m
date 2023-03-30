% Linear model
x = X.Data(:,1);
y = Y.Data(:,1);
z = Z.Data(:,1);

% Nonlinear model
x1 = X1.Data(:,1);
y1 = Y1.Data(:,1);
z1 = Z1.Data(:,1);

% delete off set
% x1 = x1 - 40;
% y1 = y1 - 5;
% z1 = z1 - 20;

%%%%%%%%%%%%%
% nonlinear %
%%%%%%%%%%%%%
figure;
plot(X1.Time,x1);
hold on;
plot(X.Time,x);
title('X position');
grid on;
xlabel('time (s)');
ylabel('displacement');
legend('Nonlinear','Linear')
%ylim([0 5]);
% hold on;
% plot(Y1.Time,y1);
% hold on;
% plot(Z1.Time,z1);
% xlabel('time (s)');
% ylabel('displacement');
% title('Non-Linear Model');
% grid on;
% legend('X','Y','Z');
% ylim([-20 50]);

figure;
plot(Y1.Time,y1);
hold on;
plot(Y.Time,y);
title('Y position');
grid on;
%ylim([0 5]);
xlabel('time (s)');
ylabel('displacement');
legend('Nonlinear','Linear')

figure;
plot(Z1.Time,z1);
hold on;
plot(Z.Time,z);
title('Z position');
grid on;
xlabel('time (s)');
%ylim([0 10]);
ylabel('displacement');
legend('Nonlinear','Linear')

%%%%%%%%%%
% linear %
%%%%%%%%%%

% figure;
% plot(X.Time,x);
% hold on;
% plot(Y.Time,y);
% hold on;
% plot(Z.Time,z);
% xlabel('time (s)');
% ylabel('displacement');
% title('Linear Model');
% grid on;
% legend('X','Y','Z');
% % ylim([-20 50]);

% figure;
% plot(X.Time,x);
% title('Linear Model: X');
% grid on;
% xlabel('time (s)');
% ylabel('displacement');
% 
% figure;
% plot(Y.Time,y);
% title('Linear Model: Y');
% grid on;
% xlabel('time (s)');
% ylabel('displacement');
% 
% figure;
% plot(Z.Time,z);
% title('Linear Model: Z');
% grid on;
% xlabel('time (s)');
% ylabel('displacement');
