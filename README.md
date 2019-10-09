# pancor

## Installation

```r
devtools::install_github("xuzhougeng/pancor")
library(pancor)
```

## Usage:

test dasta

```r
data("pancancer_small")
df <- pancor(pancancer_small, "METTL3", "SETD2")
ggpancor(df)
```         

```r
ggcorplot(pancancer_small, "METTL3","SETD2", cor.test.method = "pearson")
```

If you want to use the full data, you need download our preprocessed Rdata with  `getExprSet`

```r
getExprSet("pancancer_mRNA_exprSet.Rdata")
```

Then load this data to environment

```r
load("pancancer_mRNA_exprSet.Rdata")
```

The following analysis is same as previous

```r
df <- pancor(mRNA_exprSet, "METTL3", "SETD2")
ggpancor(df)

ggcorplot(mRNA_exprSet, "METTL3","SETD2", cor.test.method = "pearson")
```

## Reference

- [跟Nature一起学习TCGA,GTEx和CCLE数据库的使用](https://mp.weixin.qq.com/s/_04Mx72q-jQigkCzfZ20Kw)

