%Multivariable Sliding Hyperplane Design  s = c x = 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obtain regular form transformation % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% size of the input distribution matrix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nn,mm]=size(B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform QR decomposition on the input distribution matrix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Tr temp]=qr(B); 
Tr=Tr';
Tr=[Tr(mm+1:nn,:);Tr(1:mm,:)];
clear temp;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% regular form description %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Areg=Tr*A*Tr';
Breg=Tr*B;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obtain matrix sub-blocks for sliding mode controller design %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A11 = Areg(1:nn-mm,1:nn-mm);
A12 = Areg(1:nn-mm,nn-mm+1:nn);
A21 = Areg(nn-mm+1:nn,1:nn-mm);
A22 = Areg(nn-mm+1:nn,nn-mm+1:nn);
B2 = Breg(nn-mm+1:nn,1:mm);


% set 1%
p = [-0.5 -0.75 -1.5 -1.5 -2 -1 -2 -1]; % best result for set 1
%p = [-1 -0.5 -1 -1.5 -1.5 -1 -2 -1];
%p = [-1 -2 -1.5 -1.5 -2 -1 -2 -1];

% set 2
%p = [-0.75 -0.75 -1.15 -1.5 -2.15 -1 -2 -1]; % worked

%set 3
%p = [-1 -0.75 -1 -1.5 -1.5 -1 -5 -1]; % y achieved

%p = [-1 -0.5 -1 -1.5 -1.5 -1 -5 -1]; % x achieved

%p = [-1 -0.5 -1 -1.5 -1.5 -1 -2 -1]; % best result so far

%p = [-1 -0.5 -1 -1.5 -1.5 -1 -5 -1]; % best 2

%p = [-1 -0.5 -1 -1.5 -1.5 -1 -2 -1];

%  n-m  sliding eigenvalues

%----------------------------------------------------------------------------%
% Direct use of the matlab place command gives a robust reduced order
% dynamic via robust eigenstructure assignment
%----------------------------------------------------------------------------% 
Mc = place(A11,A12,p);

% --------------------------------------------------------------------------%
% Recover the switching function matrix in the original coordinates
% --------------------------------------------------------------------------%

Sreg=[Mc eye(mm)];
S=[Mc eye(mm)]*Tr;

%----------------------------------------------------------------------------%
% calculate the linear control, the Lyapunov matrix and Lam
%----------------------------------------------------------------------------%
Phi = diag([-20,-20,-20,-20]);

Lam=Sreg*Breg;
Lcont=-inv(Sreg*Breg)*((Sreg*Areg)-(Phi*Sreg))*Tr;
P = lyap(Phi',eye(mm));