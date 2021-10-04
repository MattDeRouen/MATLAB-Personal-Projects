
%this program solves for axial deformationg in bars with up to 3 sections
%to run the calculation, simply enter the information with that of the
%section farthest from the wall first, and move top to bottom
%for anything less than 3 sections, leave boxes empty
%after this press calculate button and deformations will be displayed

function Strchr

StrchrUI=figure('Name','Axial Stress Calculator','Menubar', 'None', 'position',[600,300,400,250]);
%storage for length matrix
LM3=uicontrol('Style','edit','position',[20,50,100,20]);
LM2=uicontrol('Style','edit','position',[20,80,100,20]);
LM1=uicontrol('Style','edit','position',[20,110,100,20]);
Ltxt=uicontrol('Style','text','String','Lengths','position',[20,130,100,15]);
%storage for area matrix
AM3=uicontrol('Style','edit','position',[140,50,100,20]);
AM2=uicontrol('Style','edit','position',[140,80,100,20]);
AM1=uicontrol('Style','edit','position',[140,110,100,20]);
Atxt=uicontrol('Style','text','String','Areas','position',[140,130,100,15]);
%storage for external loads
FM3=uicontrol('Style','edit','position',[260,50,100,20]);
FM2=uicontrol('Style','edit','position',[260,80,100,20]);
FM1=uicontrol('Style','edit','position',[260,110,100,20]);
Ftxt=uicontrol('Style','text','String','Forces','position',[260,130,100,15]);
%storage for youngs modulus
EM=uicontrol('Style','edit','position',[20,170,100,20]);
Etxt=uicontrol('Style','text','String','E value','position',[20,190,100,15]);
%calculate button
calc=uicontrol('Style','Pushbutton','String','CALCULATE','position',[100,20,200,20]);
calc.Callback=@Calc;

    function Calc(src,event)
 %taking all entered information from the popup and putting it in arrays
 clc;
        Lmat= zeros(1,3);
Lmat(1)=str2double(LM1.String);
Lmat(2)=str2double(LM2.String);
Lmat(3)=str2double(LM3.String);

Amat=zeros(1,3);
Amat(1)=str2double(AM1.String);
Amat(2)=str2double(AM2.String);
Amat(3)=str2double(AM3.String);

Fmat=zeros(1,3);
Fmat(1)=str2double(FM1.String);
Fmat(2)=str2double(FM2.String);
Fmat(3)=str2double(FM3.String);

E=str2double(EM.String);
%begin deformation calculations
d1=(Fmat(1)*Lmat(1))/(E*Amat(1));
d2=((Fmat(2)+Fmat(1))*Lmat(2))/(E*Amat(2));
P=Fmat';
 d3=(sum(P)*Lmat(3))/(E*Amat(3));
 dtot=d1+d2+d3;
 %printing results
 fprintf('the deformation of the first section is %f \n',d1)
 fprintf('the deformation of the second section is %f \n',d2)
 fprintf('the deformation of the third section is %f \n',d3)
 fprintf('the total deformation of the bar is %f \n',dtot)
    end



end
