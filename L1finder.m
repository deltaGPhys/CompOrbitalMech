moonpos = 384400e3;
moonmass = 7.34767309e22;
Earthpos = 0;
Earthmass = 5.9722e24;

baryfromEarth = moonpos*moonmass/(moonmass+Earthmass);
moonpos = moonpos - baryfromEarth
Earthpos = -baryfromEarth

G = 6.67e-11;
omega = 2*pi/2360591.6 %system rotation angular v

syms r %location, from barycenter

eq = G*Earthmass/(r-Earthpos)^2 - G*moonmass/(moonpos-r)^2 - omega^2*r == 0;

L1frombary = vpasolve(eq,r, [-Inf Inf])
L1fromEarth = L1frombary+baryfromEarth
disp(['L1''s distance from the barycenter: ',num2str(L1frombary/1000),' km. From Earth, ',num2str(L1fromEarth/1000),' km'])