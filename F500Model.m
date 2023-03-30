function out = F500Model(in)

% global g Deg2Rad Rad2Deg Mass Dz Dduct Ix Iy Iz K_Tmr K_Xmr K_Ymr K_Qmr  K_Tfan K_Qfan Tmr0 col0 ped0 K_Zduct1 K_Zduct2;

Delta_a =   in(1);%Longitudinal cycle variable pitch
Delta_b =   in(2);%Lateral cycle variable pitch
ped =   in(3);%tail尾桨总距
col =   in(4);%main rotor总距量
%注意：：舵面量是度，theta_ref和phi_ref是弧度
%asin（2）因为超过1而出错，应该是模型出了问题——确实根据asin(Mtorq/d*Tmr)，分析出来Mtorq远远大于Tmr，进一步跟进去，发
%现Mtorq = Iy * (-fXe - CK*[pe qe re]' -sum)，其中Iy出了问题Ix = 189.7;Iy =287.9;Iz= 203.5;应该是坐标系和我们使用的
%坐标系有出入，重新排序以后，Ix = 189.7;Iy =203.5;Iz=287.9 
u      =   in(5);   
v      =   in(6);  
w      =   in(7);  

p     =   in(8);
q     =   in(9);
r     =   in(10);

phi    =   in(11);            
theta  =   in(12);            
psi    =   in(13);

% The total coefficient of the system:
uncp = 1;%参数不确定
uncn = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 说明：
%当质量Mass = 357.35的时候，悬停平衡点状态col0 = 8度，ped0 =25.296753501度
%根据总距平衡点解算出来的旋翼产生拉力Tmr0 = 3314.8牛，风扇产生拉力Tfan0 = 1513.1，
%旋翼和风扇合拉力T=4827.9，
%验证上述各个值正确与否的方法：Zmr0+Tfan0=Mass*g
%机体轴定义：X轴向前为正，Y轴向右为正，Z轴向下为正
%在uvw2phithetacol.m文件中，为了防止因为使用asin(M)而出现M大于±1的情况，所以限幅theta为[-30，10]和phi为[-35，35]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%常量
g = 9.8;
Deg2Rad = 0.017453292;
% Rad2Deg = 57.29577952;
%参系数
% Mass = 365.3673;%单位：KG
Mass = 357.35;%单位：KG
Dz = 0.995;%浆毂到质心距离
Dduct = 0.4477;%气动中心在涵道机身的中间（即在浆毂和质心之间）
Ix = 189.7;%单位：KG*m2
Iy = 203.5;%单位：KG*m2
Iz = 287.9;%单位：KG*m2
K_Tmr = 441.87;
K_Xmr = 0.62;
K_Ymr = 0.62;
K_Zmr = 0.6;%————为了寻找合理的配平点做的手动修改，原来是K_Zmr =0.866
K_Qmr = 90475;
K_Tfan = 230.18;
K_Qfan = 170730;
K_Zduct = -0.5;%———————————————————————————参数待定
% Tmr0 = 3314.8;%单位：N；  Tfan0 = 1513.1，T = 4827.9 N
% col0 = 8;%单位：度
% col = col0 + Delta_c;%范围：[0.5,12]度
% ped0 = 25.296753501
% ped = ped0 + Delta_t;%ped范围[18.8,35]度,
%主旋翼升力
% Tmr = 441.87 * col  - 220.14;
Tmr =    K_Tmr * col  - 220.14;%修改为：col0+Delta_c = 8 + Delta_c,平衡点的时候，Tmr0 = 3314.8 N
%Xmr = - K_Xmr * Tmr0 * sin(Delta_a);%——模型中不应该用Tmr0而应该用Tmr
Xmr =  - K_Xmr * Tmr  * sin(Delta_a);%——速度回路uvw2phithepsi控制器中是简化为Tmr0+Tfan0呢？还是Zmr0+Tfan0呢？
Ymr =    K_Ymr * Tmr  * sin(Delta_b);%——而角速率回路中应该用Tmr
Zmr =  - K_Zmr * Tmr  * cos(Delta_a) * cos(Delta_b);%——————如果Xmr、Ymr都忽略cos(Delta_a)* cos(Delta_b)，那么此项其实也应该忽略
%主旋翼力矩
% Qmr = K_Qmr * Delta_c;
Qmr = 1165.8 - sqrt(1213200 - K_Qmr * col);
Lmr =   Ymr * Dz;%如果忽略挥舞运动造成的挥舞角，并且由此而产生的偏离质心的力臂很小，所以忽略不计
Mmr = - Xmr * Dz;
Nmr =   Qmr;%正负号由旋翼旋转方向决定
%风扇升力
% Tfan = 230.18 * ped - 4309.7;
Tfan = K_Tfan * ped - 4309.7;% ped = ped0 + Delta_t = 25.296753501 + Delta_t ,平衡点的时候,Tfan0 = 1513.1 N
Xfan = 0;
Yfan = 0;
Zfan = - Tfan;
%风扇力矩
% Qfan = K_Qfan * ped;
Qfan = 1985.5 - sqrt(6627100 - K_Qfan * ped);% ped范围[18.7232,35]度,平衡点ped0=25.296753501度的时候，Qfan = 466.2287
Lfan = 0;
Mfan = 0;
Nfan = - Qfan;%和Nmr符号相反
%机身阻力
% Xduct = -1.3488 * u * abs(u) + 1.3983 * u;
%上式舍弃不用的原因：当u速度<1的时候，Xduct>0，物理含义表示风洞吹风实验的时候，对飞机吹风，会产生吸引力，这个和现实情况相悖
Xduct = - 1.3514  * u * abs(u);
Yduct = - 1.3514  * v * abs(v);
Zduct = - K_Zduct * w * abs(w);% ——————————————此系数待定
%机身阻力矩
Lduct =   Dduct * Yduct;% ————————一定要注意，L方向的滚转力矩，力是由俯仰产生（一开始模型里我就写错了）
Mduct = - Dduct * Xduct;% ————————一定要注意，M方向的俯仰力矩，力是由滚转产生
Nduct = 0;
%合力：悬停时为平衡状态，vuw=0,故机身阻力为0;前飞时，主旋翼+风扇+机身阻力
Fx = Xmr + Xfan + Xduct;
Fy = Ymr + Yfan + Yduct;
Fz = Zmr + Zfan + Zduct; %垂向合力与重力平衡，配平时使用
%合力矩：
Ltorq = Lmr + Lfan + Lduct;
Mtorq = Mmr + Mfan + Mduct;
Ntorq = Nmr + Nfan + Nduct;
%速度回路
u_dot = Fx/Mass + v*r - w*q - g*sin(theta);
v_dot = Fy/Mass + w*p - u*r + g*sin(phi)*cos(theta);
w_dot = Fz/Mass + u*q - v*p + g*cos(phi)*cos(theta);
%姿态回路
phi_dot =   p + sin(phi)*tan(theta)*q + cos(phi)*tan(theta)*r;
theta_dot = 0 +            cos(phi)*q         -    sin(phi)*r;
psi_dot =   0 + sin(phi)*sec(theta)*q + cos(phi)*sec(theta)*r;
% phi_dot =   p + sin(Deg2Rad*phi)*tan(Deg2Rad*theta)*q + cos(Deg2Rad*phi)*tan(Deg2Rad*theta)*r;
% theta_dot = 0 +            cos(Deg2Rad*phi)*q -            sin(Deg2Rad*phi)*r;
% psi_dot =   0 + sin(Deg2Rad*phi)*sec(Deg2Rad*theta)*q + cos(Deg2Rad*phi)*sec(Deg2Rad*theta)*r;
%角速率回路
p_dot = -(Iz-Iy)/Ix*q*r + Ltorq/Ix;
q_dot = -(Ix-Iz)/Iy*p*r + Mtorq/Iy;
r_dot = -(Iy-Ix)/Iz*p*q + Ntorq/Iz;

out     =   [u_dot;
             v_dot;
             w_dot;
    
             p_dot;
             q_dot;
             r_dot;
    
             phi_dot;
             theta_dot;
             psi_dot];
         

         