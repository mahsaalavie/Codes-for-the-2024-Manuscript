%%%%%%%%%%%%%%%%%%%%%%%Normalize mutual Information & Adjusted Rand Index%%%%%%%%%%%%%%%%%
load("PurityTest.Result.mat")
nmi_CSPA = nmi(DATA(:,5),DATA(:,6));
nmi_HGPA = nmi(DATA(:,5),DATA(:,7));
nmi_GA = nmi(DATA(:,5),DATA(:,8));
nmi_FCM = nmi(DATA(:,5),DATA(:,9));
ri_CSPA = rand_index(DATA(:,5), DATA(:,6));
ri_HGPA = rand_index(DATA(:,5), DATA(:,7));
ri_GA = rand_index(DATA(:,5), DATA(:,8));
ri_FCM = rand_index(DATA(:,5), DATA(:,9));
save("NMIARITest.Result.mat")