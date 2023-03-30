function [ out ] = L_EB2Ground( in )
%UNTITLED Summary of this function goes here
Deg2Rad = 0.017453292;
%   Detailed explanation goes here
u      =   in(1);   
v      =   in(2);  
w      =   in(3);

phi    =   in(4);            
the    =   in(5);            
psi    =   in(6); 
% phi    =  Deg2Rad * m_phi;            
% the    =  Deg2Rad * m_the;            
% psi    =  Deg2Rad * m_psi; 

UVW = [u v w]';

%机体坐标转换为地面坐标系，美式坐标系
L_EB=[cos(the)*cos(psi)  -cos(phi)*sin(psi)+sin(phi)*sin(the)*cos(psi)   sin(phi)*sin(psi)+cos(phi)*sin(the)*cos(psi);
      cos(the)*sin(psi)   cos(phi)*cos(psi)+sin(phi)*sin(the)*sin(psi)  -sin(phi)*cos(psi)+cos(phi)*sin(the)*sin(psi);
     -sin(the)            sin(phi)*cos(the)                              cos(phi)*cos(the)];
% L_EB = [cos(Deg2Rad*the)*cos(Deg2Rad*psi) sin(Deg2Rad*phi)*sin(Deg2Rad*the)*cos(Deg2Rad*psi)-cos(Deg2Rad*phi)*sin(Deg2Rad*psi) cos(Deg2Rad*phi)*sin(Deg2Rad*the)*cos(Deg2Rad*psi)+sin(Deg2Rad*phi)*sin(Deg2Rad*psi);
%         cos(Deg2Rad*the)*sin(Deg2Rad*psi) sin(Deg2Rad*phi)*sin(Deg2Rad*the)*sin(Deg2Rad*psi)+cos(Deg2Rad*phi)*cos(Deg2Rad*psi) cos(Deg2Rad*phi)*sin(Deg2Rad*the)*sin(Deg2Rad*psi)-sin(Deg2Rad*phi)*cos(Deg2Rad*psi);
%         -sin(Deg2Rad*the)                 sin(Deg2Rad*phi)*cos(Deg2Rad*the)                                                    cos(Deg2Rad*phi)*cos(Deg2Rad*the)];

XYZ = L_EB*UVW;
% out = [XE_dot;YE_dot;ZE_dot];
out = [XYZ(1);XYZ(2);XYZ(3)];

end

