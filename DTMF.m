% Generating 0 to 9 buttons:
sig0=sigmaker(4,2);
sig1=sigmaker(1,1);
sig2=sigmaker(1,2);
sig3=sigmaker(1,3);
sig4=sigmaker(2,1);
sig5=sigmaker(2,2);
sig6=sigmaker(2,3);
sig7=sigmaker(3,1);
sig8=sigmaker(3,2);
sig9=sigmaker(3,3);
fs=8000;
silent=zeros(1,0.1*(fs));

%  Message which is generated: 810198390
%  Also we use silent between each button.
y=cat(2,sig8,silent,sig1,silent,sig0,silent,sig1,silent,sig9,silent,sig8,silent,sig3,silent,sig9,silent,sig0);
sound(y,fs);
audiowrite("y.wav",y,fs);

% **********************************************
%  Decoding the Message:
[a,Fs] = audioread('y.wav');
plot(a);
s1=a(2:802);s2=a(1603:2403);s3=a(3204:4004);s4=a(4805:5605);s5=a(6406:7206);s6=a(8007:8807);s7=a(9608:10408);s8=a(11209:12009);s9=a(12809:13609);
numb=[sig0;sig1;sig2;sig3;sig4;sig5;sig6;sig7;sig8;sig9];
s=[s1,s2,s3,s4,s5,s6,s7,s8,s9];
for i=1:9
    r=[0,0,0,0,0,0,0,0,0,0];
    for j=1:10
        R=corrcoef(s(:,i),numb(j,:));
        r(j)=R(2,1);
    end
    m=max(r);
    for k=1:10
        if m==r(k)
            disp(k-1);
        end
    end
end

% **********************************************
function out=sigmaker(i,j)
  fr=[697 770 852 941];
  fc=[1209 1336 1477];
  fs=8000;
  ts=1/fs;
  ton=0.1;
  t=0:ts:ton;
  y1=sin(2*pi*fr(i)*t);
  y2=sin(2*pi*fc(j)*t);
  out=(y1+y2)/2;
end



