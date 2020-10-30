function [] = capture_5_5()
clear;clc;close all;
% boss battle game alpha v5.5
% arrow keys to move, wasd to attack, wasd+space to block
% please manually close with control+c to terminate
% boss has 20 points of health, player has 3


% movement may get stuck in a certain direction, 
% it may be a matlab internal bug, possible to write function to correct,
% but not implimented at the moment
% occasional boss teleport is not a bug
% spike damage not yet implimented

%%
[v,~,alpha]= imread('ch2.png');
[a,b,~] = size(v);
fr = [];
fb = [];
fg = [];
for i=a:-1:1
    for j=1:b
        if v(i,j,3) == 255 && v(i,j,1) == 0 && v(i,j,2) == 0
            fb(end+1:end+2) = [i-1,j+1];
        elseif v(i,j,1) == 255 && v(i,j,2) == 0 && v(i,j,3) == 0
            fr(end+1:end+2) = [i+1,j-1];
        elseif v(i,j,1) == 0 && v(i,j,2) == 255 && v(i,j,3) == 0
            fg(end+1:end+2) = [i-1,j];
        end
    end
end
for i = 1:2:127
C{i} = v(fr(i):fb(i),fb(i+1):fr(i+1),:);
A{i} = alpha(fr(i):fb(i),fb(i+1):fr(i+1),:);
P_offset{i} = [fb(i)-fr(i),fg(i+1)-fb(i+1)]; % y, x
end
%monster
[v2,~,alpha2]= imread('boss.png');
[a2,b2,~] = size(v2);
fr2 = [];
fb2 = [];
fg2 = [];
for i=a2:-1:1
    for j=1:b2
        if v2(i,j,3) == 255 && v2(i,j,1) == 0 && v2(i,j,2) == 0
            fb2(end+1:end+2) = [i-1,j+1];
        elseif v2(i,j,1) == 255 && v2(i,j,2) == 0 && v2(i,j,3) == 0
            fr2(end+1:end+2) = [i+1,j-1];
        elseif v2(i,j,1) == 0 && v2(i,j,2) == 255 && v2(i,j,3) == 0
            fg2(end+1:end+2) = [i-1,j];
        end
    end
end
for i = 1:2:3
C2{i} = v2(fr2(i):fb2(i),fb2(i+1):fr2(i+1),:);
A2{i} = alpha2(fr2(i):fb2(i),fb2(i+1):fr2(i+1),:);
end
%ghost
[v3,~,alpha3]= imread('ghost.png');
[a3,b3,~] = size(v3);
fr3 = [];
fb3 = [];
fg3 = [];
for i=a3:-1:1
    for j=1:b3
        if v3(i,j,3) == 255 && v3(i,j,1) == 0 && v3(i,j,2) == 0
            fb3(end+1:end+2) = [i-1,j+1];
        elseif v3(i,j,1) == 255 && v3(i,j,2) == 0 && v3(i,j,3) == 0
            fr3(end+1:end+2) = [i+1,j-1];
        elseif v3(i,j,1) == 0 && v3(i,j,2) == 255 && v3(i,j,3) == 0
            fg3(end+1:end+2) = [i-1,j];
        end
    end
end
for i = 1:2:15
C3{i} = v3(fr3(i):fb3(i),fb3(i+1):fr3(i+1),:);
A3{i} = alpha3(fr3(i):fb3(i),fb3(i+1):fr3(i+1),:);
end
%thron
[v4,~,alpha4]= imread('thron.png');
[a4,b4,~] = size(v4);
fr4 = [];
fb4 = [];
fg4 = [];
for i=a4:-1:1
    for j=1:b4
        if v4(i,j,3) == 255 && v4(i,j,1) == 0 && v4(i,j,2) == 0
            fb4(end+1:end+2) = [i-1,j+1];
        elseif v4(i,j,1) == 255 && v4(i,j,2) == 0 && v4(i,j,3) == 0
            fr4(end+1:end+2) = [i+1,j-1];
        elseif v4(i,j,1) == 0 && v4(i,j,2) == 255 && v4(i,j,3) == 0
            fg4(end+1:end+2) = [i-1,j];
        end
    end
end
for i = 1:2:21
C4{i} = v4(fr4(i):fb4(i),fb4(i+1):fr4(i+1),:);
A4{i} = alpha4(fr4(i):fb4(i),fb4(i+1):fr4(i+1),:);
end
%% frames
S.N.Walk1 = C{17};
S.N.Walk2 = C{19};
S.N.defend1 = C{21};
S.N.defend2 = C{23};
S.N.stab1 = C{25};
S.N.stab2 = C{27};
S.N.attack1 = C{29};
S.N.attack2 = C{31};
S.E.Walk1 = C{49};
S.E.Walk2 = C{51};
S.E.defend1 = C{53};
S.E.defend2 = C{55};
S.E.stab1 = C{57};
S.E.stab2 = C{59};
S.E.attack1 = C{61};
S.E.attack2 = C{63};
S.S.Walk1 = C{81};
S.S.Walk2 = C{83};
S.S.defend1 = C{85};
S.S.defend2 = C{87};
S.S.stab1 = C{89};
S.S.stab2 = C{91};
S.S.attack1 = C{93};
S.S.attack2 = C{95};            
S.W.Walk1 = C{113};
S.W.Walk2 = C{115};
S.W.defend1 = C{117};
S.W.defend2 = C{119};
S.W.stab1 = C{121};
S.W.stab2 = C{123};
S.W.attack1 = C{125};
S.W.attack2 = C{127};           
S.NE.Walk1 = C{33};
S.NE.Walk2 = C{35};
S.NE.defend1 = C{37};
S.NE.defend2 = C{39};
S.NE.stab1 = C{41};
S.NE.stab2 = C{43};
S.NE.attack1 = C{45};
S.NE.attack2 = C{47};
S.SE.Walk1 = C{65};
S.SE.Walk2 = C{67};
S.SE.defend1 = C{69};
S.SE.defend2 = C{71};
S.SE.stab1 = C{73};
S.SE.stab2 = C{75};
S.SE.attack1 = C{77};
S.SE.attack2 = C{79};
S.SW.Walk1 = C{97};
S.SW.Walk2 = C{99};
S.SW.defend1 = C{101};
S.SW.defend2 = C{103};
S.SW.stab1 = C{105};
S.SW.stab2 = C{107};
S.SW.attack1 = C{109};
S.SW.attack2 = C{111};
S.NW.Walk1 = C{1};
S.NW.Walk2 = C{3};
S.NW.defend1 = C{5};
S.NW.defend2 = C{7};
S.NW.stab1 = C{9};
S.NW.stab2 = C{11};
S.NW.attack1 = C{13};
S.NW.attack2 = C{15};
S.N.Walk1A = A{17};
S.N.Walk2A = A{19};
S.N.defend1A = A{21};
S.N.defend2A = A{23};
S.N.stab1A = A{25};
S.N.stab2A = A{27};
S.N.attack1A = A{29};
S.N.attack2A = A{31};
S.E.Walk1A = A{49};
S.E.Walk2A = A{51};
S.E.defend1A = A{53};
S.E.defend2A = A{55};
S.E.stab1A = A{57};
S.E.stab2A = A{59};
S.E.attack1A = A{61};
S.E.attack2A = A{63};
S.S.Walk1A = A{81};
S.S.Walk2A = A{83};
S.S.defend1A = A{85};
S.S.defend2A = A{87};
S.S.stab1A = A{89};
S.S.stab2A = A{91};
S.S.attack1A = A{93};
S.S.attack2A = A{95};            
S.W.Walk1A = A{113};
S.W.Walk2A = A{115};
S.W.defend1A = A{117};
S.W.defend2A = A{119};
S.W.stab1A = A{121};
S.W.stab2A = A{123};
S.W.attack1A = A{125};
S.W.attack2A = A{127};           
S.NE.Walk1A = A{33};
S.NE.Walk2A = A{35};
S.NE.defend1A = A{37};
S.NE.defend2A = A{39};
S.NE.stab1A = A{41};
S.NE.stab2A = A{43};
S.NE.attack1A = A{45};
S.NE.attack2A = A{47};
S.SE.Walk1A = A{65};
S.SE.Walk2A = A{67};
S.SE.defend1A = A{69};
S.SE.defend2A = A{71};
S.SE.stab1A = A{73};
S.SE.stab2A = A{75};
S.SE.attack1A = A{77};
S.SE.attack2A = A{79};
S.SW.Walk1A = A{97};
S.SW.Walk2A = A{99};
S.SW.defend1A = A{101};
S.SW.defend2A = A{103};
S.SW.stab1A = A{105};
S.SW.stab2A = A{107};
S.SW.attack1A = A{109};
S.SW.attack2A = A{111};
S.NW.Walk1A = A{1};
S.NW.Walk2A = A{3};
S.NW.defend1A = A{5};
S.NW.defend2A = A{7};
S.NW.stab1A = A{9};
S.NW.stab2A = A{11};
S.NW.attack1A = A{13};
S.NW.attack2A = A{15};
S.N.Walk1P = P_offset{17};
S.N.Walk2P = P_offset{19};
S.N.defend1P = P_offset{21};
S.N.defend2P = P_offset{23};
S.N.stab1P = P_offset{25};
S.N.stab2P = P_offset{27};
S.N.attack1P = P_offset{29};
S.N.attack2P = P_offset{31};
S.E.Walk1P = P_offset{49};
S.E.Walk2P = P_offset{51};
S.E.defend1P = P_offset{53};
S.E.defend2P = P_offset{55};
S.E.stab1P = P_offset{57};
S.E.stab2P = P_offset{59};
S.E.attack1P = P_offset{61};
S.E.attack2P = P_offset{63};
S.S.Walk1P = P_offset{81};
S.S.Walk2P = P_offset{83};
S.S.defend1P = P_offset{85};
S.S.defend2P = P_offset{87};
S.S.stab1P = P_offset{89};
S.S.stab2P = P_offset{91};
S.S.attack1P = P_offset{93};
S.S.attack2P = P_offset{95};            
S.W.Walk1P = P_offset{113};
S.W.Walk2P = P_offset{115};
S.W.defend1P = P_offset{117};
S.W.defend2P = P_offset{119};
S.W.stab1P = P_offset{121};
S.W.stab2P = P_offset{123};
S.W.attack1P = P_offset{125};
S.W.attack2P = P_offset{127};           
S.NE.Walk1P = P_offset{33};
S.NE.Walk2P = P_offset{35};
S.NE.defend1P = P_offset{37};
S.NE.defend2P = P_offset{39};
S.NE.stab1P = P_offset{41};
S.NE.stab2P = P_offset{43};
S.NE.attack1P = P_offset{45};
S.NE.attack2P = P_offset{47};
S.SE.Walk1P = P_offset{65};
S.SE.Walk2P = P_offset{67};
S.SE.defend1P = P_offset{69};
S.SE.defend2P = P_offset{71};
S.SE.stab1P = P_offset{73};
S.SE.stab2P = P_offset{75};
S.SE.attack1P = P_offset{77};
S.SE.attack2P = P_offset{79};
S.SW.Walk1P = P_offset{97};
S.SW.Walk2P = P_offset{99};
S.SW.defend1P = P_offset{101};
S.SW.defend2P = P_offset{103};
S.SW.stab1P = P_offset{105};
S.SW.stab2P = P_offset{107};
S.SW.attack1P = P_offset{109};
S.SW.attack2P = P_offset{111};
S.NW.Walk1P = P_offset{1};
S.NW.Walk2P = P_offset{3};
S.NW.defend1P = P_offset{5};
S.NW.defend2P = P_offset{7};
S.NW.stab1P = P_offset{9};
S.NW.stab2P = P_offset{11};
S.NW.attack1P = P_offset{13};
S.NW.attack2P = P_offset{15};
S.B.front=C2{1};
S.B.back=C2{3};
S.B.front1=A2{1};
S.B.back1=A2{3};
S.GR1=C3{1};
S.GR2=C3{3};
S.GS=C3{5};
S.GL1=C3{7};
S.GL2=C3{9};
S.GB1=C3{11};
S.GB2=C3{13};
S.GB3=C3{15};
S.GR11=A3{1};
S.GR22=A3{3};
S.GS1=A3{5};
S.GL11=A3{7};
S.GL22=A3{9};
S.GB11=A3{11};
S.GB22=A3{13};
S.GB33=A3{15};
S.Th1=C4{1};
S.Th2=C4{3};
S.Th3=C4{5};
S.Th11=A4{1};
S.Th22=A4{3};
S.Th33=A4{5};
abc=figure();
[skullbox_height, skullbox_width, ~] = size(S.GS);
skull.xrefchange=ceil(skullbox_width/2)-1;
skull.yrefchange=ceil(skullbox_height/2)-1;
%% test 1
%settings
set(gca,'YDir','reverse');
hold on;
axis image;
axis([0 600 0 600]);

