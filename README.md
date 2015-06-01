# PhDthese
cp /home/orblancog/Public/lab/CERN/docs/reports/rep01/sigma_Bfix5e-3T.eps .
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/calibafterBPF/plots/*.pdf .
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/calibvschargevssample/image01_Calvscharge.pdf .
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/calibvschargevssample/IPByCal11_10dB_sample68.pdf figures/
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/jitter20141211o/plots/*pdf figures/
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/3BPMreso20141220s/3BPM_Measured_Predicted_changing_cals.pdf figures/
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/ana/BPMana/2014DecAna/FF_section/lattice_ATF2_FF.pdf figures/
pdftk  A=../../bib/master07-nakamura-tokyo-univ.pdf cat A58 output figures/Electr.pdf
pdfcrop --margins '-60 -30 -60 -35' figures/Electr.pdf 
cp /home/orblancog/Public/lab/KEK/acc/atf2/BPM/IPBPM/docs/manuals/BPMs_positioning_system/figures/image01_sense.pdf .
cp /home/orblancog/Public/lab/LAL/acc/ilc/test/Nominal500GeV.dis1.1/lattice_ILC500_FF.eps .
cp /home/orblancog/Public/lab/LAL/acc/ilc/test/Nominal500GeV.dis1.1/lattice_ILC500_FF.eps .
