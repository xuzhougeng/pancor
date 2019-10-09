# pancor

## Installation

```r
devtools::install_github("xuzhougeng/pancor")
library(pancor)
```

## Usage:

```r
data("pancancer_small")
df <- pancor(pancancer_small, "METTL3", "SETD2")
ggpancor(df)
```         

```r
ggcorplot(pancancer_small, "METTL3","SETD2", cor.test.method = "pearson")
```

## Reference

- [跟Nature一起学习TCGA,GTEx和CCLE数据库的使用](https://mp.weixin.qq.com/s/_04Mx72q-jQigkCzfZ20Kw)

