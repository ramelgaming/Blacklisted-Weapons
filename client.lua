return (function(a,b)local c=select;local d=string.byte;local e=string.sub;local f={{b='OpArgR',c='OpArgN'},{b='OpArgK',c='OpArgN'},{b='OpArgU',c='OpArgU'},{b='OpArgR',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgK',c='OpArgN'},{b='OpArgR',c='OpArgK'},{b='OpArgK',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgK',c='OpArgK'},{b='OpArgU',c='OpArgU'},{b='OpArgR',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgR'},{b='OpArgR',c='OpArgN'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgR',c='OpArgU'},{b='OpArgR',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgU',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgN',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgN',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgU',c='OpArgN'}}local g={'ABC','ABx','ABC','ABC','ABC','ABx','ABC','ABx','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','AsBx','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','AsBx','AsBx','ABC','ABC','ABC','ABx','ABC'}local function h(i,j,k)if k then local l=i/2^(j-1)%2^(k-1-(j-1)+1)return l-l%1 else local m=2^(j-1)if i%(m+m)>=m then return 1 else return 0 end end end;local function n(o)local p=1;local q;local r;local function s()local t=d(o,p,p)p=p+1;return t end;local function u()local v,w,x,y=d(o,p,p+3)p=p+4;return y*16777216+x*65536+w*256+v end;local function z()return u()*4294967296+u()end;local function A()local B=u()local C=u()local D=1;local E=h(C,1,20)*2^32+B;local F=h(C,21,31)local G=(-1)^h(C,32)if F==0 then if E==0 then return G*0 else F=1;D=0 end elseif F==2047 then if E==0 then return G*1/0 else return G*0/0 end end;return math.ldexp(G,F-1023)*(D+E/2^52)end;local function H(I)local J;if I then J=e(o,p,p+I-1)p=p+I else I=q()if I==0 then return end;J=e(o,p,p+I-1)p=p+I end;return J end;local function K()local L={}local M={}local N={}local O={Instr=L,Const=M,Proto=N,Lines={},Name=H(),FirstL=r(),LastL=r(),Upvals=s(),Args=s(),Vargs=s(),Stack=s()}local P={}if O.Name then O.Name=e(O.Name,1,-2)end;for Q=1,r()do local R=u()local S=h(R,1,6)local T=g[S+1]local U=f[S+1]local V={Enum=S,Value=R,h(R,7,14)}if T=='ABC'then V[2]=h(R,24,32)V[3]=h(R,15,23)elseif T=='ABx'then V[2]=h(R,15,32)elseif T=='AsBx'then V[2]=h(R,15,32)-131071 end;do if S==26 or S==27 then V[3]=V[3]==0 end;if S>=23 and S<=25 then V[1]=V[1]~=0 end;if U.b=='OpArgK'then V[3]=V[3]or false;if V[2]>=256 then local W=V[2]-256;V[4]=W;local X=P[W]if not X then X={}P[W]=X end;X[#X+1]={Inst=V,Register=4}end end;if U.c=='OpArgK'then V[4]=V[4]or false;if V[3]>=256 then local W=V[3]-256;V[5]=W;local X=P[W]if not X then X={}P[W]=X end;X[#X+1]={Inst=V,Register=5}end end end;L[Q]=V end;for Q=1,r()do local T=s()local W;if T==1 then W=s()~=0 elseif T==3 then W=A()elseif T==4 then W=e(H(),1,-2)end;local Y=P[Q-1]if Y then for Z=1,#Y do Y[Z].Inst[Y[Z].Register]=W end end;M[Q-1]=W end;for Q=1,r()do N[Q-1]=K()end;do local _=O.Lines;for Q=1,r()do _[Q]=u()end;for a0=1,r()do H()u()u()end;for a0=1,r()do H()end end;return O end;do assert(H(4)=="\27Lua","Lua bytecode expected.")assert(s()==0x51,"Only Lua 5.1 is supported.")s()s()local a1=s()local a2=s()if a1==4 then r=u elseif a1==8 then r=z else error('Integer size not supported',2)end;if a2==4 then q=u elseif a2==8 then q=z else error('Sizet size not supported',2)end;assert(H(3)=="\4\8\0","Unsupported bytecode target platform")end;return K()end;local function a3(...)return c('#',...),{...}end;local function a4(O,b,a5)local L=O.Instr;local M=O.Const;local N=O.Proto;local function a6(a7,a8)local a9=O.Name or'Code'local aa=O.Lines[a8]or'?'error(string.format('%s:%s: %s',a9,aa,tostring(a7)),0)end;return function(...)local ab,ac=1,-1;local ad,ae={},c('#',...)-1;local af={}local ag={}local ah=setmetatable({},{__index=af,__newindex=function(a0,ai,aj)if ai>ac then ac=ai end;af[ai]=aj end})local function ak()local V,al;while true do V=L[ab]al=V.Enum;ab=ab+1;if al==0 then ah[V[1]]=ah[V[2]]elseif al==1 then ah[V[1]]=M[V[2]]elseif al==2 then ah[V[1]]=V[2]~=0;if V[3]~=0 then ab=ab+1 end elseif al==3 then local am=ah;for Q=V[1],V[2]do am[Q]=nil end elseif al==4 then ah[V[1]]=a5[V[2]]elseif al==5 then ah[V[1]]=b[M[V[2]]]elseif al==6 then local am=ah;am[V[1]]=am[V[2]][V[5]or am[V[3]]]elseif al==7 then b[M[V[2]]]=ah[V[1]]elseif al==8 then a5[V[2]]=ah[V[1]]elseif al==9 then local am=ah;am[V[1]][V[4]or am[V[2]]]=V[5]or am[V[3]]elseif al==10 then ah[V[1]]={}elseif al==11 then local am=ah;local an=V[1]local ao=am[V[2]]local ap=V[5]or am[V[3]]am[an+1]=ao;am[an]=ao[ap]elseif al==12 then local am=ah;am[V[1]]=(V[4]or am[V[2]])+(V[5]or am[V[3]])elseif al==13 then local am=ah;am[V[1]]=(V[4]or am[V[2]])-(V[5]or am[V[3]])elseif al==14 then local am=ah;am[V[1]]=(V[4]or am[V[2]])*(V[5]or am[V[3]])elseif al==15 then local am=ah;am[V[1]]=(V[4]or am[V[2]])/(V[5]or am[V[3]])elseif al==16 then local am=ah;am[V[1]]=(V[4]or am[V[2]])%(V[5]or am[V[3]])elseif al==17 then local am=ah;am[V[1]]=(V[4]or am[V[2]])^(V[5]or am[V[3]])elseif al==18 then ah[V[1]]=-ah[V[2]]elseif al==19 then ah[V[1]]=not ah[V[2]]elseif al==20 then ah[V[1]]=#ah[V[2]]elseif al==21 then local am=ah;local ao=V[2]local aq=am[ao]for Q=ao+1,V[3]do aq=aq..am[Q]end;ah[V[1]]=aq elseif al==22 then ab=ab+V[2]elseif al==23 then local am=ah;local ao=V[4]or am[V[2]]local ap=V[5]or am[V[3]]if ao==ap~=V[1]then ab=ab+1 end elseif al==24 then local am=ah;local ao=V[4]or am[V[2]]local ap=V[5]or am[V[3]]if ao<ap~=V[1]then ab=ab+1 end elseif al==25 then local am=ah;local ao=V[4]or am[V[2]]local ap=V[5]or am[V[3]]if ao<=ap~=V[1]then ab=ab+1 end elseif al==26 then if V[3]then if ah[V[1]]then ab=ab+1 end elseif ah[V[1]]then else ab=ab+1 end elseif al==27 then local ao=ah[V[2]]if V[3]then if ao then ab=ab+1 else ah[V[1]]=ao end elseif ao then ah[V[1]]=ao else ab=ab+1 end elseif al==28 then local an=V[1]local ao=V[2]local ap=V[3]local am=ah;local ar,as;local at,au;ar={}if ao~=1 then if ao~=0 then at=an+ao-1 else at=ac end;au=0;for Q=an+1,at do au=au+1;ar[au]=am[Q]end;at,as=a3(am[an](unpack(ar,1,at-an)))else at,as=a3(am[an]())end;ac=an-1;if ap~=1 then if ap~=0 then at=an+ap-2 else at=at+an-1 end;au=0;for Q=an,at do au=au+1;am[Q]=as[au]end end elseif al==29 then local an=V[1]local ao=V[2]local am=ah;local ar,as;local at;local av=0;ar={}if ao~=1 then if ao~=0 then at=an+ao-1 else at=ac end;for Q=an+1,at do ar[#ar+1]=am[Q]end;as={am[an](unpack(ar,1,at-an))}else as={am[an]()}end;for aw in pairs(as)do if aw>av then av=aw end end;return as,av elseif al==30 then local an=V[1]local ao=V[2]local am=ah;local au,ax;local at;if ao==1 then return elseif ao==0 then at=ac else at=an+ao-2 end;ax={}au=0;for Q=an,at do au=au+1;ax[au]=am[Q]end;return ax,au elseif al==31 then local an=V[1]local am=ah;local ay=am[an+2]local aw=am[an]+ay;am[an]=aw;if ay>0 then if aw<=am[an+1]then ab=ab+V[2]am[an+3]=aw end else if aw>=am[an+1]then ab=ab+V[2]am[an+3]=aw end end elseif al==32 then local an=V[1]local am=ah;am[an]=assert(tonumber(am[an]),'`for` initial value must be a number')am[an+1]=assert(tonumber(am[an+1]),'`for` limit must be a number')am[an+2]=assert(tonumber(am[an+2]),'`for` step must be a number')am[an]=am[an]-am[an+2]ab=ab+V[2]elseif al==33 then local an=V[1]local ap=V[3]local am=ah;local az=an+2;local aA={am[an](am[an+1],am[an+2])}for Q=1,ap do ah[az+Q]=aA[Q]end;if am[an+3]~=nil then am[an+2]=am[an+3]else ab=ab+1 end elseif al==34 then local an=V[1]local ao=V[2]local ap=V[3]local am=ah;if ap==0 then ab=ab+1;ap=L[ab].Value end;local az=(ap-1)*50;local aB=am[an]if ao==0 then ao=ac-an end;for Q=1,ao do aB[az+Q]=am[an+Q]end elseif al==35 then local an=V[1]local aC={}for Q=1,#ag do local aD=ag[Q]for aE=0,#aD do local aF=aD[aE]local am=aF[1]local p=aF[2]if am==ah and p>=an then aC[p]=am[p]aF[1]=aC end end end elseif al==36 then local aG=N[V[2]]local am=ah;local aH;local aI;if aG.Upvals~=0 then aH={}aI=setmetatable({},{__index=function(a0,ai)local aJ=aH[ai]return aJ[1][aJ[2]]end,__newindex=function(a0,ai,aj)local aJ=aH[ai]aJ[1][aJ[2]]=aj end})for Q=1,aG.Upvals do local aK=L[ab]if aK.Enum==0 then aH[Q-1]={am,aK[2]}elseif aK.Enum==4 then aH[Q-1]={a5,aK[2]}end;ab=ab+1 end;ag[#ag+1]=aH end;am[V[1]]=a4(aG,b,aI)elseif al==37 then local an=V[1]local ao=V[2]local am,aL=ah,ad;ac=an-1;for Q=an,an+(ao>0 and ao-1 or ae)do am[Q]=aL[Q-an]end end end end;local ar={...}for Q=0,ae do if Q>=O.Args then ad[Q-O.Args]=ar[Q+1]else ah[Q]=ar[Q+1]end end;local an,ao,ap=pcall(ak)if an then if ao and ap>0 then return unpack(ao,1,ap)end;return else a6(ao,ab-1)end end end;local aM=n(a)return a4(aM,b or getfenv(0)),aM end)("\27\76\117\97\81\0\1\4\4\4\8\0\32\0\0\0\64\73\114\111\110\98\114\101\119\47\110\101\116\99\111\114\101\97\112\112\50\46\48\47\111\117\116\46\108\117\97\0\0\0\0\0\0\0\0\0\0\0\2\28\84\0\0\0\5\0\0\0\6\64\64\0\69\0\0\0\70\128\192\0\133\0\0\0\134\192\64\1\197\0\1\0\198\64\193\1\5\129\1\0\6\193\65\2\69\1\2\0\90\65\0\0\22\0\0\128\100\1\0\0\133\65\2\0\197\129\2\0\5\194\2\0\69\2\3\0\164\66\0\0\0\0\128\0\0\0\128\4\0\0\0\1\192\2\0\5\1\67\3\0\220\130\0\1\5\131\3\0\26\3\0\0\22\192\0\128\5\131\3\0\6\195\67\6\26\67\0\0\22\0\0\128\36\131\0\0\100\195\0\0\129\3\4\0\228\3\1\0\0\0\0\0\0\0\128\5\0\0\0\7\0\0\0\6\36\68\1\0\0\0\0\6\0\0\0\0\0\0\128\5\0\0\0\7\100\132\1\0\0\0\128\7\0\0\128\6\0\0\0\2\128\4\128\7\228\196\1\0\0\0\0\9\0\0\0\1\0\0\128\5\0\0\0\7\0\0\128\0\0\0\0\6\0\0\0\0\0\0\128\1\0\5\128\7\100\5\2\0\0\0\128\3\164\69\2\0\0\0\128\7\0\0\0\6\0\0\128\6\0\0\0\8\0\0\128\8\0\0\128\9\0\0\0\11\228\133\2\0\0\0\128\10\0\0\128\3\0\0\0\4\0\6\128\11\64\6\0\11\92\134\128\0\138\6\0\0\192\6\128\2\220\6\128\0\28\134\0\0\29\6\128\0\30\6\0\0\30\0\128\0\17\0\0\0\4\7\0\0\0\115\116\114\105\110\103\0\4\5\0\0\0\98\121\116\101\0\4\5\0\0\0\99\104\97\114\0\4\4\0\0\0\115\117\98\0\4\6\0\0\0\116\97\98\108\101\0\4\7\0\0\0\99\111\110\99\97\116\0\4\5\0\0\0\109\97\116\104\0\4\6\0\0\0\108\100\101\120\112\0\4\8\0\0\0\103\101\116\102\101\110\118\0\4\13\0\0\0\115\101\116\109\101\116\97\116\97\98\108\101\0\4\7\0\0\0\115\101\108\101\99\116\0\4\7\0\0\0\117\110\112\97\99\107\0\4\9\0\0\0\116\111\110\117\109\98\101\114\0\4\199\0\0\0\50\52\49\50\52\53\50\55\53\50\51\57\50\52\68\50\50\84\50\50\89\50\49\72\50\52\68\50\55\53\50\51\53\50\51\80\50\55\57\50\49\69\50\51\80\50\55\53\50\51\56\50\51\80\50\55\73\50\49\67\50\55\73\50\52\53\50\51\56\50\55\67\50\52\53\50\49\70\50\55\82\50\52\53\50\52\55\50\55\53\50\52\53\50\52\54\50\52\48\50\55\88\50\54\68\50\54\70\50\55\48\50\54\90\50\54\57\50\52\54\50\51\78\50\55\88\50\54\49\50\54\56\50\54\83\50\53\49\50\54\50\50\54\86\50\54\82\50\54\56\50\54\69\50\54\85\50\54\83\50\54\57\50\54\89\50\54\70\50\53\49\50\54\86\50\54\75\50\53\49\50\53\72\50\54\75\50\54\83\50\54\90\50\55\88\50\52\53\0\4\4\0\0\0\98\105\116\0\4\5\0\0\0\98\120\111\114\0\3\0\0\0\0\0\0\240\63\11\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\0\0\0\2\3\0\0\0\5\0\0\0\30\0\0\1\30\0\128\0\1\0\0\0\4\5\0\0\0\95\69\78\86\0\0\0\0\0\3\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\3\1\0\14\65\0\0\0\65\0\0\0\129\0\0\0\202\0\0\0\1\65\0\0\74\1\0\0\129\129\0\0\205\193\64\2\1\194\0\0\160\193\0\128\132\2\0\0\192\2\128\4\156\130\0\1\73\129\130\4\159\129\254\127\129\193\0\0\228\1\0\0\4\0\128\0\4\0\0\1\0\0\0\0\0\0\0\3\4\2\0\0\64\2\128\3\92\2\128\0\28\130\0\0\64\0\0\4\201\64\128\129\20\2\0\0\24\0\2\3\22\64\7\128\0\2\128\3\28\130\128\0\70\2\130\2\90\2\0\0\22\64\0\128\134\0\130\2\22\128\1\128\64\2\128\0\132\2\0\1\192\2\128\0\1\195\0\0\65\195\0\0\156\130\0\2\149\128\130\4\64\2\128\0\132\2\0\1\192\2\0\1\1\195\0\0\65\195\0\0\156\130\0\2\85\130\130\4\73\65\2\2\84\2\128\1\76\194\192\4\128\2\0\1\192\2\0\1\12\193\64\2\64\0\128\5\201\128\130\4\22\128\247\127\5\2\1\0\6\66\65\4\64\2\128\1\29\2\0\1\30\2\0\0\30\0\128\0\6\0\0\0\4\1\0\0\0\0\3\0\0\0\0\0\0\112\64\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\240\63\4\6\0\0\0\116\97\98\108\101\0\4\7\0\0\0\99\111\110\99\97\116\0\1\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\4\0\0\6\26\0\0\0\4\0\0\0\68\0\128\0\132\0\0\1\196\0\128\1\4\1\128\1\92\128\0\2\129\0\0\0\28\128\128\1\68\0\128\1\76\64\192\0\72\0\128\1\68\0\0\0\132\0\128\0\196\0\0\1\4\1\128\1\68\1\128\1\76\1\128\2\77\65\192\2\156\128\0\2\193\0\0\0\92\128\128\1\132\0\128\1\140\0\0\1\136\0\128\1\94\0\0\1\30\0\128\0\2\0\0\0\3\0\0\0\0\0\0\66\64\3\0\0\0\0\0\0\240\63\0\0\0\0\26\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\2\0\0\0\2\0\0\0\101\0\8\0\0\0\25\0\0\0\2\0\0\0\111\0\21\0\0\0\25\0\0\0\4\0\0\0\2\0\0\0\117\0\2\0\0\0\99\0\2\0\0\0\100\0\2\0\0\0\108\0\65\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\13\0\0\0\2\0\0\0\100\0\0\0\0\0\64\0\0\0\2\0\0\0\101\0\3\0\0\0\64\0\0\0\2\0\0\0\111\0\3\0\0\0\64\0\0\0\2\0\0\0\116\0\3\0\0\0\64\0\0\0\2\0\0\0\97\0\4\0\0\0\64\0\0\0\2\0\0\0\110\0\5\0\0\0\64\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\8\0\0\0\14\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\8\0\0\0\14\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\8\0\0\0\14\0\0\0\2\0\0\0\108\0\9\0\0\0\13\0\0\0\2\0\0\0\108\0\15\0\0\0\64\0\0\0\2\0\0\0\105\0\20\0\0\0\64\0\0\0\2\0\0\0\108\0\31\0\0\0\58\0\0\0\3\0\0\0\2\0\0\0\114\0\2\0\0\0\117\0\2\0\0\0\99\0\0\0\0\0\1\0\0\0\1\0\0\0\0\2\0\8\35\0\0\0\129\0\0\0\193\64\0\0\24\0\128\128\22\128\3\128\24\64\128\128\22\0\3\128\16\129\64\0\80\129\192\0\87\64\1\2\22\0\0\128\204\128\128\1\141\1\1\0\143\129\64\3\205\65\129\0\207\129\192\3\142\128\64\1\64\0\128\3\0\0\0\3\22\128\251\127\24\64\0\0\22\0\0\128\0\0\128\0\24\0\128\128\22\0\2\128\16\129\64\0\24\0\129\128\22\0\0\128\204\128\128\1\77\1\1\0\79\129\192\2\142\128\64\1\0\0\128\2\22\0\253\127\222\0\0\1\30\0\128\0\3\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\0\64\0\0\0\0\35\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\7\0\0\0\2\0\0\0\108\0\0\0\0\0\34\0\0\0\2\0\0\0\101\0\0\0\0\0\34\0\0\0\2\0\0\0\111\0\2\0\0\0\34\0\0\0\2\0\0\0\110\0\2\0\0\0\34\0\0\0\2\0\0\0\99\0\8\0\0\0\18\0\0\0\2\0\0\0\97\0\8\0\0\0\18\0\0\0\2\0\0\0\101\0\25\0\0\0\32\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\0\3\0\6\27\0\0\0\154\0\0\0\22\0\3\128\205\0\192\0\209\192\128\128\207\192\0\0\13\1\64\1\77\1\192\0\13\65\1\2\12\1\64\2\17\1\129\128\208\0\129\1\16\1\192\1\13\1\129\1\30\1\0\1\22\128\2\128\205\0\192\0\209\192\128\128\12\193\128\1\16\1\1\0\25\0\129\1\22\128\0\128\1\1\0\0\26\65\0\0\22\0\0\128\1\129\0\0\30\1\0\1\30\0\128\0\3\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\0\0\64\3\0\0\0\0\0\0\0\0\0\0\0\0\27\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\5\0\0\0\2\0\0\0\111\0\0\0\0\0\26\0\0\0\2\0\0\0\108\0\0\0\0\0\26\0\0\0\2\0\0\0\101\0\0\0\0\0\26\0\0\0\2\0\0\0\108\0\11\0\0\0\14\0\0\0\2\0\0\0\108\0\17\0\0\0\26\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\4\0\0\7\37\0\0\0\4\0\0\0\68\0\128\0\132\0\0\1\196\0\0\1\204\0\192\1\28\64\1\2\4\1\128\1\64\1\0\0\129\65\0\0\28\129\128\1\0\0\0\2\4\1\128\1\64\1\128\0\129\65\0\0\28\129\128\1\64\0\0\2\4\1\128\1\64\1\0\1\129\65\0\0\28\129\128\1\128\0\0\2\4\1\128\1\64\1\128\1\129\65\0\0\28\129\128\1\192\0\0\2\4\1\0\1\12\129\64\2\8\1\0\1\14\193\192\1\78\1\65\1\12\65\1\2\78\65\193\0\12\65\1\2\12\1\0\2\30\1\0\1\30\0\128\0\6\0\0\0\3\0\0\0\0\0\0\8\64\3\0\0\0\0\0\160\98\64\3\0\0\0\0\0\0\16\64\3\0\0\0\0\0\0\112\65\3\0\0\0\0\0\0\240\64\3\0\0\0\0\0\0\112\64\0\0\0\0\37\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\4\0\0\0\2\0\0\0\99\0\6\0\0\0\36\0\0\0\2\0\0\0\111\0\6\0\0\0\36\0\0\0\2\0\0\0\97\0\6\0\0\0\36\0\0\0\2\0\0\0\101\0\6\0\0\0\36\0\0\0\4\0\0\0\2\0\0\0\100\0\2\0\0\0\97\0\2\0\0\0\108\0\2\0\0\0\110\0\0\0\0\0\1\0\0\0\1\0\0\0\4\0\0\5\13\0\0\0\4\0\0\0\68\0\128\0\132\0\0\1\196\0\128\1\4\1\128\1\92\128\0\2\129\0\0\0\28\128\128\1\68\0\128\1\76\64\192\0\72\0\128\1\30\0\0\1\30\0\128\0\2\0\0\0\3\0\0\0\0\0\160\98\64\3\0\0\0\0\0\0\240\63\0\0\0\0\13\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\2\0\0\0\101\0\8\0\0\0\12\0\0\0\4\0\0\0\2\0\0\0\110\0\2\0\0\0\100\0\2\0\0\0\97\0\2\0\0\0\108\0\0\0\0\0\1\0\0\0\1\0\0\0\3\0\0\9\52\0\0\0\4\0\0\0\28\128\128\0\68\0\0\0\92\128\128\0\129\0\0\0\196\0\128\0\0\1\128\0\65\1\0\0\129\65\0\0\220\128\0\2\206\128\192\1\204\0\128\1\4\1\128\0\64\1\128\0\129\193\0\0\193\1\1\0\28\129\0\2\68\1\128\0\128\1\128\0\193\65\1\0\92\129\128\1\81\65\1\131\23\192\65\2\22\192\1\128\23\192\193\1\22\128\0\128\142\193\193\2\158\1\0\1\22\64\3\128\1\1\0\0\129\192\1\0\22\128\2\128\23\0\66\2\22\0\2\128\23\192\193\1\22\192\0\128\143\193\65\128\142\129\129\2\154\65\0\0\22\64\0\128\143\193\193\131\142\129\129\2\158\1\0\1\132\1\0\1\192\1\128\2\13\66\66\2\156\129\128\1\207\129\194\1\204\193\1\1\142\193\1\3\158\1\0\1\30\0\128\0\11\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\0\52\64\3\0\0\0\0\0\0\240\65\3\0\0\0\0\0\0\53\64\3\0\0\0\0\0\0\63\64\3\0\0\0\0\0\0\64\64\3\0\0\0\0\0\0\240\191\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\252\159\64\3\0\0\0\0\0\248\143\64\3\0\0\0\0\0\0\48\67\0\0\0\0\52\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\6\0\0\0\2\0\0\0\110\0\2\0\0\0\51\0\0\0\2\0\0\0\108\0\4\0\0\0\51\0\0\0\2\0\0\0\99\0\5\0\0\0\51\0\0\0\2\0\0\0\110\0\12\0\0\0\51\0\0\0\2\0\0\0\111\0\17\0\0\0\51\0\0\0\2\0\0\0\108\0\22\0\0\0\51\0\0\0\3\0\0\0\2\0\0\0\111\0\2\0\0\0\101\0\2\0\0\0\98\0\0\0\0\0\1\0\0\0\1\0\0\0\8\1\0\14\44\0\0\0\26\64\0\0\22\128\1\128\132\0\0\0\156\128\128\0\0\0\0\1\23\0\64\0\22\64\0\128\129\64\0\0\158\0\0\1\132\0\128\0\196\0\0\1\4\1\128\1\68\1\128\1\76\1\128\2\77\129\192\2\156\128\0\2\64\0\0\1\132\0\128\1\140\0\0\1\136\0\128\1\138\0\0\0\193\128\0\0\20\1\128\0\65\129\0\0\224\0\3\128\196\1\0\2\4\2\128\2\68\2\0\3\132\2\128\0\192\2\128\0\0\3\0\3\64\3\0\3\156\2\0\2\92\130\0\0\129\194\0\0\28\2\128\1\220\129\0\0\137\192\1\3\223\64\252\127\196\0\128\3\0\1\0\1\221\0\0\1\222\0\0\0\30\0\128\0\4\0\0\0\3\0\0\0\0\0\0\0\0\4\1\0\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\160\98\64\0\0\0\0\44\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\7\0\0\0\2\0\0\0\101\0\0\0\0\0\43\0\0\0\2\0\0\0\111\0\0\0\0\0\43\0\0\0\2\0\0\0\101\0\21\0\0\0\43\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\24\0\0\0\39\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\24\0\0\0\39\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\24\0\0\0\39\0\0\0\2\0\0\0\108\0\25\0\0\0\38\0\0\0\8\0\0\0\2\0\0\0\117\0\2\0\0\0\99\0\2\0\0\0\97\0\2\0\0\0\108\0\2\0\0\0\114\0\2\0\0\0\110\0\2\0\0\0\100\0\2\0\0\0\103\0\0\0\0\0\1\0\0\0\1\0\0\0\1\0\3\5\9\0\0\0\74\0\0\0\165\0\0\0\98\64\0\0\132\0\0\0\193\0\0\0\37\1\0\0\156\0\0\0\94\0\0\0\30\0\128\0\1\0\0\0\4\2\0\0\0\35\0\0\0\0\0\9\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\4\0\0\0\97\114\103\0\0\0\0\0\8\0\0\0\1\0\0\0\2\0\0\0\102\0\0\0\0\0\1\0\0\0\1\0\0\0\7\0\0\18\152\0\0\0\10\0\0\2\65\0\0\0\129\0\0\0\193\0\0\0\1\1\0\0\34\64\0\2\74\0\0\0\138\0\0\0\202\0\128\2\0\1\0\0\67\1\128\2\128\1\128\0\195\1\128\3\0\2\0\1\226\64\128\2\1\65\0\0\68\1\0\0\92\129\128\0\129\65\0\0\32\193\19\128\4\2\128\0\68\2\0\0\92\130\128\0\129\130\0\0\28\130\128\1\68\2\128\0\132\2\0\0\156\130\128\0\193\194\0\0\92\130\128\1\132\2\0\1\192\2\0\4\1\67\0\0\65\3\1\0\156\130\0\2\196\2\0\1\0\3\128\4\65\67\0\0\129\67\1\0\220\130\0\2\10\3\128\2\64\3\128\5\132\3\0\1\192\3\0\4\1\132\1\0\65\68\1\0\156\131\0\2\195\3\0\8\64\4\128\4\34\67\128\2\23\0\64\5\22\0\3\128\68\3\0\1\128\3\0\4\193\195\1\0\1\4\2\0\92\131\0\2\9\67\3\131\68\3\0\1\128\3\0\4\193\131\2\0\1\196\2\0\92\131\0\2\9\67\131\132\22\64\8\128\23\64\64\5\22\128\1\128\68\3\0\1\128\3\128\4\193\195\1\0\1\4\3\0\92\131\0\2\9\67\3\131\22\0\6\128\23\0\65\5\22\192\1\128\68\3\0\1\128\3\128\4\193\195\1\0\1\68\3\0\92\131\0\2\77\131\195\6\9\67\3\131\22\128\3\128\23\128\65\5\22\0\3\128\68\3\0\1\128\3\128\4\193\195\1\0\1\68\3\0\92\131\0\2\77\131\195\6\9\67\3\131\68\3\0\1\128\3\0\4\193\131\2\0\1\196\2\0\92\131\0\2\9\67\131\132\9\0\131\3\31\129\235\127\4\1\128\1\28\129\128\0\201\0\129\135\4\1\0\0\28\129\128\0\74\1\0\1\129\1\0\0\193\1\0\0\98\65\0\1\129\65\0\0\192\1\0\2\1\66\0\0\160\193\5\128\132\2\128\1\156\130\128\0\195\2\128\5\23\64\64\5\22\128\1\128\4\3\128\1\28\131\128\0\23\0\64\6\22\0\0\128\194\66\0\0\194\2\128\0\22\128\2\128\23\0\65\5\22\192\0\128\4\3\0\2\28\131\128\0\192\2\0\6\22\0\1\128\23\128\65\5\22\128\0\128\4\3\128\2\28\131\128\0\192\2\0\6\73\193\130\4\159\129\249\127\201\64\1\130\129\65\0\0\196\1\0\0\220\129\128\0\1\66\0\0\160\193\0\128\141\66\192\4\196\2\0\3\220\130\128\0\73\192\2\5\159\129\254\127\222\0\0\1\30\0\128\0\16\0\0\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\32\108\64\3\0\0\0\0\0\0\100\64\3\0\0\0\0\0\0\0\64\3\0\0\0\0\0\0\38\64\3\0\0\0\0\0\0\8\64\3\0\0\0\0\0\0\40\64\3\0\0\0\0\0\0\52\64\3\0\0\0\0\0\0\20\64\3\0\0\0\0\0\0\53\64\3\0\0\0\0\0\0\61\64\3\0\0\0\0\0\128\64\64\3\0\0\0\0\0\0\64\64\3\0\0\0\0\254\255\47\65\3\0\0\0\0\0\0\16\64\0\0\0\0\152\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\25\0\0\0\2\0\0\0\114\0\6\0\0\0\151\0\0\0\2\0\0\0\105\0\7\0\0\0\151\0\0\0\2\0\0\0\108\0\8\0\0\0\151\0\0\0\2\0\0\0\97\0\15\0\0\0\151\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\19\0\0\0\101\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\19\0\0\0\101\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\19\0\0\0\101\0\0\0\2\0\0\0\97\0\20\0\0\0\100\0\0\0\2\0\0\0\99\0\25\0\0\0\100\0\0\0\2\0\0\0\111\0\30\0\0\0\100\0\0\0\2\0\0\0\110\0\35\0\0\0\100\0\0\0\2\0\0\0\108\0\40\0\0\0\100\0\0\0\2\0\0\0\108\0\50\0\0\0\100\0\0\0\2\0\0\0\108\0\106\0\0\0\151\0\0\0\2\0\0\0\110\0\110\0\0\0\151\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\113\0\0\0\139\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\113\0\0\0\139\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\113\0\0\0\139\0\0\0\2\0\0\0\111\0\114\0\0\0\138\0\0\0\2\0\0\0\101\0\116\0\0\0\138\0\0\0\2\0\0\0\108\0\117\0\0\0\138\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\144\0\0\0\150\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\144\0\0\0\150\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\144\0\0\0\150\0\0\0\2\0\0\0\108\0\145\0\0\0\149\0\0\0\7\0\0\0\2\0\0\0\111\0\2\0\0\0\110\0\2\0\0\0\101\0\2\0\0\0\116\0\2\0\0\0\119\0\2\0\0\0\104\0\2\0\0\0\100\0\0\0\0\0\1\0\0\0\1\0\0\0\3\3\0\8\15\0\0\0\198\0\64\0\6\65\64\0\70\129\64\0\134\193\64\0\228\1\0\0\0\0\128\1\0\0\0\2\0\0\128\2\0\0\0\3\4\0\0\0\4\0\128\0\0\0\0\1\4\0\0\1\222\1\0\1\30\0\128\0\4\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\0\0\64\3\0\0\0\0\0\0\8\64\3\0\0\0\0\0\0\16\64\1\0\0\0\0\0\0\0\1\0\0\0\1\0\0\0\8\0\3\25\128\0\0\0\68\0\0\0\132\0\128\0\196\0\0\1\4\1\128\1\68\1\0\2\129\1\0\0\193\65\0\0\10\2\0\0\74\2\0\0\165\2\0\0\98\66\0\0\132\2\128\2\193\130\0\0\37\3\0\0\156\130\0\0\141\2\64\5\202\2\0\0\10\3\0\0\65\195\0\0\128\3\0\5\193\3\0\0\96\67\2\128\25\0\4\2\22\0\1\128\77\4\1\8\140\4\64\8\134\132\132\4\9\130\132\8\22\128\0\128\76\4\64\8\70\68\132\4\9\67\4\8\95\3\253\127\77\3\1\5\76\3\192\6\131\3\128\7\134\131\129\0\198\3\64\7\25\0\193\7\22\192\11\128\25\0\192\7\22\192\3\128\23\192\192\7\22\128\1\128\6\68\65\7\68\4\0\3\134\4\65\7\134\132\4\1\70\132\132\8\9\67\4\8\22\64\18\128\6\68\65\7\68\4\0\3\134\4\65\7\134\132\4\1\70\132\132\8\9\67\4\8\22\128\16\128\23\64\193\7\22\128\5\128\6\68\65\7\74\4\0\0\129\196\0\0\198\4\65\7\204\196\4\8\205\4\192\9\12\5\64\8\64\5\128\9\129\5\0\0\32\133\0\128\140\4\64\9\6\198\5\6\73\4\6\9\31\197\254\127\6\5\4\6\68\5\128\3\128\5\128\8\193\5\0\0\13\6\132\9\92\5\0\2\28\69\0\0\192\1\0\8\22\64\10\128\6\68\65\7\70\4\65\7\70\68\4\1\9\67\4\8\22\0\9\128\25\128\193\7\22\128\6\128\24\192\131\131\22\128\5\128\6\68\65\7\74\4\0\0\129\196\0\0\198\4\65\7\204\196\4\8\205\4\192\9\12\5\64\8\64\5\128\9\129\5\0\0\32\133\0\128\140\4\64\9\6\198\5\6\73\4\6\9\31\197\254\127\6\5\4\6\68\5\128\3\128\5\128\8\193\5\0\0\13\6\132\9\92\5\0\2\28\69\0\0\192\1\0\8\22\64\2\128\30\0\128\0\22\192\1\128\23\0\194\7\22\64\0\128\30\0\128\0\22\192\0\128\6\68\65\7\70\4\65\7\70\68\4\1\9\67\4\8\140\1\64\3\22\0\233\127\30\0\128\0\9\0\0\0\3\0\0\0\0\0\0\240\63\3\0\0\0\0\0\0\240\191\4\2\0\0\0\35\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\8\64\3\0\0\0\0\0\0\0\64\3\0\0\0\0\0\0\20\64\3\0\0\0\0\0\0\16\64\3\0\0\0\0\0\0\24\64\0\0\0\0\128\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\36\0\0\0\4\0\0\0\97\114\103\0\0\0\0\0\127\0\0\0\2\0\0\0\104\0\1\0\0\0\127\0\0\0\2\0\0\0\110\0\2\0\0\0\127\0\0\0\2\0\0\0\101\0\3\0\0\0\127\0\0\0\2\0\0\0\111\0\4\0\0\0\127\0\0\0\2\0\0\0\108\0\5\0\0\0\127\0\0\0\2\0\0\0\99\0\6\0\0\0\127\0\0\0\2\0\0\0\100\0\7\0\0\0\127\0\0\0\2\0\0\0\117\0\8\0\0\0\127\0\0\0\2\0\0\0\97\0\11\0\0\0\127\0\0\0\2\0\0\0\116\0\16\0\0\0\127\0\0\0\2\0\0\0\108\0\17\0\0\0\127\0\0\0\2\0\0\0\101\0\18\0\0\0\127\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\21\0\0\0\33\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\21\0\0\0\33\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\21\0\0\0\33\0\0\0\2\0\0\0\108\0\22\0\0\0\32\0\0\0\2\0\0\0\108\0\35\0\0\0\127\0\0\0\2\0\0\0\108\0\36\0\0\0\127\0\0\0\2\0\0\0\111\0\36\0\0\0\127\0\0\0\2\0\0\0\111\0\61\0\0\0\82\0\0\0\2\0\0\0\99\0\62\0\0\0\82\0\0\0\2\0\0\0\110\0\63\0\0\0\82\0\0\0\2\0\0\0\108\0\66\0\0\0\82\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\69\0\0\0\74\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\69\0\0\0\74\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\69\0\0\0\74\0\0\0\2\0\0\0\108\0\70\0\0\0\73\0\0\0\2\0\0\0\111\0\93\0\0\0\114\0\0\0\2\0\0\0\99\0\94\0\0\0\114\0\0\0\2\0\0\0\110\0\95\0\0\0\114\0\0\0\2\0\0\0\108\0\98\0\0\0\114\0\0\0\12\0\0\0\40\102\111\114\32\105\110\100\101\120\41\0\101\0\0\0\106\0\0\0\12\0\0\0\40\102\111\114\32\108\105\109\105\116\41\0\101\0\0\0\106\0\0\0\11\0\0\0\40\102\111\114\32\115\116\101\112\41\0\101\0\0\0\106\0\0\0\2\0\0\0\108\0\102\0\0\0\105\0\0\0\8\0\0\0\2\0\0\0\111\0\2\0\0\0\110\0\2\0\0\0\101\0\2\0\0\0\108\0\2\0\0\0\117\0\2\0\0\0\102\0\2\0\0\0\114\0\2\0\0\0\105\0\15\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\7\0\0\0\2\0\0\0\108\0\0\0\0\0\14\0\0\0\2\0\0\0\101\0\0\0\0\0\14\0\0\0\2\0\0\0\114\0\0\0\0\0\14\0\0\0\2\0\0\0\111\0\1\0\0\0\14\0\0\0\2\0\0\0\110\0\2\0\0\0\14\0\0\0\2\0\0\0\101\0\3\0\0\0\14\0\0\0\2\0\0\0\108\0\4\0\0\0\14\0\0\0\3\0\0\0\2\0\0\0\117\0\2\0\0\0\102\0\2\0\0\0\105\0\84\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\24\0\0\0\2\0\0\0\100\0\2\0\0\0\83\0\0\0\2\0\0\0\114\0\4\0\0\0\83\0\0\0\2\0\0\0\99\0\6\0\0\0\83\0\0\0\2\0\0\0\103\0\8\0\0\0\83\0\0\0\2\0\0\0\98\0\10\0\0\0\83\0\0\0\2\0\0\0\115\0\14\0\0\0\83\0\0\0\2\0\0\0\108\0\15\0\0\0\83\0\0\0\2\0\0\0\102\0\16\0\0\0\83\0\0\0\2\0\0\0\105\0\17\0\0\0\83\0\0\0\2\0\0\0\117\0\18\0\0\0\83\0\0\0\2\0\0\0\104\0\22\0\0\0\83\0\0\0\2\0\0\0\97\0\25\0\0\0\83\0\0\0\2\0\0\0\110\0\33\0\0\0\83\0\0\0\2\0\0\0\101\0\34\0\0\0\83\0\0\0\2\0\0\0\108\0\35\0\0\0\83\0\0\0\2\0\0\0\111\0\40\0\0\0\83\0\0\0\2\0\0\0\116\0\45\0\0\0\83\0\0\0\2\0\0\0\119\0\49\0\0\0\83\0\0\0\2\0\0\0\117\0\50\0\0\0\83\0\0\0\2\0\0\0\104\0\59\0\0\0\83\0\0\0\2\0\0\0\108\0\60\0\0\0\83\0\0\0\2\0\0\0\117\0\62\0\0\0\83\0\0\0\2\0\0\0\100\0\70\0\0\0\83\0\0\0\2\0\0\0\98\0\74\0\0\0\83\0\0\0\0\0\0\0")()
