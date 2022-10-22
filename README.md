# 202210_data
Data processing in linux

```bash
$ file='OUT';time sed 's/./&\t/14;s/./&\t/13;s/./&\t/11;' ${file}.txt|cut -f1-3|sed '1 i\Col1\tCol2\tCol3s' > ${file}.txt.tab
```