%background
img1=imread('bkd1.png'); 
bkd=image(img1); 

%char
char.hitbox=imread('charbox.png');
[cbox_height, cbox_width, ~] = size(char.hitbox);
[monbox_height, monbox_width, ~] = size(S.B.front1);
% char.xpos=300;
% char.ypos=300;
% char.xrefpoint=char.xpos+ceil(cbox_width/2)-1;
% char.yrefpoint=char.ypos+cbox_height-1;
%char_box=image('XData',char.xpos,'YData',char.ypos,'CData',char.hitbox);



%draw on
char.frame=S.NE.Walk1;
char.frame_alpha=S.NE.Walk1A;
char.frame_offset=S.NE.Walk1P;
%char_im=image('XData',char.xrefpoint-char.frame_offset(2),'YData',char.yrefpoint-char.frame_offset(1),'CData',char.frame,'AlphaData', char.frame_alpha);

x=300;
y=300;
c=300;
d=100;
if c-x<=0 && d-y<=0
monster=image('XData',c,'YData',d,'CData',S.B.front,'AlphaData',S.B.front1); 
end
if c-x>0 && d-y<=0
monster=image('XData',c,'YData',d,'CData',S.B.front,'AlphaData',S.B.front1); 
end
if c-x>=0 && d-y>0
monsterb=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1);
end
if c-x<0 && d-y>0
monsterb=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1);
end

%% test 2
pause(3)
frame=1;
E=0;
sum=0;
N=0;
D=0;
DDD=0;
F=0;
T=0;
T1=0;
T2=0;
T3=0;
T4=0;
stun=20;
monster_stun=0;
hitflag2=0;
atk_x=50;
atk_y=80;
knback=30;
char.xrefpoint=300;
char.yrefpoint=300;
char.health=3;
mon.xrefpoint=500;
mon.yrefpoint=500;
mon.health=20;
char_block_flag=0;
ghost_range=10;
ghost_dmg=1;
%atk_x=50;
%atk_y=80;
char_mon_maxdist_x=atk_x;
char_mon_maxdist_y=atk_y;
role=image('XData',x,'YData',y,'CData',S.S.Walk1,'AlphaData',S.S.Walk1A);
KeyNames = {'w','a','s','d','uparrow','downarrow','leftarrow','rightarrow','space'};
KeyStatus = false(1, length(KeyNames));
    set(abc,'KeyPressFcn', @stl_KeyDown, 'KeyReleaseFcn', @stl_KeyUp); %,...
    % Main Game Cycle
while 1

T=T+1;
T1=T1+1;
T2=T2+1; 
T3=T3+1;
T4=T4+1;
 %% monster
if (((c+40)-(x+5))^2+((d+65)-(y+10))^2)>=6400  && c-x>0 && (d-y>0 || d-y<=0) %%&& monster_stun<=0
 

 delete(monster) 


 if c-x>0 && d-y>0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*5.^4);
   d=d+round(f*5.^4);

 elseif c-x>0 && d-y<0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*6.^4);
   d=d+round(f*6.^4);
  
 elseif c-x<0 && d-y>0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*5.^4);
   d=d+round(f*5.^4);
  
 elseif c-x<0 && d-y<0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*6.^4);
   d=d+round(f*6.^4);
 
 elseif c-x==0 && d-y>0
  d=d-2;

 elseif c-x==0 && d-y<0
    d=d+2;

 elseif d-y==0 && c-x>0
    c=c-2;

 elseif d-y==0 && c-x<0
    c=c+2;

     
end

monster=image('XData',c,'YData',d,'CData',S.B.front,'AlphaData',S.B.front1); 
mon.xrefpoint=c+ceil(monbox_width/2)-1;
mon.yrefpoint=d+ceil(monbox_height/2)-1;
pause(0.01)
end


if  (((c+40)-(x+5))^2+((d+65)-(y+10))^2)>=8000 && c-x<0 && (d-y>0 || d-y<=0)

     delete(monster) 


 if c-x>0 && d-y>0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*5.^4);
   d=d+round(f*5.^4);

 elseif c-x>0 && d-y<0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*6.^4);
   d=d+round(f*6.^4);
  
 elseif c-x<0 && d-y>0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*5.^4);
   d=d+round(f*5.^4);
  
 elseif c-x<0 && d-y<0  
   e=(x-c)/((x-c)^2+(y-d)^2)^1/2;
   f=(y-d)/((x-c)^2+(y-d)^2)^1/2;
   c=c+round(e*6.^4);
   d=d+round(f*6.^4);
 
 elseif c-x==0 && d-y>0
  d=d-2;

 elseif c-x==0 && d-y<0
    d=d+2;

 elseif d-y==0 && c-x>0
    c=c-2;

 elseif d-y==0 && c-x<0
    c=c+2;

     
 end

monster=image('XData',c,'YData',d,'CData',S.B.front,'AlphaData',S.B.front1); 
mon.xrefpoint=c+ceil(monbox_width/2)-1;
mon.yrefpoint=d+ceil(monbox_height/2)-1;
pause(0.03)
end
 


        
         


