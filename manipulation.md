# Useful
```bash
awk '{$9=($7+$8)/2; print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' old.txt > new.txt
```

```bash
awk '$9>0 {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' old.txt > new.txt
```
