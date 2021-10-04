function Bndr
%clears stored global values
dbclear in Bndr
clear;clc;
global n; global DfrmMat;global L;global E;global I;global X;
n=0;
DfrmMat=zeros(9,100);
BndrUI=figure('name','BNDRbot','Menubar', 'none','position',[300,350,830,440]);

loadtxt=uicontrol('Style','text','String','SELECT LOAD TYPE','position',[20,415,200,20]);

%popupmenu to choose type of load to input
c = uicontrol('Style','popupmenu');
c.Position = [20 400 200 20];
c.String = {'point force','full distributed load','centered triangular load','uniform triangular load to one end'};
c.Callback = @loadtype;

%length of bar input
Lin=uicontrol('Style','text','String','INPUT LENGTH','position',[220,415,200,20]);
Ledit=uicontrol('Style','edit','position',[220,400,200,20]);
Ledit.Callback=@Lval;

%modulus of elasticity input
moetxt=uicontrol('Style','text','String','INPUT MODULUS OF ELASTICITY','position',[420,415,200,20]);
moe=uicontrol('Style','edit','position',[420,400,200,20]);
moe.Callback=@Eval;

%moment of inertia input
moitxt=uicontrol('Style','text','String','INPUT MOMENT OF INERTIA','position',[620,415,200,20]);
Iin=uicontrol('Style','edit','position',[620,400,200,20]);
Iin.Callback=@Ival;


%clear button
clr=uicontrol('Style','pushbutton','position',[720,20,100,33],'String','CLEAR')
clr.Callback=@clear_button;

%calculates the final shape 
calc=uicontrol('Style','pushbutton','String','CALCULATE','position',[20,20,100,33]);
calc.Callback=@Sumcalc;

%value finder with input
Xask =uicontrol('Style','edit','position',[140,20,100,20])
asktext=uicontrol('Style','text','String', 'get deformation at entered point','position',[140,40,100,30]);
Xask.Callback=@Xaskdfrm
end

 function loadtype ( c, event )
   str = get ( c,'string' );
   val = get ( c,'value');
   switch str{val}
     case 'point force'
        pntfrc ();
     case 'full distributed load'
        full_unifrm ();
     case 'centered triangular load'
        cntrtri ();
     case 'uniform triangular load to one end'
        triload ();
     case 'callback5'
        full_unifrm ();
     case 'callback6'
        callbackItem3 ();
   end
 end

function Lval(Ledit,lbl)
global L;global X;
L=str2double(Ledit.String);
disp('stored length of bar:')
disp(L)
X= linspace(0,L,100);
end

function Eval(moe,lbl)
global E;
E=str2double(moe.String);
disp('stored modulus of elasticity:')
disp(E)
end

function Ival(Iin,lbl)
global I;
I=str2double(Iin.String);
disp('stored moment of inertia:')
disp(I)
end

function clear_button(clr,event)
global L;global E;global I;global n;
clear;clc;
n=1;
close all
%later have this button close or hide other input UIs and clear their
%stored data as well
end

function Sumcalc(calc,event)
global X;global DfrmMat;global L;global ansMat;
Y=sum(DfrmMat)
ansMat=ones(2,100);
ansMat(1,1:100)=X(1:100);
ansMat(2,1:100)=Y(1:100);
disp(ansMat);
plot(X,Y,'r')
pbaspect([4 1 1]);
daspect([5,1,1]);
grid on;
ansMat
end

function Xaskdfrm(Xask,event)
global ansMat;
Xa=str2double(Xask.String)

for i=1:100
     if Xa<ansMat(1,i) 
         i
        x2=ansMat(1,i+1);
        x1=ansMat(1,i);
        d1=ansMat(2,i)
        d2=ansMat(2,i+1)
        b=abs(x2-x1)
    bp= abs(d2)-abs(d1)
    if d2<d1
        a=b-abs(x2-Xa)
        ds=d1
    else
        a=b-(Xa-x1);
        ds=d2
    end
    ap=(a*bp)/b;
    da=ap+abs(ds)
    disp('the approximate deformation of the beam at the selected point is:')
    disp(da)
    break
    end
end

end
    

