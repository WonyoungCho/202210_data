# 202210_data
Data processing in linux


# Process 1
```bash
file='OUT';time sed 's/./&\t/14;s/./&\t/13;s/./&\t/11;' ${file}.txt|cut -f1-3|sed '1 i\Col1\tCol2\tCol3s' > ${file}.txt.tab
```

# Process 2
```
cut --complement -f2 MP.txt > MP_re.txt
awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' > MP_1.txt
awk -F"\t" '{print $8}' MP_re.txt |awk -F"   " '{print $1}' > MP_2.txt
awk -F"\t" '{print $9}' MP_re.txt |awk -F"   " '{print $1}' > MP_3.txt
awk -F"\t" '{print $13"\t"$15"\t"$16"\t"$17}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4}' > MP_4.txt
awk -F"\t" '{print $18}' MP_re.txt |awk -F"  " '{print $1}' > MP_5.txt
awk -F"\t" '{print $19"\t"$20"\t"$21"\t"$22}' MP_re.txt |awk '{print $1"\t"$2"\t"$3"\t"$4}' > MP_6.txt
paste -d"\t" MP_1.txt MP_2.txt MP_3.txt MP_4.txt MP_5.txt MP_6.txt > MP.txt.new
```

# Search 1
```bash
grep -i 'word1\|word2' MP.txt.new
```
> **Option**
- `-i`: 대소문자 구분없이
- `-n`: 라인넘버와 함께 출력
- `-w`: 단어로 검색
- `-c`: 검색된 라인의 수를 출력

> **Meta-character**
- `^`: 라인의 시작점, `^pre`: 라인이 pre로 시작하는 라인.
- `$`: 라인의 끝나는점, `end$`: end로 끝나는 라인.
- `...`: 임의의 문자, `bl..k`:중간 `..`은 임의의 두 문자를 나타냄.
- `*`: 임의의 문자, `snake*`: `snake` 뒤에 무엇이든 붙은 라인.
- `[]`: 해당, `[abc123]er`: `er`앞에 `a,b,c,1,2,3` 들이 함께 있는 라인.
- `[^]`: 문자 제외, `[^abc123]er`: `er`앞에 `a,b,c,1,2,3` 들어 있지 않은 라인.


# Search 2
```bash
egrep `egrep -w 'word1|word2' MP.txt.new|awk '{print $1}'|paste -sd\|` MP.txt.new
```

# Search 3
```bash
grep "kidney" llt.txt|awk '{print $1}'|xargs -P $(nproc) -I{} awk '$3=={}' ADR.txt.new > searched1.txt

OR

time grep "kidney" llt.txt|awk '{print $1}'|xargs -P $(nproc) -I{} sh -c 'grep -P ".*\t.*\t$1" ADR.txt.new > "temp/$1.out"' -- {}
```

# Search 4
```bash
#!/usr/bin/env bash

args=$@
old="$IFS"
IFS="_"
dir="$*"
IFS="$old"

rm -r "temp/$dir"
mkdir -p "temp/$dir"

time grep "${args}" llt.txt|awk '{print $1}'|xargs -P $(($(nproc)-1)) -I{} sh -c 'grep -P ".*\t.*\t$1\b" ADR.txt.new > "temp/$2/$1.out"' -- {} $dir

find temp/$dir -size 0 -delete
```
