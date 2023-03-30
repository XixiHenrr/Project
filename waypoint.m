
%% Zoes funny route

%Waypoint=[0,10,20,30,40,50,60,70,80;     %time steps
%          0,0,5,5,10,10,-10,-10,5;       %X position
%          0,5,5,-5,-5,10,10,-10,-10;     %Y position
%          0,0,0,0,0,0,0,0,0;             %Z position
%          0,0,0,0,0,0,0,0,0;             %X velocity
%          0,0,0,0,0,0,0,0,0;             %Y velocity
%          0,0,0,0,0,0,0,0,0;             %Z velocity
%          0,0,0,0,0,0,0,0,0]';           %Heading/Yaw




%% Circle
count = 1;

Waypoint = zeros(8,80);

for t = [0:80];

r = 1;
omega = 1;
theta = omega * t;

x = r*sin(theta);
y = r*cos(theta);
z = -1;
x_velocity = 0;
y_velocity = 0;
z_velocity = 0;
Heading = (pi/2) + (omega*t);

Waypoint(1,count) = t;
Waypoint(2,count) = x;
Waypoint(3,count) = y;
Waypoint(4,count) = z;
Waypoint(5,count) = x_velocity;
Waypoint(6,count) = y_velocity;
Waypoint(7,count) = z_velocity;
Waypoint(8,count) = Heading;


count = count + 1;

end

Waypoint = Waypoint';