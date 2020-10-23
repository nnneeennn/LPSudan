#on Uppmax 
cd /home/ninah/storage_PhDProjects/b2017225/private/phasedfiles/

module load bioinfo-tools plink 
plink --bfile SNPchipLCTothers_chr2phased_dup --recode vcf --out SNPchipLCTothers_chr2phased_dup_haplostrip
gzip SNPchipLCTothers_chr2phased_dup_haplostrip.vcf
awk '{print $1"_"$2"\t"$1"\t"$1}' SNPchipLCTothers_chr2phased_dup.fam >poptable2

#on local machine 
cd /Users/ninahollfelder/Documents/LPSudan/A\ work\ area/Analyses

scp ninah@rackham.uppmax.uu.se:/home/ninah/storage_PhDProjects/b2017225/private/phasedfiles/SNPchipLCTothers_chr2phased_dup_haplostrip.vcf.gz .

scp ninah@rackham.uppmax.uu.se:/home/ninah/storage_PhDProjects/b2017225/private/phasedfiles/poptable2 .

haplostrips -v SNPchipLCTothers_chr2phased_dup_haplostrip.vcf.gz  -i  2:136578866-136633976   \
-P poptable2 \
-p BeniAmer,Hadendowa,Gaalien,Bataheen,Shaigia,Messiria,Danagla,Mahas,Halfawieen,Dinka,Nuer,Shilluk,Baria,Copt,Hausa,Zagawa,Nuba,Gemar \
-C "#E78AC3","#FB9A99","#80B1D3","#8DA0CB","#BEAED4","#BC80BD","#FED9A6","#E5C494","#FDCDAC","#B3DE69","#1B9E77","#CCEBC5","#7FC97F","#FFD92F","#E41A1C","#D9D9D9","#F2F2F2","#666666" \
 -o LCTphase_intervalfig2