%% ghost 
if  (100>T && T>83) || (T>10 && 37>T)
Dn1=d;
Dn2=d;
Cn1=c;
Cn2=c;
Cn3=c;
Cn4=c;
X=15;
X1=7;
X2=12;
DD=0.001;
D=D+1;
if D>3 && 17>D

   if D==4
       
      ghost=image('XData',c,'YData',Dn1,'CData',S.GB1,'AlphaData',S.GB11);
      ghost1=image('XData',Cn1,'YData',Dn1,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1,'YData',Dn2,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2,'YData',Dn2,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3,'YData',Dn2,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4,'YData',Dn2,'CData',S.GL2,'AlphaData',S.GL22);
      %char_hitcheck(health_in,proj_x,proj_y,char_x,char_y,range,damage,block)
      n1=0;
      n2=0;
      char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag); 
      pause(DD)
      
       
   elseif D==5   
       
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)
       
       
      ghost=image('XData',c+X,'YData',Dn1-X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-X,'YData',Dn1-X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-X1,'YData',Dn2+X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+X1,'YData',Dn2+X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-4*X2,'YData',Dn2+X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+4*X2,'YData',Dn2+X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=1;
      n2=4;
      char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);     
      pause(DD)
      
   
   elseif D==6
        
        delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)
       
        ghost=image('XData',c+2*X,'YData',Dn1-2*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-2*X,'YData',Dn1-2*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-2*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+2*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-2*X1,'YData',Dn2+2*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+2*X1,'YData',Dn2+2*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-5*X2,'YData',Dn2+2*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+5*X2,'YData',Dn2+2*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;
      n2=n2+1;
      char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);         
      pause(DD)
      
      
      elseif D==7
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)
          
        ghost=image('XData',c+3*X,'YData',Dn1-3*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-3*X,'YData',Dn1-3*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-3*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+3*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-3*X1,'YData',Dn2+3*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+3*X1,'YData',Dn2+3*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-6*X2,'YData',Dn2+3*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+6*X2,'YData',Dn2+3*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;
      n2=n2+1;
      char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);
      char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
      pause(DD)
    
   
   elseif D==8
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
        ghost=image('XData',c+4*X,'YData',Dn1-4*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-4*X,'YData',Dn1-4*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-4*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+4*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-4*X1,'YData',Dn2+4*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+4*X1,'YData',Dn2+4*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-7*X2,'YData',Dn2+4*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+7*X2,'YData',Dn2+4*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
       
    
   
   elseif D==9
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+5*X,'YData',Dn1-5*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-5*X,'YData',Dn1-5*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-5*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+5*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-5*X1,'YData',Dn2+5*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+5*X1,'YData',Dn2+5*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-8*X2,'YData',Dn2+5*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+8*X2,'YData',Dn2+5*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
          
    elseif D==10
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+6*X,'YData',Dn1-6*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-6*X,'YData',Dn1-6*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-6*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+6*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-6*X1,'YData',Dn2+6*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+6*X1,'YData',Dn2+6*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-9*X2,'YData',Dn2+6*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+9*X2,'YData',Dn2+6*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
   
      elseif D==11
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+7*X,'YData',Dn1-7*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-7*X,'YData',Dn1-7*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-7*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+7*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-7*X1,'YData',Dn2+7*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+7*X1,'YData',Dn2+7*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-10*X2,'YData',Dn2+7*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+10*X2,'YData',Dn2+7*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
      
      elseif D==12
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+8*X,'YData',Dn1-8*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-8*X,'YData',Dn1-8*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-8*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+8*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-8*X1,'YData',Dn2+8*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+8*X1,'YData',Dn2+8*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-11*X2,'YData',Dn2+8*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+11*X2,'YData',Dn2+8*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);    
      
    elseif D==13
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+9*X,'YData',Dn1-9*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-9*X,'YData',Dn1-9*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-9*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+9*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-9*X1,'YData',Dn2+9*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+9*X1,'YData',Dn2+9*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-12*X2,'YData',Dn2+9*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+12*X2,'YData',Dn2+9*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);     
      
     elseif D==14
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+10*X,'YData',Dn1-10*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-10*X,'YData',Dn1-10*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-10*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+10*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-10*X1,'YData',Dn2+10*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+10*X1,'YData',Dn2+10*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-13*X2,'YData',Dn2+10*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+13*X2,'YData',Dn2+10*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);     
      
      elseif D==15
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
       ghost=image('XData',c+11*X,'YData',Dn1-11*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-11*X,'YData',Dn1-11*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-11*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+11*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-11*X1,'YData',Dn2+11*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+11*X1,'YData',Dn2+11*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-14*X2,'YData',Dn2+11*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+14*X2,'YData',Dn2+11*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);     
      
      elseif D==16
        
       delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7)  
       
      ghost=image('XData',c+12*X,'YData',Dn1-12*X,'CData',S.GB1,'AlphaData',S.GB11);     
      ghost1=image('XData',Cn1-12*X,'YData',Dn1-12*X,'CData',S.GB3,'AlphaData',S.GB33);   
      ghost2=image('XData',Cn2,'YData',Dn1-12*X,'CData',S.GB2,'AlphaData',S.GB22); 
      ghost3=image('XData',c,'YData',Dn2+12*X,'CData',S.GS,'AlphaData',S.GS1); 
      ghost4=image('XData',Cn1-12*X1,'YData',Dn2+12*X,'CData',S.GR2,'AlphaData',S.GR22);
      ghost5=image('XData',Cn2+12*X1,'YData',Dn2+12*X,'CData',S.GL1,'AlphaData',S.GL11);
      ghost6=image('XData',Cn3-15*X2,'YData',Dn2+12*X,'CData',S.GR1,'AlphaData',S.GR11);
      ghost7=image('XData',Cn4+15*X2,'YData',Dn2+12*X,'CData',S.GL2,'AlphaData',S.GL22);
      n1=n1+1;       n2=n2+1;       char.health=char_hitcheck(char.health,c+n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2,Dn1-n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,c,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn1-n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn2+n1*X1,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn3-n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);       char.health=char_hitcheck(char.health,Cn4+n2*X2,Dn2+n1*X,char.xrefpoint,char.yrefpoint,ghost_range,ghost_dmg,char_block_flag);     
      
      delete(ghost)
       delete(ghost1)        
       delete(ghost2)
       delete(ghost3)
       delete(ghost4)
       delete(ghost5)
       delete(ghost6)
       delete(ghost7) 
      
        D=0; 
        T=0;
   end
end
end
%% teleport
if 189>T1 && T1>187
N=N+1;
% case 1
if x+176<528 && c-x<0  && y+228<528 && d-y<0   && N==1
c=x+100;
d=y+100;

% case 2
elseif x-100>73 && c-x>0 && y+228<528 && d-y<0   && N==1
c=x-100;
d=y+100;

% case 3
elseif x+176<528 && c-x<0 && y-100>121 && d-y>0   && N==1
c=x+100;
d=y-100;

% case 4
elseif x-100>73 && c-x>0 &&  y-100>121 && d-y>0  && N==1
c=x-100;
d=y-100;

% case 5
elseif  c-x>0  && x-100>73  && d==c  && N==1
c=x-100;

% case 6
elseif c-x<0 && x+176<528  && d==c && N==1
c=x+100;

% case 7
elseif d-y>0 && y-100>121  && c==x && N==1
d=y-100;

% case 8
elseif d-y<0  && y+228<528   && c==x  && N==1
 d=y+100; 

elseif   c==x && d==y && N==1
 c=300;
 d=300;

end
N=0;
T1=0;

end

%% 範圍技
x1=300;
y1=300;
xn1=x1;
xn2=x1;
yn1=y1;
yn2=y1;

xn4=100;
yn4=500;
xn5=500;
yn5=500;
xn6=100;
yn6=100;
xn7=500;
yn7=100;
EEE=0.001;
EEEE=0.001;
EE=0.001;
axis([0 600 0 600]);
if  508>T2 &&  T2>500
   E=E+1; 
