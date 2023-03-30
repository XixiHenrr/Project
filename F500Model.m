function out = F500Model(in)

% global g Deg2Rad Rad2Deg Mass Dz Dduct Ix Iy Iz K_Tmr K_Xmr K_Ymr K_Qmr  K_Tfan K_Qfan Tmr0 col0 ped0 K_Zduct1 K_Zduct2;

Delta_a =   in(1);%Longitudinal cycle variable pitch
Delta_b =   in(2);%Lateral cycle variable pitch
ped =   in(3);%tailβ���ܾ�
col =   in(4);%main rotor�ܾ���
%ע�⣺���������Ƕȣ�theta_ref��phi_ref�ǻ���
%asin��2����Ϊ����1������Ӧ����ģ�ͳ������⡪��ȷʵ����asin(Mtorq/d*Tmr)����������MtorqԶԶ����Tmr����һ������ȥ����
%��Mtorq = Iy * (-fXe - CK*[pe qe re]' -sum)������Iy��������Ix = 189.7;Iy =287.9;Iz= 203.5;Ӧ��������ϵ������ʹ�õ�
%����ϵ�г��룬���������Ժ�Ix = 189.7;Iy =203.5;Iz=287.9 
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
uncp = 1;%������ȷ��
uncn = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ˵����
%������Mass = 357.35��ʱ����ͣƽ���״̬col0 = 8�ȣ�ped0 =25.296753501��
%�����ܾ�ƽ����������������������Tmr0 = 3314.8ţ�����Ȳ�������Tfan0 = 1513.1��
%����ͷ��Ⱥ�����T=4827.9��
%��֤��������ֵ��ȷ���ķ�����Zmr0+Tfan0=Mass*g
%�����ᶨ�壺X����ǰΪ����Y������Ϊ����Z������Ϊ��
%��uvw2phithetacol.m�ļ��У�Ϊ�˷�ֹ��Ϊʹ��asin(M)������M���ڡ�1������������޷�thetaΪ[-30��10]��phiΪ[-35��35]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����
g = 9.8;
Deg2Rad = 0.017453292;
% Rad2Deg = 57.29577952;
%��ϵ��
% Mass = 365.3673;%��λ��KG
Mass = 357.35;%��λ��KG
Dz = 0.995;%��챵����ľ���
Dduct = 0.4477;%���������ں���������м䣨���ڽ�챺�����֮�䣩
Ix = 189.7;%��λ��KG*m2
Iy = 203.5;%��λ��KG*m2
Iz = 287.9;%��λ��KG*m2
K_Tmr = 441.87;
K_Xmr = 0.62;
K_Ymr = 0.62;
K_Zmr = 0.6;%��������Ϊ��Ѱ�Һ������ƽ�������ֶ��޸ģ�ԭ����K_Zmr =0.866
K_Qmr = 90475;
K_Tfan = 230.18;
K_Qfan = 170730;
K_Zduct = -0.5;%��������������������������������������������������������������
% Tmr0 = 3314.8;%��λ��N��  Tfan0 = 1513.1��T = 4827.9 N
% col0 = 8;%��λ����
% col = col0 + Delta_c;%��Χ��[0.5,12]��
% ped0 = 25.296753501
% ped = ped0 + Delta_t;%ped��Χ[18.8,35]��,
%����������
% Tmr = 441.87 * col  - 220.14;
Tmr =    K_Tmr * col  - 220.14;%�޸�Ϊ��col0+Delta_c = 8 + Delta_c,ƽ����ʱ��Tmr0 = 3314.8 N
%Xmr = - K_Xmr * Tmr0 * sin(Delta_a);%����ģ���в�Ӧ����Tmr0��Ӧ����Tmr
Xmr =  - K_Xmr * Tmr  * sin(Delta_a);%�����ٶȻ�·uvw2phithepsi���������Ǽ�ΪTmr0+Tfan0�أ�����Zmr0+Tfan0�أ�
Ymr =    K_Ymr * Tmr  * sin(Delta_b);%�����������ʻ�·��Ӧ����Tmr
Zmr =  - K_Zmr * Tmr  * cos(Delta_a) * cos(Delta_b);%���������������Xmr��Ymr������cos(Delta_a)* cos(Delta_b)����ô������ʵҲӦ�ú���
%����������
% Qmr = K_Qmr * Delta_c;
Qmr = 1165.8 - sqrt(1213200 - K_Qmr * col);
Lmr =   Ymr * Dz;%������Ի����˶���ɵĻ���ǣ������ɴ˶�������ƫ�����ĵ����ۺ�С�����Ժ��Բ���
Mmr = - Xmr * Dz;
Nmr =   Qmr;%��������������ת�������
%��������
% Tfan = 230.18 * ped - 4309.7;
Tfan = K_Tfan * ped - 4309.7;% ped = ped0 + Delta_t = 25.296753501 + Delta_t ,ƽ����ʱ��,Tfan0 = 1513.1 N
Xfan = 0;
Yfan = 0;
Zfan = - Tfan;
%��������
% Qfan = K_Qfan * ped;
Qfan = 1985.5 - sqrt(6627100 - K_Qfan * ped);% ped��Χ[18.7232,35]��,ƽ���ped0=25.296753501�ȵ�ʱ��Qfan = 466.2287
Lfan = 0;
Mfan = 0;
Nfan = - Qfan;%��Nmr�����෴
%��������
% Xduct = -1.3488 * u * abs(u) + 1.3983 * u;
%��ʽ�������õ�ԭ�򣺵�u�ٶ�<1��ʱ��Xduct>0���������ʾ�綴����ʵ���ʱ�򣬶Էɻ����磬��������������������ʵ������
Xduct = - 1.3514  * u * abs(u);
Yduct = - 1.3514  * v * abs(v);
Zduct = - K_Zduct * w * abs(w);% ������������������������������ϵ������
%����������
Lduct =   Dduct * Yduct;% ����������������һ��Ҫע�⣬L����Ĺ�ת���أ������ɸ���������һ��ʼģ�����Ҿ�д���ˣ�
Mduct = - Dduct * Xduct;% ����������������һ��Ҫע�⣬M����ĸ������أ������ɹ�ת����
Nduct = 0;
%��������ͣʱΪƽ��״̬��vuw=0,�ʻ�������Ϊ0;ǰ��ʱ��������+����+��������
Fx = Xmr + Xfan + Xduct;
Fy = Ymr + Yfan + Yduct;
Fz = Zmr + Zfan + Zduct; %�������������ƽ�⣬��ƽʱʹ��
%�����أ�
Ltorq = Lmr + Lfan + Lduct;
Mtorq = Mmr + Mfan + Mduct;
Ntorq = Nmr + Nfan + Nduct;
%�ٶȻ�·
u_dot = Fx/Mass + v*r - w*q - g*sin(theta);
v_dot = Fy/Mass + w*p - u*r + g*sin(phi)*cos(theta);
w_dot = Fz/Mass + u*q - v*p + g*cos(phi)*cos(theta);
%��̬��·
phi_dot =   p + sin(phi)*tan(theta)*q + cos(phi)*tan(theta)*r;
theta_dot = 0 +            cos(phi)*q         -    sin(phi)*r;
psi_dot =   0 + sin(phi)*sec(theta)*q + cos(phi)*sec(theta)*r;
% phi_dot =   p + sin(Deg2Rad*phi)*tan(Deg2Rad*theta)*q + cos(Deg2Rad*phi)*tan(Deg2Rad*theta)*r;
% theta_dot = 0 +            cos(Deg2Rad*phi)*q -            sin(Deg2Rad*phi)*r;
% psi_dot =   0 + sin(Deg2Rad*phi)*sec(Deg2Rad*theta)*q + cos(Deg2Rad*phi)*sec(Deg2Rad*theta)*r;
%�����ʻ�·
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
         

         