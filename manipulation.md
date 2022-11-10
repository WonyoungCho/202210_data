# Useful
```bash
awk '{$9=($7+$8)/2; print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' old.txt > new.txt
```

```bash
awk '$9>0 {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' old.txt > new.txt
```

# Join two files by first second in file1 and first column in file2
```bash
join -t $'\t' -1 2 -2 1 <(sort -gk2 file1) <(sort -gk1 file2) > file3
```

```bash
awk '{print $2"\t"$4"\t"$3}' file1 |sort -gk2 > file2
```
