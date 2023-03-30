function [ LonLat_err ] = Earth2Body( xyz )
%--------------------------------------------------------------
% Title: transform M-file from u,v,w to x,y,z
%This M-file uses the velocity u,v,w to make the helicopter track the
%position x,y,z. And it uses sliding mode method to calculate the control.
% Time: 13/10/2014
% Author: 陈正雨
%--------------------------------------------------------------
Deg2Rad = 0.017453292;
% Three position error
Xe=xyz(1);
Ye=xyz(2);
Ze=xyz(3);

phi = xyz(4);
the = xyz(5);
psi = xyz(6);

L_EB=[cos(the)*cos(psi)  -cos(phi)*sin(psi)+sin(phi)*sin(the)*cos(psi)   sin(phi)*sin(psi)+cos(phi)*sin(the)*cos(psi);
      cos(the)*sin(psi)   cos(phi)*cos(psi)+sin(phi)*sin(the)*sin(psi)  -sin(phi)*cos(psi)+cos(phi)*sin(the)*sin(psi);
     -sin(the)            sin(phi)*cos(the)                              cos(phi)*cos(the)];
%机体坐标转换为地面坐标系，美式坐标系
% gx = [cos(Deg2Rad*the)*cos(Deg2Rad*psi) sin(Deg2Rad*phi)*sin(Deg2Rad*the)*cos(Deg2Rad*psi)-cos(Deg2Rad*phi)*sin(Deg2Rad*psi) cos(Deg2Rad*phi)*sin(Deg2Rad*the)*cos(Deg2Rad*psi)+sin(Deg2Rad*phi)*sin(Deg2Rad*psi);
%       cos(Deg2Rad*the)*sin(Deg2Rad*psi) sin(Deg2Rad*phi)*sin(Deg2Rad*the)*sin(Deg2Rad*psi)+cos(Deg2Rad*phi)*cos(Deg2Rad*psi) cos(Deg2Rad*phi)*sin(Deg2Rad*the)*sin(Deg2Rad*psi)-sin(Deg2Rad*phi)*cos(Deg2Rad*psi);
%       -sin(Deg2Rad*the)                 sin(Deg2Rad*phi)*cos(Deg2Rad*the)                                                    cos(Deg2Rad*phi)*cos(Deg2Rad*the)];


LonLat_err = inv(L_EB)* [Xe Ye Ze]';
end



