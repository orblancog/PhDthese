reset
set terminal postscript enhanced landscape color "Times-Roman,30" linewidth 3;
#set log y

#set xrange[0.5:1e5]
#set xlabel '{/Symbol b}^*_y'
#set format x '10^{%L}'
#set xtics ("BPMA" -167.9, "BPMB" -87.1,"BPMC" 87.1)
set xrange[-200:100]
set xlabel "s [mm]"

set ylabel "{/Symbol s}_x [{/Symbol m}m]"
#set yrange[:1e4]
#set format y '10^{%L}'

set label "IP" at -7,10
### Waist at IP position
sA=-80.8e-3-87.1e-3#0
sB=-87.1e-3
sC=-87.1e-3+174.2e-3#0

bstar = 4.0e-3
esx=sqrt(2.8e-6/2544)

BPMsx(x) =1e6*esx*sqrt(bstar+(x*1e-3)**2/(bstar))
BPM100sx(x) =1e6*esx*sqrt(1e2*bstar+(x*1e-3)**2/(1e2*bstar))
BPM10sx(x) =1e6*esx*sqrt(1e1*bstar+(x*1e-3)**2/(1e1*bstar))
#BPMAy(x)=1e6*ey*sqrt(x*bstar+sA**2/(x*bstar))
#BPMBy(x)=1e6*ey*sqrt(x*bstar+sB**2/(x*bstar))
#BPMCy(x)=1e6*ey*sqrt(x*bstar+sC**2/(x*bstar))
#BPMAyp(x)=3200*ey*1/sqrt(x*bstar+sA**2/(x*bstar))
#BPMByp(x)=3200*ey*1/sqrt(x*bstar+sB**2/(x*bstar))
#BPMCyp(x)=3200*ey*1/sqrt(x*bstar+sC**2/(x*bstar))
set output "optics_BX.eps";
plot BPMsx(x) ti '1BX', BPM10sx(x) ti '10BX', BPM100sx(x) ti '100BX'# BPMyp(x) ti "3200{/Symbol s}_{y'}", BPMy(x)+BPMyp(x) ti 'TOTAL'
#set output "plots/image03a.eps";
#plot BPMAy(x) ti '{/Symbol s}_{yA}', BPMAyp(x) ti "3200{/Symbol s}_{y'A}", BPMAy(x)+BPMAyp(x) ti 'TOTAL'
#set output "plots/image03b.eps";
#plot BPMAy(x) ti '{/Symbol s}_{yA}', BPMAyp(x) ti "{/Symbol s}_{y'A}", BPMBy(x)+BPMCyp(x) ti 'TOTAL'
#set output "plots/image03c.eps";
#plot BPMAy(x) ti '{/Symbol s}_{yA}', BPMAyp(x) ti "{/Symbol s}_{y'A}", BPMCy(x)+BPMCyp(x) ti 'TOTAL'

#,g(x) ti "3200({/Symbol s}_{y'A}+{/Symbol s}_{y'B}+{/Symbol s}_{y'C})",f(x)+g(x) ti 'TOTAL'#, '-' w p ti '(1,88.7)', '-' w p ti '(1000,4.74)'
#set output "plots/image03b.eps";

#set output "plots/image03c.eps";

#plot 1e6*ey*(sqrt(x*bstar+sA**2/(x*bstar))+sqrt(x*bstar+sB**2/(x*bstar))+sqrt(x*bstar+sC**2/(x*bstar)))+3200*ey*(1/sqrt(x*bstar+sA**2/(x*bstar))+1/sqrt(x*bstar+sB**2/(x*bstar))+1/sqrt(x*bstar+sC**2/(x*bstar))) ti 'BPMA + BPMB + BPMC', '-' w p ti '(1,100)', '-' w p ti '(1000,3)'
#1 88.7
#e
#1000 4.74
#e


