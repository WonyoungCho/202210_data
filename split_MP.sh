cut --complement -f2 MP.txt > MP_re.txt
awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' > MP_1.txt
awk -F"\t" '{print $8}' MP_re.txt |awk -F"   " '{print $1}' > MP_2.txt
awk -F"\t" '{print $9}' MP_re.txt |awk -F"   " '{print $1}' > MP_3.txt
awk -F"\t" '{print $13"\t"$15"\t"$16"\t"$17}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4}' > MP_4.txt
awk -F"\t" '{print $18}' MP_re.txt |awk -F"  " '{print $1}' > MP_5.txt
awk -F"\t" '{print $19"\t"$20"\t"$21"\t"$22}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4}' > MP_6.txt
paste -d"\t" MP_1.txt MP_2.txt MP_3.txt MP_4.txt MP_5.txt MP_6.txt > MP.txt.new