if E>3 && E<30
    if E==4
        thron=image('XData',x1+20,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron1=image('XData',x1-20,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron2=image('XData',xn1,'YData',y1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron3=image('XData',xn2,'YData',y1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron4=image('XData',xn1+20,'YData',yn1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron5=image('XData',xn2+20,'YData',yn1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron6=image('XData',xn1-20,'YData',yn2+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron7=image('XData',xn2-20,'YData',yn2-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron8=image('XData',x1+55,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron9=image('XData',x1-55,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron10=image('XData',xn1,'YData',y1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron11=image('XData',xn2,'YData',y1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron12=image('XData',xn1+55,'YData',yn1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron13=image('XData',xn2+55,'YData',yn1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron14=image('XData',xn1-55,'YData',yn2+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron15=image('XData',xn2-55,'YData',yn2-55,'CData',S.Th1,'AlphaData',S.Th11);
        
         
        thron16=image('XData',x1+60,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron17=image('XData',x1-60,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron18=image('XData',xn1,'YData',y1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron19=image('XData',xn2,'YData',y1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron20=image('XData',xn1+60,'YData',yn1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron21=image('XData',xn2+60,'YData',yn1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron22=image('XData',xn1-60,'YData',yn2+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron23=image('XData',xn2-60,'YData',yn2-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron24=image('XData',x1+100,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron25=image('XData',x1-100,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron26=image('XData',xn1,'YData',y1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron27=image('XData',xn2,'YData',y1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron28=image('XData',xn1+100,'YData',yn1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron29=image('XData',xn2+100,'YData',yn1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron30=image('XData',xn1-100,'YData',yn2+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron31=image('XData',xn2-100,'YData',yn2-100,'CData',S.Th1,'AlphaData',S.Th11);
        
        thron32=image('XData',x1+130,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron33=image('XData',x1-130,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron34=image('XData',xn1,'YData',y1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron35=image('XData',xn2,'YData',y1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron36=image('XData',xn1+130,'YData',yn1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron37=image('XData',xn2+130,'YData',yn1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron38=image('XData',xn1-130,'YData',yn2+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron39=image('XData',xn2-130,'YData',yn2-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron40=image('XData',x1+180,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron41=image('XData',x1-180,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron42=image('XData',xn1,'YData',y1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron43=image('XData',xn2,'YData',y1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron44=image('XData',xn1+180,'YData',yn1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron45=image('XData',xn2+180,'YData',yn1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron46=image('XData',xn1-180,'YData',yn2+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron47=image('XData',xn2-180,'YData',yn2-180,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron48=image('XData',x1+160,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron49=image('XData',x1-160,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron50=image('XData',xn1,'YData',y1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron51=image('XData',xn2,'YData',y1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron52=image('XData',xn1+160,'YData',yn1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron53=image('XData',xn2+160,'YData',yn1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron54=image('XData',xn1-160,'YData',yn2+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron55=image('XData',xn2-160,'YData',yn2-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron56=image('XData',x1+240,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron57=image('XData',x1-240,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron58=image('XData',xn1,'YData',y1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron59=image('XData',xn2,'YData',y1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron60=image('XData',xn1+240,'YData',yn1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron61=image('XData',xn2+240,'YData',yn1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron62=image('XData',xn1-240,'YData',yn2+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron63=image('XData',xn2-240,'YData',yn2-240,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron64=image('XData',x1+190,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron65=image('XData',x1-190,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron66=image('XData',xn1,'YData',y1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron67=image('XData',xn2,'YData',y1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron68=image('XData',xn1+190,'YData',yn1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron69=image('XData',xn2+190,'YData',yn1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron70=image('XData',xn1-190,'YData',yn2+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron71=image('XData',xn2-190,'YData',yn2-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron72=image('XData',x1+230,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron73=image('XData',x1-230,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron74=image('XData',xn1,'YData',y1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron75=image('XData',xn2,'YData',y1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron76=image('XData',xn1+230,'YData',yn1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron77=image('XData',xn2+230,'YData',yn1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron78=image('XData',xn1-230,'YData',yn2+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron79=image('XData',xn2-230,'YData',yn2-230,'CData',S.Th1,'AlphaData',S.Th11);
        pause(EEE)
         
          delete(thron)
        delete(thron1)
        delete(thron2)
        delete(thron3)
        delete(thron4)
        delete(thron5)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        delete(thron14)
        delete(thron15)
        delete(thron16)
        delete(thron17)
        delete(thron18)
        delete(thron19)
        delete(thron20)
        delete(thron21)
        delete(thron22)
        delete(thron23)
        delete(thron24)
        delete(thron25)
        delete(thron26)
        delete(thron27)
        delete(thron28)
        delete(thron29)
        delete(thron30)
        delete(thron31)
        delete(thron32)
        delete(thron33)
        delete(thron34)
        delete(thron35)
        delete(thron36)
        delete(thron37)
        delete(thron38)
        delete(thron39)
        delete(thron40)
        delete(thron41)
        delete(thron42)
        delete(thron43)
        delete(thron44)
        delete(thron45)
        delete(thron46)
        delete(thron47)
        delete(thron48)
        delete(thron49)
        delete(thron50)
        delete(thron51)
        delete(thron52)
        delete(thron53)
        delete(thron54)
        delete(thron55)
        delete(thron56)
        delete(thron57)
        delete(thron58)
        delete(thron59)
        delete(thron60)
        delete(thron61)
        delete(thron62)
        delete(thron63)
        delete(thron64)
        delete(thron65)
        delete(thron66)
        delete(thron67)
        delete(thron68)
        delete(thron69)
        delete(thron70)
        delete(thron71)
        delete(thron72)
        delete(thron73)
        delete(thron74)
        delete(thron75)
        delete(thron76)
        delete(thron77)
        delete(thron78)
        delete(thron79)
        
        
    elseif E==5
        
         thron=image('XData',x1+20,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron1=image('XData',x1-20,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron2=image('XData',xn1,'YData',y1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron3=image('XData',xn2,'YData',y1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron4=image('XData',xn1+20,'YData',yn1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron5=image('XData',xn2+20,'YData',yn1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron6=image('XData',xn1-20,'YData',yn2+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron7=image('XData',xn2-20,'YData',yn2-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron8=image('XData',x1+55,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron9=image('XData',x1-55,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron10=image('XData',xn1,'YData',y1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron11=image('XData',xn2,'YData',y1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron12=image('XData',xn1+55,'YData',yn1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron13=image('XData',xn2+55,'YData',yn1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron14=image('XData',xn1-55,'YData',yn2+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron15=image('XData',xn2-55,'YData',yn2-55,'CData',S.Th1,'AlphaData',S.Th11);
        
         
        thron16=image('XData',x1+60,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron17=image('XData',x1-60,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron18=image('XData',xn1,'YData',y1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron19=image('XData',xn2,'YData',y1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron20=image('XData',xn1+60,'YData',yn1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron21=image('XData',xn2+60,'YData',yn1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron22=image('XData',xn1-60,'YData',yn2+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron23=image('XData',xn2-60,'YData',yn2-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron24=image('XData',x1+100,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron25=image('XData',x1-100,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron26=image('XData',xn1,'YData',y1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron27=image('XData',xn2,'YData',y1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron28=image('XData',xn1+100,'YData',yn1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron29=image('XData',xn2+100,'YData',yn1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron30=image('XData',xn1-100,'YData',yn2+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron31=image('XData',xn2-100,'YData',yn2-100,'CData',S.Th1,'AlphaData',S.Th11);
        
        thron32=image('XData',x1+130,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron33=image('XData',x1-130,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron34=image('XData',xn1,'YData',y1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron35=image('XData',xn2,'YData',y1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron36=image('XData',xn1+130,'YData',yn1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron37=image('XData',xn2+130,'YData',yn1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron38=image('XData',xn1-130,'YData',yn2+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron39=image('XData',xn2-130,'YData',yn2-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron40=image('XData',x1+180,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron41=image('XData',x1-180,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron42=image('XData',xn1,'YData',y1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron43=image('XData',xn2,'YData',y1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron44=image('XData',xn1+180,'YData',yn1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron45=image('XData',xn2+180,'YData',yn1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron46=image('XData',xn1-180,'YData',yn2+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron47=image('XData',xn2-180,'YData',yn2-180,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron48=image('XData',x1+160,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron49=image('XData',x1-160,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron50=image('XData',xn1,'YData',y1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron51=image('XData',xn2,'YData',y1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron52=image('XData',xn1+160,'YData',yn1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron53=image('XData',xn2+160,'YData',yn1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron54=image('XData',xn1-160,'YData',yn2+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron55=image('XData',xn2-160,'YData',yn2-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron56=image('XData',x1+240,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron57=image('XData',x1-240,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron58=image('XData',xn1,'YData',y1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron59=image('XData',xn2,'YData',y1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron60=image('XData',xn1+240,'YData',yn1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron61=image('XData',xn2+240,'YData',yn1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron62=image('XData',xn1-240,'YData',yn2+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron63=image('XData',xn2-240,'YData',yn2-240,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron64=image('XData',x1+190,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron65=image('XData',x1-190,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron66=image('XData',xn1,'YData',y1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron67=image('XData',xn2,'YData',y1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron68=image('XData',xn1+190,'YData',yn1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron69=image('XData',xn2+190,'YData',yn1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron70=image('XData',xn1-190,'YData',yn2+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron71=image('XData',xn2-190,'YData',yn2-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron72=image('XData',x1+230,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron73=image('XData',x1-230,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron74=image('XData',xn1,'YData',y1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron75=image('XData',xn2,'YData',y1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron76=image('XData',xn1+230,'YData',yn1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron77=image('XData',xn2+230,'YData',yn1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron78=image('XData',xn1-230,'YData',yn2+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron79=image('XData',xn2-230,'YData',yn2-230,'CData',S.Th1,'AlphaData',S.Th11);
        pause(EEE)
        
          delete(thron)
        delete(thron1)
        delete(thron2)
        delete(thron3)
        delete(thron4)
        delete(thron5)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        delete(thron14)
        delete(thron15)
        delete(thron16)
        delete(thron17)
        delete(thron18)
        delete(thron19)
        delete(thron20)
        delete(thron21)
        delete(thron22)
        delete(thron23)
        delete(thron24)
        delete(thron25)
        delete(thron26)
        delete(thron27)
        delete(thron28)
        delete(thron29)
        delete(thron30)
        delete(thron31)
        delete(thron32)
        delete(thron33)
        delete(thron34)
        delete(thron35)
        delete(thron36)
        delete(thron37)
        delete(thron38)
        delete(thron39)
        delete(thron40)
        delete(thron41)
        delete(thron42)
        delete(thron43)
        delete(thron44)
        delete(thron45)
        delete(thron46)
        delete(thron47)
        delete(thron48)
        delete(thron49)
        delete(thron50)
        delete(thron51)
        delete(thron52)
        delete(thron53)
        delete(thron54)
        delete(thron55)
        delete(thron56)
        delete(thron57)
        delete(thron58)
        delete(thron59)
        delete(thron60)
        delete(thron61)
        delete(thron62)
        delete(thron63)
        delete(thron64)
        delete(thron65)
        delete(thron66)
        delete(thron67)
        delete(thron68)
        delete(thron69)
        delete(thron70)
        delete(thron71)
        delete(thron72)
        delete(thron73)
        delete(thron74)
        delete(thron75)
        delete(thron76)
        delete(thron77)
        delete(thron78)
        delete(thron79)
        
        
    elseif E==6
        thron=image('XData',x1+20,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron1=image('XData',x1-20,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron2=image('XData',xn1,'YData',y1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron3=image('XData',xn2,'YData',y1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron4=image('XData',xn1+20,'YData',yn1+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron5=image('XData',xn2+20,'YData',yn1-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron6=image('XData',xn1-20,'YData',yn2+20,'CData',S.Th1,'AlphaData',S.Th11);
        thron7=image('XData',xn2-20,'YData',yn2-20,'CData',S.Th1,'AlphaData',S.Th11);
        thron8=image('XData',x1+55,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron9=image('XData',x1-55,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron10=image('XData',xn1,'YData',y1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron11=image('XData',xn2,'YData',y1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron12=image('XData',xn1+55,'YData',yn1+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron13=image('XData',xn2+55,'YData',yn1-55,'CData',S.Th1,'AlphaData',S.Th11);
        thron14=image('XData',xn1-55,'YData',yn2+55,'CData',S.Th1,'AlphaData',S.Th11);
        thron15=image('XData',xn2-55,'YData',yn2-55,'CData',S.Th1,'AlphaData',S.Th11);
        
         
        thron16=image('XData',x1+60,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron17=image('XData',x1-60,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron18=image('XData',xn1,'YData',y1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron19=image('XData',xn2,'YData',y1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron20=image('XData',xn1+60,'YData',yn1+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron21=image('XData',xn2+60,'YData',yn1-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron22=image('XData',xn1-60,'YData',yn2+60,'CData',S.Th1,'AlphaData',S.Th11);
        thron23=image('XData',xn2-60,'YData',yn2-60,'CData',S.Th1,'AlphaData',S.Th11);
        thron24=image('XData',x1+100,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron25=image('XData',x1-100,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron26=image('XData',xn1,'YData',y1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron27=image('XData',xn2,'YData',y1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron28=image('XData',xn1+100,'YData',yn1+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron29=image('XData',xn2+100,'YData',yn1-100,'CData',S.Th1,'AlphaData',S.Th11);
        thron30=image('XData',xn1-100,'YData',yn2+100,'CData',S.Th1,'AlphaData',S.Th11);
        thron31=image('XData',xn2-100,'YData',yn2-100,'CData',S.Th1,'AlphaData',S.Th11);
        
        thron32=image('XData',x1+130,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron33=image('XData',x1-130,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron34=image('XData',xn1,'YData',y1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron35=image('XData',xn2,'YData',y1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron36=image('XData',xn1+130,'YData',yn1+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron37=image('XData',xn2+130,'YData',yn1-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron38=image('XData',xn1-130,'YData',yn2+130,'CData',S.Th1,'AlphaData',S.Th11);
        thron39=image('XData',xn2-130,'YData',yn2-130,'CData',S.Th1,'AlphaData',S.Th11);
        thron40=image('XData',x1+180,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron41=image('XData',x1-180,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron42=image('XData',xn1,'YData',y1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron43=image('XData',xn2,'YData',y1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron44=image('XData',xn1+180,'YData',yn1+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron45=image('XData',xn2+180,'YData',yn1-180,'CData',S.Th1,'AlphaData',S.Th11);
        thron46=image('XData',xn1-180,'YData',yn2+180,'CData',S.Th1,'AlphaData',S.Th11);
        thron47=image('XData',xn2-180,'YData',yn2-180,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron48=image('XData',x1+160,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron49=image('XData',x1-160,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron50=image('XData',xn1,'YData',y1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron51=image('XData',xn2,'YData',y1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron52=image('XData',xn1+160,'YData',yn1+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron53=image('XData',xn2+160,'YData',yn1-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron54=image('XData',xn1-160,'YData',yn2+160,'CData',S.Th1,'AlphaData',S.Th11);
        thron55=image('XData',xn2-160,'YData',yn2-160,'CData',S.Th1,'AlphaData',S.Th11);
        thron56=image('XData',x1+240,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron57=image('XData',x1-240,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron58=image('XData',xn1,'YData',y1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron59=image('XData',xn2,'YData',y1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron60=image('XData',xn1+240,'YData',yn1+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron61=image('XData',xn2+240,'YData',yn1-240,'CData',S.Th1,'AlphaData',S.Th11);
        thron62=image('XData',xn1-240,'YData',yn2+240,'CData',S.Th1,'AlphaData',S.Th11);
        thron63=image('XData',xn2-240,'YData',yn2-240,'CData',S.Th1,'AlphaData',S.Th11);
        
         thron64=image('XData',x1+190,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron65=image('XData',x1-190,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron66=image('XData',xn1,'YData',y1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron67=image('XData',xn2,'YData',y1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron68=image('XData',xn1+190,'YData',yn1+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron69=image('XData',xn2+190,'YData',yn1-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron70=image('XData',xn1-190,'YData',yn2+190,'CData',S.Th1,'AlphaData',S.Th11);
        thron71=image('XData',xn2-190,'YData',yn2-190,'CData',S.Th1,'AlphaData',S.Th11);
        thron72=image('XData',x1+230,'YData',yn1,'CData',S.Th1,'AlphaData',S.Th11);
        thron73=image('XData',x1-230,'YData',yn2,'CData',S.Th1,'AlphaData',S.Th11);
        thron74=image('XData',xn1,'YData',y1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron75=image('XData',xn2,'YData',y1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron76=image('XData',xn1+230,'YData',yn1+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron77=image('XData',xn2+230,'YData',yn1-230,'CData',S.Th1,'AlphaData',S.Th11);
        thron78=image('XData',xn1-230,'YData',yn2+230,'CData',S.Th1,'AlphaData',S.Th11);
        thron79=image('XData',xn2-230,'YData',yn2-230,'CData',S.Th1,'AlphaData',S.Th11);
        pause(EEE)
         
          delete(thron)
        delete(thron1)
        delete(thron2)
        delete(thron3)
        delete(thron4)
        delete(thron5)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        delete(thron14)
        delete(thron15)
        delete(thron16)
        delete(thron17)
        delete(thron18)
        delete(thron19)
        delete(thron20)
        delete(thron21)
        delete(thron22)
        delete(thron23)
        delete(thron24)
        delete(thron25)
        delete(thron26)
        delete(thron27)
        delete(thron28)
        delete(thron29)
        delete(thron30)
        delete(thron31)
        delete(thron32)
        delete(thron33)
        delete(thron34)
        delete(thron35)
        delete(thron36)
        delete(thron37)
        delete(thron38)
        delete(thron39)
        delete(thron40)
        delete(thron41)
        delete(thron42)
        delete(thron43)
        delete(thron44)
        delete(thron45)
        delete(thron46)
        delete(thron47)
        delete(thron48)
        delete(thron49)
        delete(thron50)
        delete(thron51)
        delete(thron52)
        delete(thron53)
        delete(thron54)
        delete(thron55)
        delete(thron56)
        delete(thron57)
        delete(thron58)
        delete(thron59)
        delete(thron60)
        delete(thron61)
        delete(thron62)
        delete(thron63)
        delete(thron64)
        delete(thron65)
        delete(thron66)
        delete(thron67)
        delete(thron68)
        delete(thron69)
        delete(thron70)
        delete(thron71)
        delete(thron72)
        delete(thron73)
        delete(thron74)
        delete(thron75)
        delete(thron76)
        delete(thron77)
        delete(thron78)
        delete(thron79)
    
    elseif E==7
        thron=image('XData',x1+20,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron1=image('XData',x1-20,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron2=image('XData',xn1,'YData',y1+20,'CData',S.Th3,'AlphaData',S.Th33);
        thron3=image('XData',xn2,'YData',y1-20,'CData',S.Th3,'AlphaData',S.Th33);
        thron4=image('XData',xn1+20,'YData',yn1+20,'CData',S.Th3,'AlphaData',S.Th33);
        thron5=image('XData',xn2+20,'YData',yn1-20,'CData',S.Th3,'AlphaData',S.Th33);
        thron6=image('XData',xn1-20,'YData',yn2+20,'CData',S.Th3,'AlphaData',S.Th33);
        thron7=image('XData',xn2-20,'YData',yn2-20,'CData',S.Th3,'AlphaData',S.Th33);
        thron8=image('XData',x1+55,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron9=image('XData',x1-55,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron10=image('XData',xn1,'YData',y1+55,'CData',S.Th3,'AlphaData',S.Th33);
        thron11=image('XData',xn2,'YData',y1-55,'CData',S.Th3,'AlphaData',S.Th33);
        thron12=image('XData',xn1+55,'YData',yn1+55,'CData',S.Th3,'AlphaData',S.Th33);
        thron13=image('XData',xn2+55,'YData',yn1-55,'CData',S.Th3,'AlphaData',S.Th33);
        thron14=image('XData',xn1-55,'YData',yn2+55,'CData',S.Th3,'AlphaData',S.Th33);
        thron15=image('XData',xn2-55,'YData',yn2-55,'CData',S.Th3,'AlphaData',S.Th33);

        
        thron16=image('XData',x1+60,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron17=image('XData',x1-60,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron18=image('XData',xn1,'YData',y1+60,'CData',S.Th3,'AlphaData',S.Th33);
        thron19=image('XData',xn2,'YData',y1-60,'CData',S.Th3,'AlphaData',S.Th33);
        thron20=image('XData',xn1+60,'YData',yn1+60,'CData',S.Th3,'AlphaData',S.Th33);
        thron21=image('XData',xn2+60,'YData',yn1-60,'CData',S.Th3,'AlphaData',S.Th33);
        thron22=image('XData',xn1-60,'YData',yn2+60,'CData',S.Th3,'AlphaData',S.Th33);
        thron23=image('XData',xn2-60,'YData',yn2-60,'CData',S.Th3,'AlphaData',S.Th33);
        thron24=image('XData',x1+100,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron25=image('XData',x1-100,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron26=image('XData',xn1,'YData',y1+100,'CData',S.Th3,'AlphaData',S.Th33);
        thron27=image('XData',xn2,'YData',y1-100,'CData',S.Th3,'AlphaData',S.Th33);
        thron28=image('XData',xn1+100,'YData',yn1+100,'CData',S.Th3,'AlphaData',S.Th33);
        thron29=image('XData',xn2+100,'YData',yn1-100,'CData',S.Th3,'AlphaData',S.Th33);
        thron30=image('XData',xn1-100,'YData',yn2+100,'CData',S.Th3,'AlphaData',S.Th33);
        thron31=image('XData',xn2-100,'YData',yn2-100,'CData',S.Th3,'AlphaData',S.Th33);

        
        thron32=image('XData',x1+130,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron33=image('XData',x1-130,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron34=image('XData',xn1,'YData',y1+130,'CData',S.Th3,'AlphaData',S.Th33);
        thron35=image('XData',xn2,'YData',y1-130,'CData',S.Th3,'AlphaData',S.Th33);
        thron36=image('XData',xn1+130,'YData',yn1+130,'CData',S.Th3,'AlphaData',S.Th33);
        thron37=image('XData',xn2+130,'YData',yn1-130,'CData',S.Th3,'AlphaData',S.Th33);
        thron38=image('XData',xn1-130,'YData',yn2+130,'CData',S.Th3,'AlphaData',S.Th33);
        thron39=image('XData',xn2-130,'YData',yn2-130,'CData',S.Th3,'AlphaData',S.Th33);
        thron40=image('XData',x1+180,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron41=image('XData',x1-180,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron42=image('XData',xn1,'YData',y1+180,'CData',S.Th3,'AlphaData',S.Th33);
        thron43=image('XData',xn2,'YData',y1-180,'CData',S.Th3,'AlphaData',S.Th33);
        thron44=image('XData',xn1+180,'YData',yn1+180,'CData',S.Th3,'AlphaData',S.Th33);
        thron45=image('XData',xn2+180,'YData',yn1-180,'CData',S.Th3,'AlphaData',S.Th33);
        thron46=image('XData',xn1-180,'YData',yn2+180,'CData',S.Th3,'AlphaData',S.Th33);
        thron47=image('XData',xn2-180,'YData',yn2-180,'CData',S.Th3,'AlphaData',S.Th33);
        
        
        
        thron48=image('XData',x1+160,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron49=image('XData',x1-160,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron50=image('XData',xn1,'YData',y1+160,'CData',S.Th3,'AlphaData',S.Th33);
        thron51=image('XData',xn2,'YData',y1-160,'CData',S.Th3,'AlphaData',S.Th33);
        thron52=image('XData',xn1+160,'YData',yn1+160,'CData',S.Th3,'AlphaData',S.Th33);
        thron53=image('XData',xn2+160,'YData',yn1-160,'CData',S.Th3,'AlphaData',S.Th33);
        thron54=image('XData',xn1-160,'YData',yn2+160,'CData',S.Th3,'AlphaData',S.Th33);
        thron55=image('XData',xn2-160,'YData',yn2-160,'CData',S.Th3,'AlphaData',S.Th33);
        thron56=image('XData',x1+240,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron57=image('XData',x1-240,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron58=image('XData',xn1,'YData',y1+240,'CData',S.Th3,'AlphaData',S.Th33);
        thron59=image('XData',xn2,'YData',y1-240,'CData',S.Th3,'AlphaData',S.Th33);
        thron60=image('XData',xn1+240,'YData',yn1+240,'CData',S.Th3,'AlphaData',S.Th33);
        thron61=image('XData',xn2+240,'YData',yn1-240,'CData',S.Th3,'AlphaData',S.Th33);
        thron62=image('XData',xn1-240,'YData',yn2+240,'CData',S.Th3,'AlphaData',S.Th33);
        thron63=image('XData',xn2-240,'YData',yn2-240,'CData',S.Th3,'AlphaData',S.Th33);
   

        thron64=image('XData',x1+190,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron65=image('XData',x1-190,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron66=image('XData',xn1,'YData',y1+190,'CData',S.Th3,'AlphaData',S.Th33);
        thron67=image('XData',xn2,'YData',y1-190,'CData',S.Th3,'AlphaData',S.Th33);
        thron68=image('XData',xn1+190,'YData',yn1+190,'CData',S.Th3,'AlphaData',S.Th33);
        thron69=image('XData',xn2+190,'YData',yn1-190,'CData',S.Th3,'AlphaData',S.Th33);
        thron70=image('XData',xn1-190,'YData',yn2+190,'CData',S.Th3,'AlphaData',S.Th33);
        thron71=image('XData',xn2-190,'YData',yn2-190,'CData',S.Th3,'AlphaData',S.Th33);
        thron72=image('XData',x1+230,'YData',yn1,'CData',S.Th3,'AlphaData',S.Th33);
        thron73=image('XData',x1-230,'YData',yn2,'CData',S.Th3,'AlphaData',S.Th33);
        thron74=image('XData',xn1,'YData',y1+230,'CData',S.Th3,'AlphaData',S.Th33);
        thron75=image('XData',xn2,'YData',y1-230,'CData',S.Th3,'AlphaData',S.Th33);
        thron76=image('XData',xn1+230,'YData',yn1+230,'CData',S.Th3,'AlphaData',S.Th33);
        thron77=image('XData',xn2+230,'YData',yn1-230,'CData',S.Th3,'AlphaData',S.Th33);
        thron78=image('XData',xn1-230,'YData',yn2+230,'CData',S.Th3,'AlphaData',S.Th33);
        thron79=image('XData',xn2-230,'YData',yn2-230,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
        delete(thron)
        delete(thron1)
        delete(thron2)
        delete(thron3)
        delete(thron4)
        delete(thron5)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        delete(thron14)
        delete(thron15)
        delete(thron16)
        delete(thron17)
        delete(thron18)
        delete(thron19)
        delete(thron20)
        delete(thron21)
        delete(thron22)
        delete(thron23)
        delete(thron24)
        delete(thron25)
        delete(thron26)
        delete(thron27)
        delete(thron28)
        delete(thron29)
        delete(thron30)
        delete(thron31)
        delete(thron32)
        delete(thron33)
        delete(thron34)
        delete(thron35)
        delete(thron36)
        delete(thron37)
        delete(thron38)
        delete(thron39)
        delete(thron40)
        delete(thron41)
        delete(thron42)
        delete(thron43)
        delete(thron44)
        delete(thron45)
        delete(thron46)
        delete(thron47)
        delete(thron48)
        delete(thron49)
        delete(thron50)
        delete(thron51)
        delete(thron52)
        delete(thron53)
        delete(thron54)
        delete(thron55)
        delete(thron56)
        delete(thron57)
        delete(thron58)
        delete(thron59)
        delete(thron60)
        delete(thron61)
        delete(thron62)
        delete(thron63)
        delete(thron64)
        delete(thron65)
        delete(thron66)
        delete(thron67)
        delete(thron68)
        delete(thron69)
        delete(thron70)
        delete(thron71)
        delete(thron72)
        delete(thron73)
        delete(thron74)
        delete(thron75)
        delete(thron76)
        delete(thron77)
        delete(thron78)
        delete(thron79)
    
      T2=0;
      E=0;
    end
end
end
%% 直線
if (T3>50 && 93>T3) || (T3>2 && 45>T3)
  F=F+1;
  if F>5 && F<50
    if F==11
        
        thron6=image('XData',xn4+2*(c-100)/8,'YData',yn4-2*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==12
        thron7=image('XData',xn4+4*(c-100)/8,'YData',yn4-4*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==13
        thron8=image('XData',xn4+6*(c-100)/8,'YData',yn4-6*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==14
        thron9=image('XData',xn4+8*(c-100)/8,'YData',yn4-8*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==15
        thron10=image('XData',xn4+10*(c-100)/8,'YData',yn4-10*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==16
        thron11=image('XData',xn4+12*(c-100)/8,'YData',yn4-12*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==17
        thron12=image('XData',xn4+14*(c-100)/8,'YData',yn4-14*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==18
        thron13=image('XData',xn4+16*(c-100)/8,'YData',yn4-16*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        
        
    elseif F==19
        
        thron6=image('XData',xn5-2*(500-c)/8,'YData',yn5-2*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==20
        thron7=image('XData',xn5-4*(500-c)/8,'YData',yn5-4*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==21
        thron8=image('XData',xn5-6*(500-c)/8,'YData',yn5-6*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==22
        thron9=image('XData',xn5-8*(500-c)/8,'YData',yn5-8*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==23
        thron10=image('XData',xn5-10*(500-c)/8,'YData',yn5-10*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==24
        thron11=image('XData',xn5-12*(500-c)/8,'YData',yn5-12*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==25
        thron12=image('XData',xn5-14*(500-c)/8,'YData',yn5-14*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==26
        thron13=image('XData',xn5-16*(500-c)/8,'YData',yn5-16*(500-d)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        
        
    elseif F==27
        
        thron6=image('XData',xn6+2*(c-100)/8,'YData',yn6+2*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==28
        thron7=image('XData',xn6+4*(c-100)/8,'YData',yn6+4*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==29
        thron8=image('XData',xn6+6*(c-100)/8,'YData',yn6+6*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==30
        thron9=image('XData',xn6+8*(c-100)/8,'YData',yn6+8*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
    elseif F==31
        thron10=image('XData',xn6+10*(c-100)/8,'YData',yn6+10*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==32
        thron11=image('XData',xn6+12*(c-100)/8,'YData',yn6+12*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==33
        thron12=image('XData',xn6+14*(c-100)/8,'YData',yn6+14*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==34
        thron13=image('XData',xn6+16*(c-100)/8,'YData',yn6+16*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
        
    elseif F==35
        
        thron6=image('XData',xn7-2*(500-c)/8,'YData',yn7+2*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==36
        thron7=image('XData',xn7-4*(500-c)/8,'YData',yn7+4*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==37
        thron8=image('XData',xn7-6*(500-c)/8,'YData',yn7+6*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==38
        thron9=image('XData',xn7-8*(500-c)/8,'YData',yn7+8*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==39
        thron10=image('XData',xn7-10*(500-c)/8,'YData',yn7+10*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==40
        thron11=image('XData',xn7-12*(500-c)/8,'YData',yn7+12*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==41
        thron12=image('XData',xn7-14*(500-c)/8,'YData',yn7+14*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
    elseif F==42
        thron13=image('XData',xn7-16*(500-c)/8,'YData',yn7+16*(d-100)/8,'CData',S.Th3,'AlphaData',S.Th33);
        pause(EE)
        
        delete(thron6)
        delete(thron7)
        delete(thron8)
        delete(thron9)
        delete(thron10)
        delete(thron11)
        delete(thron12)
        delete(thron13)
     F=0;
    T3=0;
    end
  end
end




   h=[5];
if rem(sum,2) == 1
    direct = 1;  %right leg
else
    direct = -1;% left leg
end
 KeyStatus;
    if (KeyStatus(3)), h=12;
    elseif KeyStatus(1)h=11;
    elseif (KeyStatus(4)), h=14;
    elseif (KeyStatus(2)), h=13; end
    if ((KeyStatus(1) == 1) && (KeyStatus(2) == 1)),h=15;
    elseif ((KeyStatus(1)) && (KeyStatus(4))), h=16; 
    elseif ((KeyStatus(2)) && ((KeyStatus(3)))), h=17;
    elseif ((KeyStatus(3)) && (KeyStatus(4))), h=18;  end
       if (KeyStatus(7)), h=4;  
       elseif (KeyStatus(5)), h=8;
       elseif (KeyStatus(8)), h=6;
       elseif (KeyStatus(6)), h=2;  end
       if ((KeyStatus(5)) && (KeyStatus(8))), h=9;  
       elseif ((KeyStatus(5)) && (KeyStatus(7))), h=7;  
       elseif ((KeyStatus(6)) && (KeyStatus(7))), h=1;  
       elseif ((KeyStatus(6)) &&(KeyStatus(8))), h=3;  end
       if ((KeyStatus(1)) &&(KeyStatus(9))), h=27; 
       elseif ((KeyStatus(4)) &&(KeyStatus(9))),h=30;
       elseif ((KeyStatus(2)) &&(KeyStatus(9))),h=29;
       elseif ((KeyStatus(3)) &&(KeyStatus(9))),h=28; end
       if ((KeyStatus(1)) && (KeyStatus(2)) &&(KeyStatus(9))),h=31;
       elseif ((KeyStatus(1)) && (KeyStatus(4)) &&(KeyStatus(9))),h=32;
       elseif ((KeyStatus(3)) && (KeyStatus(2)) &&(KeyStatus(9))),h=33;
       elseif ((KeyStatus(3)) && (KeyStatus(4)) &&(KeyStatus(9))),h=34; end
    key = h;



%% role
char_block_flag=0;
if x >=510 
    x = x-11;
elseif x <=70
    x = x+11;
elseif y >= 500
    y = y-11;
elseif y <=100
    y = y+11;


elseif key == 4 && direct == 1 %left
    delete(role)
    x = x-10;
    role=image('XData',x,'YData',y,'CData',S.W.Walk1,'AlphaData',S.W.Walk1A);
    sum = sum+1;
elseif key == 4  %left
    delete(role)
    x = x-10;
    role=image('XData',x,'YData',y,'CData',S.W.Walk2,'AlphaData',S.W.Walk2A);
    sum = sum+1;
elseif key == 2 && direct == 1 %down
    delete(role)
    y = y+10;
    role=image('XData',x,'YData',y,'CData',S.S.Walk1,'AlphaData',S.S.Walk1A);
    sum = sum+1;
elseif key == 2  %down
    delete(role)
    y = y+10;
    role=image('XData',x,'YData',y,'CData',S.S.Walk2,'AlphaData',S.S.Walk2A);
    sum = sum+1;
elseif key == 8 && direct == 1 %up
    delete(role)
    y = y-10;
    role=image('XData',x,'YData',y,'CData',S.N.Walk1,'AlphaData',S.N.Walk1A);
    sum = sum+1;
elseif key == 8  %up
    delete(role)
    y = y-10;
    role=image('XData',x,'YData',y,'CData',S.N.Walk2,'AlphaData',S.N.Walk2A);
    sum = sum+1;
elseif key == 6 && direct == 1 %right
    delete(role)
    x = x+10;
    role=image('XData',x,'YData',y,'CData',S.E.Walk1,'AlphaData',S.E.Walk1A);
    sum = sum+1;
elseif key == 6  %right
    delete(role)
    x = x+10;
    role=image('XData',x,'YData',y,'CData',S.E.Walk2,'AlphaData',S.E.Walk2A);
    sum = sum+1;
elseif key == 7 && direct == 1 %left+up
    delete(role)
    x = x-7;
    y = y-7;
    role=image('XData',x,'YData',y,'CData',S.NW.Walk1,'AlphaData',S.NW.Walk1A);
    sum = sum+1;
elseif key == 7  %left+up
    delete(role)
    x = x-7;
    y = y-7;
    role=image('XData',x,'YData',y,'CData',S.NW.Walk2,'AlphaData',S.NW.Walk2A);
    sum = sum+1;
elseif key == 9 && direct == 1 %right+up
    delete(role)
    x = x+7;
    y = y-7;
    role=image('XData',x,'YData',y,'CData',S.NE.Walk1,'AlphaData',S.NE.Walk1A);
    sum = sum+1;
elseif key == 9  %right+up
    delete(role)
    x = x+7;
    y = y-7;
    role=image('XData',x,'YData',y,'CData',S.NE.Walk2,'AlphaData',S.NE.Walk2A);
    sum = sum+1;
elseif key == 1 && direct == 1 %left+dowm
    delete(role)
    x = x-7;
    y = y+7;
    role=image('XData',x,'YData',y,'CData',S.SW.Walk1,'AlphaData',S.SW.Walk1A);
    sum = sum+1;
elseif key == 1  %left+dowm
    delete(role)
    x = x-7;
    y = y+7;
    role=image('XData',x,'YData',y,'CData',S.SW.Walk2,'AlphaData',S.SW.Walk2A);
    sum = sum+1;
elseif key == 3 && direct == 1 %right+dowm
    delete(role)
    x = x+7;
    y = y+7;
    role=image('XData',x,'YData',y,'CData',S.SE.Walk1,'AlphaData',S.SE.Walk1A);
    sum = sum+1;
elseif key == 3  %right+dowm
    delete(role)
    x = x+7;
    y = y+7;
    role=image('XData',x,'YData',y,'CData',S.SE.Walk2,'AlphaData',S.SE.Walk2A);
    sum = sum+1;
elseif key == 14  %right+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.E.attack1,'AlphaData',S.E.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.E.attack2,'AlphaData',S.E.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.E.Walk1,'AlphaData',S.E.Walk1A);
    sum = sum+1;
elseif key == 16  %right+up+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NE.attack1,'AlphaData',S.NE.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NE.attack2,'AlphaData',S.NE.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NE.Walk1,'AlphaData',S.NE.Walk1A);
    sum = sum+1;
elseif key == 15  %left+up+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NW.attack1,'AlphaData',S.NW.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NW.attack2,'AlphaData',S.NW.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NW.Walk1,'AlphaData',S.NW.Walk1A);
    sum = sum+1;
elseif key == 13  %left+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.W.attack1,'AlphaData',S.W.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.W.attack2,'AlphaData',S.W.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.W.Walk1,'AlphaData',S.W.Walk1A);
    sum = sum+1;
elseif key == 11  %up+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.N.attack1,'AlphaData',S.N.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.N.attack2,'AlphaData',S.N.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.N.Walk1,'AlphaData',S.N.Walk1A);
    sum = sum+1;
elseif key == 12  %down+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.S.attack1,'AlphaData',S.S.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.S.attack2,'AlphaData',S.S.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.S.Walk1,'AlphaData',S.S.Walk1A);
    sum = sum+1;
elseif key == 18  %down+right+stab
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SE.attack1,'AlphaData',S.SE.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SE.attack2,'AlphaData',S.SE.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SE.Walk1,'AlphaData',S.SE.Walk1A);
    sum = sum+1;
elseif key == 17  %down+left+attack
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SW.attack1,'AlphaData',S.SW.attack1A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SW.attack2,'AlphaData',S.SW.attack2A);
    pause(0.04)
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SW.Walk1,'AlphaData',S.SW.Walk1A);
    sum = sum+1;
elseif key == 27  %face up and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.N.defend1,'AlphaData',S.N.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 31  %face left-up and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NW.defend1,'AlphaData',S.NW.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 32  %face right-up and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.NE.defend1,'AlphaData',S.NE.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 30  %face right and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.E.defend1,'AlphaData',S.E.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 29  %face left and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.W.defend1,'AlphaData',S.W.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 33  %face left-down and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SW.defend1,'AlphaData',S.SW.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 28  %face down and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.S.defend1,'AlphaData',S.S.defend1A);
    sum = sum+1;
    char_block_flag=1;
elseif key == 34  %face right-down and stop action
    delete(role)
    role=image('XData',x,'YData',y,'CData',S.SE.defend1,'AlphaData',S.SE.defend1A);
    sum = sum+1;
    char_block_flag=1;
end
[charbox_height, charbox_width, ~] = size(S.SE.Walk1A);
char.xrefpoint=x+ceil(charbox_width/2)-1;
char.yrefpoint=y+ceil(charbox_height/2)-1;

%% 角色攻擊 王扣血 判定 可以用且來判定
BOSS=1; 
if (key == 11) %UP
%disp('-1')

elseif (key == 12) %DOWN
%disp('-2')

elseif (key == 13) %LEFT
%disp('-3')

elseif (key == 14) %RIGHT
%disp('-4')

elseif (key == 15) %UPLEFT
%disp('-5')

elseif (key == 16) %UPRIGHT
%disp('-6')

elseif (key == 17) %DOWNLEFT
%disp('-7')

elseif (key == 18) %DOWNright
%disp('-8')
end

pause(0.05)

%if monster_stun>0
%monster_stun=monster_stun-1;
%else
        if hitflag2==1 && ((((c+40)-(x+5))^2+((d+65)-(y+10))^2)>=6400  && c-x>0 && (d-y>0 || d-y<=0)||(((c+40)-(x+5))^2+((d+65)-(y+10))^2)>=8000 && c-x<0 && (d-y>0 || d-y<=0));
        delete(monster_hit) 
        hitflag2=0;
        end
    if KeyStatus(1) && (char.yrefpoint-mon.yrefpoint<=atk_y && char.yrefpoint-mon.yrefpoint>=0) && abs(char.xrefpoint-mon.xrefpoint)<=char_mon_maxdist_x && hitflag2==0%w
    mon.health=mon.health-1;
    disp('remaining monster health')
    mon.health
    title(mon.health)
    d=d-knback;
%    monster_stun=stun;
    hitflag2=1;
    delete(monster) 
    monster_hit=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1); 
    elseif KeyStatus(3) && (-char.yrefpoint+mon.yrefpoint<=atk_y && -char.yrefpoint+mon.yrefpoint>=0) && abs(char.xrefpoint-mon.xrefpoint)<=char_mon_maxdist_x && hitflag2==0 %s
    mon.health=mon.health-1;
    disp('remaining monster health')
    mon.health
    title(mon.health)
    d=d+knback;
%    monster_stun=stun;
    hitflag2=1;
    delete(monster) 
    monster_hit=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1); 
    elseif KeyStatus(2) && (char.xrefpoint-mon.xrefpoint<=atk_x && char.xrefpoint-mon.xrefpoint>=0) && abs(char.yrefpoint-mon.yrefpoint)<=char_mon_maxdist_y && hitflag2==0 %a
    mon.health=mon.health-1;
    disp('remaining monster health')
    mon.health
    title(mon.health)
    c=c-knback;
%    monster_stun=stun;
    hitflag2=1;
    delete(monster) 
    monster_hit=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1); 
    elseif KeyStatus(4) && (-char.xrefpoint+mon.xrefpoint<=atk_x && -char.xrefpoint+mon.xrefpoint>=0) && abs(char.yrefpoint-mon.yrefpoint)<=char_mon_maxdist_y && hitflag2==0 %d
    mon.health=mon.health-1;
    disp('remaining monster health')
    mon.health
    title(mon.health)
    c=c+knback;
%    monster_stun=stun;
    hitflag2=1;
    delete(monster) 
    monster_hit=image('XData',c,'YData',d,'CData',S.B.back,'AlphaData',S.B.back1); 
    end
%end

if mon.health<=0
    delete(monster_hit)
    disp('win')
    title('win')
    pause(100);
    
end
if char.health<=0
    delete(role)
    disp('lose')
    title('lose')
    pause(100);
end

 end

% Callback functions
    function stl_KeyUp(hObject, eventdata, handles)
        LastKeyStatus = KeyStatus;
        key = get(hObject,'CurrentKey');
        KeyStatus = (~strcmp(key, KeyNames) & LastKeyStatus);
    end

    function stl_KeyDown(hObject, eventdata, handles)
        LastKeyStatus = KeyStatus;
        key = get(hObject,'CurrentKey');
        KeyStatus = (strcmp(key, KeyNames) | LastKeyStatus);
    end
    function [char_health]=char_hitcheck(health_in,proj_x,proj_y,char_x,char_y,range,damage,block)
        char_health1=health_in;
        if ((proj_x+skull.xrefchange-char_x)^2+(proj_y+skull.xrefchange-char_y)^2)^0.5<=range && block==0;
            char_health1=health_in-damage;
            disp('remaining player health')
            char_health1
            title(char_health1)
            pause(2);
        end
        char_health=char_health1;
    end

end