%%MAKING CALLBACKS OF POPUP MENU THAT CREATE SECONDARY INPUT UI FOR EACH
%LOAD TYPE
function []=pntfrc()
global DfrmMat;global X;global L;global E;global I;
global n;
pntfrcUI=figure ('Name','point force for x<a','MenuBar','none','position',[1030,350,440,300]);
Ptxt=uicontrol('Style','text','String','VALUE OF P IN BASIC UNITS','position',[10,55,200,20]);
btxt=uicontrol('Style','text','String','VALUE OF b IN BASIC UNITS','position',[230,55,200,20]);
Pcalc=uicontrol('Style','pushbutton','position',[120,20,200,20],'String','ENTER');
Pcalc.Callback=@pntfrccalc;
Pinput=uicontrol('Style','edit','position',[10,40,200,20]);
binput=uicontrol('Style','edit','position',[230,40,200,20]);
imshow('MATLAB/class tools/Capture2.JPG')
    function pntfrccalc(Pcalc,event)
 for i=1:100;
     P=str2double(get(Pinput,'string'));
     disp('P value in basic units')
     disp(P)
      b=str2double(get(binput,'string'));
     disp('b value in basic units')
     disp(b)
    x=X(i);
     ydfrm=-(P*b*x/(6*E*I*L))*((L^2)-(b^2)-(x^2));
    DfrmMat(n,i)= ydfrm;   
 end
    end
 
n=n+1;
end


function []=full_unifrm()
global DfrmMat;global X;global L;global E;global I;
global n;
unifrmUI=figure ('Name','Uniformly Distributed Load','MenuBar','none','position',[1030,350,400,300]);
Wtxt=uicontrol('Style','text','String','VALUE OF W IN BASIC UNITS','position',[100,60,200,20]);
winput=uicontrol('Style','edit','position',[100,40,200,20]);
winput.Callback=@fullunicalc;
imshow('MATLAB/class tools/Capture1.JPG')
    function fullunicalc(winput,event)
 for i=1:100;
     w=str2double(get(winput,'string'));
     disp('w value in basic units')
     disp(w)
    x=X(i);
     ydfrm=-(w*x/(24*E*I))*((L^3)-(2*L*(x^2))+(x^3));
    DfrmMat(n,i)= ydfrm;   
 end
    end
 
n=n+1;
end

%callback for uniform triangular load to one end
function []=triload()
global DfrmMat;global X;global L;global E;global I;
global n;
unitri=figure ('Name','uniform triangular load to one end','MenuBar','none','position',[1030,350,400,300]);
Wtritxt=uicontrol('Style','text','String','VALUE OF W IN BASIC UNITS','position',[100,60,200,20]);
wtriinput=uicontrol('Style','edit','position',[100,40,200,20]);
wtriinput.Callback=@triunicalc;
imshow('MATLAB/class tools/Capture3.JPG')
    function triunicalc(wtriinput,event)
 for i=1:100;
     wtri=str2double(get(wtriinput,'string'));
     disp('w value of triangular load in basic units:')
     disp(wtri)
    x=X(i);
     ydfrm=-(wtri*x/(180*E*I*L^2))*((3*(x^4))-(10*(L^2)*(x^2))+(7*(L^4)));
    DfrmMat(n,i)= ydfrm;   
 end
    end
 
n=n+1;
end

function []=cntrtri()
global DfrmMat;global X;global L;global E;global I;
global n;
unifrmUI=figure ('Name','centered triangular load','MenuBar','none','position',[1030,350,400,300]);
Wtxt2=uicontrol('Style','text','String','VALUE OF W IN BASIC UNITS','position',[100,60,200,20]);
winput2=uicontrol('Style','edit','position',[100,40,200,20]);
winput2.Callback=@fullunicalc;
imshow('MATLAB/class tools/Capture1.JPG')
Xmini=linspace(0,L/2,50);
    function fullunicalc(winput2,event)
        wct=str2double(get(winput2,'string'));
     disp('w value in basic units for centered triangular load')
     disp(wct)
 for i=1:50
    x=Xmini(i);
     ydfrm=-(wct*x/(24*E*I))*((L^3)-(2*L*(x^2))+(x^3));
    DfrmMat(n,i)= ydfrm;
    DfrmMat(n,101-i)=ydfrm;
 end
    end
 
n=n+1;
end