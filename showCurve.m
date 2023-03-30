% 显示仿真结果


%=============================================================
%       REFERENCES, RESPONSES AND ERRORS
%=============================================================
load allstates2level.mat AllStates  %有风扰，控制加风扰      %无抖振
% load allstates5level.mat AllStates5level %有风扰，控制没加风扰 %有抖振
t    =   AllStates(1,:);

XE=  AllStates(2,:);
YE=   AllStates(3,:);
ZE  =   AllStates(4,:);

u =     AllStates(5,:);
v =     AllStates(6,:);
w =     AllStates(7,:);

phi  =   AllStates(8,:);
theta  =   AllStates(9,:);
psi =   AllStates(10,:);

p=  AllStates(11,:);
q=  AllStates(12,:);
r=  AllStates(13,:);

XE_ref=  AllStates(14,:);
YE_ref=  AllStates(15,:);
ZE_ref=  AllStates(16,:);

Delta_a   =   AllStates(17,:);
Delta_b   =   AllStates(18,:);
ped      =   AllStates(19,:);
col     =  AllStates(20,:);
%%%%%%%%%%%%%%%%%2级风数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%5级风数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% XE5level =  AllStates5level(2,:);
% YE5level =   AllStates5level(3,:);
% ZE5level  =   AllStates5level(4,:);
% 
% u5level =     AllStates5level(5,:);
% v5level =     AllStates5level(6,:);
% w5level =     AllStates5level(7,:);
% 
% phi5level  =   AllStates5level(8,:);
% theta5level  =   AllStates5level(9,:);
% psi5level =   AllStates5level(10,:);
% 
% Delta_a5level   =   AllStates5level(17,:);
% Delta_b5level   =   AllStates5level(18,:);

d2r=    pi/180;
Rad2Deg = 57.29577952;
%%%%%%%%%%%%%%%%%悬停X轴偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot(t,XE,'r-',t,XE5level,'b:','LineWidth',2);
% xlabel('time (s)')
% ylabel('X / m')

% plot(t,YE,'r-',t,YE5level,'b:','LineWidth',2);
% xlabel('time (s)')
% ylabel('Y / m')
%%%%%%%%%%%%%%%%%悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot(XE,YE,'r-',XE5level,YE5level,'g:','LineWidth',2);
% xlabel('X / m')
% ylabel('Y / m')
% legend('UAS-SMC','CSMC');

plot3(XE,YE,-ZE,'r-','LineWidth',2);
xlabel('X / m')
ylabel('Y / m')
zlabel('Z / m')
% legend('UAS-SMC','CSMC');
%%%%%%%%%%%%%%%%%悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%三维悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% XERefSNR = awgn(XE,40);
% YERefSNR = awgn(YE,40);
% 
% plot3(XE,YE,-ZE,'b-',XERefSNR,YERefSNR,-ZE,'r:','LineWidth',2);
% xlabel('X / m')
% ylabel('Y / m')
% zlabel('Height / m')
% legend('Reference Trace','Flight Trace');
% grid on
%%%%%%%%%%%%%%%%%三维悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot(t,XE,'r-',t,XE5level,'g:','LineWidth',2);
% xlabel('Time / s')
% ylabel('X / m')
% legend('UAS-SMC','CSMC');
%%%%%%%%%%%%%%%%%悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%悬停位置偏移%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%俯仰角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if (theta>0)
%     theta = 0;
% end

% ThetaRefSNR = awgn(theta*Rad2Deg,100);
% Theta5levelRefSNR = awgn(theta5level*Rad2Deg,100);
% 
% plot(t,theta*Rad2Deg,'r-',t,theta5level*Rad2Deg,'g:','LineWidth',2);
% xlabel('Time / s')
% ylabel('Pitch / Deg.')
% legend('UAS-SMC','CSMC');
%%%%%%%%%%%%%%%%%%俯仰角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%滚转角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PhiRefSNR = awgn(phi*Rad2Deg,50);
% phi5levelRefSNR = awgn(phi5level*Rad2Deg,50);
% 
% plot(t,PhiRefSNR,'r-',t,phi5levelRefSNR,'k-','LineWidth',2);
% xlabel('Time (s)')
% ylabel('Roll/Deg.')
% legend('Level 2','Level 5');
%%%%%%%%%%%%%%%%%滚转角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%俯仰角\滚转角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ThetaRefSNR = awgn(theta*Rad2Deg,50);
% PhiRefSNR = awgn(phi*Rad2Deg,50);
% plot(t,ThetaRefSNR,'r-',t,PhiRefSNR,'b-.','LineWidth',2);
% xlabel('Time (s)')
% ylabel('Pitch & Roll / Deg.')
% legend('Pitch','Roll');
%%%%%%%%%%%%%%%%%俯仰角\滚转角曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%高度曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Height = awgn(ZE,40);
% plot(t,-Height,'k-','LineWidth',2.1);
% xlabel('Time (s)')
% ylabel('Height (m)')
%%%%%%%%%%%%%%%%%%高度曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%高度对比曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Height = awgn(ZE,30);
% plot(t,-ZE,'k-',t,-ZE5level,'r--','LineWidth',2);
% xlabel('Time (s)')
% ylabel('Height (m)')
%  grid on
%%%%%%%%%%%%%%%%%%高度对比曲线%%%%%%%%%%%%%%%%%%%%%%%%%%%


