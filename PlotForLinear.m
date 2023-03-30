%%%%%%%%%%
% Linear %
%%%%%%%%%%
% a1 = Result.Data(1,:)+x1(1,1);
% a2 = Result.Data(2,:)+x1(2,1);
% a3 = Result.Data(3,:)+x1(3,1);
% a4 = Result.Data(4,:)+x1(4,1);
% a5 = Result.Data(5,:)+x1(5,1);
% a6 = Result.Data(6,:)+x1(6,1);
% a7 = Result.Data(7,:)+x1(7,1);
% a8 = Result.Data(8,:)+x1(8,1);
% a9 = Result.Data(9,:)+x1(9,1);
% a10 = Result.Data(10,:)+x1(10,1);
% a11 = Result.Data(11,:)+x1(11,1);
% a12 = Result.Data(12,:)+x1(12,1);

a1 = Result.Data(1,:);
a2 = Result.Data(2,:);
a3 = Result.Data(3,:);
a4 = Result.Data(4,:);
a5 = Result.Data(5,:);
a6 = Result.Data(6,:);
a7 = Result.Data(7,:);
a8 = Result.Data(8,:);
a9 = Result.Data(9,:);
a10 = Result.Data(10,:);
a11 = Result.Data(11,:);
a12 = Result.Data(12,:);

%plot
figure;
plot(Result.Time, a1);
hold on;
plot(Result.Time, a2);
plot(Result.Time, a3);
plot(Result.Time, a4);
plot(Result.Time, a5);
plot(Result.Time, a6);
plot(Result.Time, a7);
plot(Result.Time, a8);
plot(Result.Time, a9);
plot(Result.Time, a10);
plot(Result.Time, a11);
plot(Result.Time, a12);
grid on;
xlabel('time/sec');
%ylim([-1 12]);
ylabel('Displacement/units');
title('Linear');
legend('forward velocity error','lateral velocity error','vertical velocity error','roll rate error', 'pitich rate error','yaw rate error','roll error','pitch error','yaw error','X error','Y error','Z error');
%legend('forward velocity','lateral velocity','vertical velocity','roll rate', 'pitich rate','yaw rate','roll','pitch','yaw','X','Y','Z');
% 
% %%%%%%%%%%%%%%
% % Non Linear %
% %%%%%%%%%%%%%%
b1 = Result1.Data(:,1);
b2 = Result1.Data(:,2);
b3 = Result1.Data(:,3);
b4 = Result1.Data(:,4);
b5 = Result1.Data(:,5);
b6 = Result1.Data(:,6);
b7 = Result1.Data(:,7);
b8 = Result1.Data(:,8);
b9 = Result1.Data(:,9);
b10 = Result1.Data(:,10);
b11 = Result1.Data(:,11);
b12 = Result1.Data(:,12);

% plot
figure;
plot(Result1.Time, b1);
hold on;
plot(Result1.Time, b2);
plot(Result1.Time, b3);
plot(Result1.Time, b4);
plot(Result1.Time, b5);
plot(Result1.Time, b6);
plot(Result1.Time, b7);
plot(Result1.Time, b8);
plot(Result1.Time, b9);
plot(Result1.Time, b10);
plot(Result1.Time, b11);
plot(Result1.Time, b12);
grid on;
xlabel('time/sec');
ylim([-1 12]);
ylabel('Displacement/units');
title('Non Linear');
legend('X','Y','Z','forward velocity','lateral velocity','vertical velocity','roll rate', 'pitich rate','yaw rate','roll','pitch','yaw');
% 
% % PID
c1 = Result2.Data(:,1);
c2 = Result2.Data(:,2);
c3 = Result2.Data(:,3);
c4 = Result2.Data(:,4);
c5 = Result2.Data(:,5);
c6 = Result2.Data(:,6);
c7 = Result2.Data(:,7);
c8 = Result2.Data(:,8);
c9 = Result2.Data(:,9);
c10 = Result2.Data(:,10);
c11 = Result2.Data(:,11);
c12 = Result2.Data(:,12);

% plot
figure;
plot(Result2.Time, c1);
hold on;
plot(Result2.Time, c2);
plot(Result2.Time, c3);
plot(Result2.Time, c4);
plot(Result2.Time, c5);
plot(Result2.Time, c6);
plot(Result2.Time, c7);
plot(Result2.Time, c8);
plot(Result2.Time, c9);
plot(Result2.Time, c10);
plot(Result2.Time, c11);
plot(Result2.Time, c12);
grid on;
xlabel('time/sec');
%ylim([-1 12]);
ylabel('Displacement/units');
title('PID controller');
legend('X','Y','Z','forward velocity','lateral velocity','vertical velocity','roll rate', 'pitich rate','yaw rate','roll','pitch','yaw');