%总距改变
% plot(t,w,'m:',t,ZE,'r-',t,psi/d2r,'g--',t,r/d2r,'b-.','LineWidth',2);
% xlabel('time (s)')
% ylabel('Response')
% legend('w ','ZE','psi','r');
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%X纵向周期变距改变
% plot(t,Delta_a*Rad2Deg,'r-',t,Delta_a5level*Rad2Deg,'g:','LineWidth',2);
% xlabel('Time (s)')
% ylabel('Lon / Deg.')
% legend('UAS-SMC','CSMC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%横向周期变距改变
% plot(t,Delta_b*Rad2Deg,'k-','LineWidth',2);
% xlabel('time (s)')
% ylabel('Lat/Deg.')
% 
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Y横向周期变距改变
% plot(t,q/d2r,'m:',t,theta/d2r,'r-',t,u,'g--',t,p/d2r,'b-.',t,phi/d2r,'y-.',t,v,'c:','LineWidth',2);
% xlabel('time (s)')
% ylabel('Response')
% legend('q ','theta','u','p','phi','v');
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%风扇总距改变
% plot(t,w,'m:',t,ZE,'r-',t,psi/d2r,'g--',t,r/d2r,'b-.','LineWidth',2);
% xlabel('time (s)')
% ylabel('Response')
% legend('w ','ZE','psi','r');
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% subplot(321)
% plot(t,XE,'b-','LineWidth',2);
% xlabel('time (s)')
% ylabel('X (m)')
% % legend('XEref ','XE')
% grid on
% 
% subplot(323)
% plot(t,YE,'r-','LineWidth',2);
% xlabel('time (s)')
% ylabel('Y (m)')
% % legend('YEref ','YE')
% grid on
% 
% subplot(325)
% plot(t,ZE,'g-','LineWidth',2);
% xlabel('time (s)')
% ylabel('Z (m)')
% % legend('ZEref ','ZE')
% grid on
% 
% subplot(324)
% plot(t,phi,'r-','LineWidth',2);
% xlabel('time (s)')
% ylabel('phi (red)')
% % legend('XEref ','XE')
% grid on
% 
% subplot(322)
% plot(t,theta,'b-','LineWidth',2);
% xlabel('time (s)')
% ylabel('theta (red)')
% % legend('XEref ','XE')
% grid on
% 
% subplot(326)
% plot(t,psi,'g-','LineWidth',2);
% xlabel('time (s)')
% ylabel('psi (red)')
% % legend('XEref ','XE')
% grid on
% subplot(411)

% plot(t,XE,'b-',t,YE,'r-',t,ZE,'g-','LineWidth',1);
% xlabel('time (s)/Picture a  ')
% ylabel('position (m)')
% legend('X','Y','Z')
% grid on

% subplot(412)
% plot(t,u,'b-',t,v,'r-',t,w,'g-','LineWidth',1);
% xlabel('time (s)/Picture b  ')
% ylabel('speed (m/s)')
% legend('u','v','w')
% grid on
% % 
% subplot(413)
% plot(t,phi,'b-',t,theta,'r-',t,psi,'g-','LineWidth',1);
% xlabel('time (s)/Picture c  ')
% ylabel('attitude(rad)')
% legend('phi','theta','psi')
% grid on
% 
% subplot(414)
% plot(t,p,'b-',t,q,'r-',t,r,'g-','LineWidth',1);
% xlabel('time (s)/Picture d  ')
% ylabel('attitudes rate (rad/s)')
% legend('p','q','r')
% grid on

% subplot(223)
% plot(t,v,'r-',t,w,'g-','LineWidth',1);
% xlabel('time (s)')
% ylabel('v (m/s)')
% % legend('ZEref ','ZE')
% grid on

% subplot(326)
% plot(t,w,'g-','LineWidth',1);
% xlabel('time (s)')
% ylabel('w (m/s)')
% % legend('ZEref ','ZE')
% grid on

% subplot(313)
% plot(t,psi,'g-','LineWidth',1);
% xlabel('time (s)')
% ylabel('psi (red)')
% % legend('XEref ','XE')
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%******====
% subplot(211)
% plot(t,Delta_a*Rad2Deg,'b-','LineWidth',2);
% xlabel('time (s)')
% ylabel('Lon / Deg.')
% grid on


% plot(t,Delta_a*Rad2Deg,'r-',t,Delta_b*Rad2Deg,'b-.','LineWidth',1.5);
% xlabel('time (s)');
% ylabel('Lon & Lat / Deg.');
% legend('Lon ','Lat');
% 
% 
% 
% 
% 
% 
% plot(t,ped,'r-',t,col,'b-.','LineWidth',2);
% xlabel('time (s)')
% ylabel('Col & Fan / Deg.')
% legend('Fan ','Col')


% subplot(212)
% plot(t,col,'b-','LineWidth',2);
% xlabel('time (s)')
% ylabel('Col / Deg.')
% grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%******====
% subplot(424)
% plot(t,p,'k-');
% xlabel('time (s)')
% ylabel('p (rad/s)')
% legend('p')
% %legend('\beta_c','\beta' )
% grid on
% 
% subplot(425)
% plot(t,q,'k-');
% xlabel('time (s)')
% ylabel('q (rad/s)')
% legend('q')
% grid on
% 
% subplot(426)
% plot(t,r,'k-');
% xlabel('time (s)')
% ylabel('r (rad/s)')
% legend('r')
% grid on
% 
% subplot(427)
% plot(t,RUD,'k-');
% xlabel('time (s)')
% ylabel('\delta_r (deg)')
% grid on