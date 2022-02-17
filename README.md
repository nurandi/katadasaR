# katadasaR
Provides a function to retrieve word stem (a.k.a. word stemming) for Bahasa Indonesia using Nazief and Andriani's algorithm. It consists of set of features to remove prefixes, suffixes or both, but still unable for infixes removal. This package is ported from C sharp code provided by [csharp-indonesia.com](http://www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html). Credit goes to original author(s).

### Install
This package is currenly under development. You can install using `devtools::install_github()` functions. 

```r
## install.packages("devtools")
library(devtools)
install_github("nurandi/katadasaR")
```

### Usage
`katadasaR` a.k.a `katadasar` function checks if a word is word stem and do stemming process if it is an affixed word. Unfortunately, the function only able to process one word per call. See `?katadasaR` for detail.

```r
library(katadasaR)

katadasar("makanan")

## [1] "makan"

words <- c("jakarta", "seminar", "penggunaan", "menggurui", "pelajaran", "dimana", "menyampaikan")
sapply(words, katadasaR)

##    jakarta    seminar penggunaan  menggurui  pelajaran     dimana   menyampaikan 
##  "jakarta"  "seminar"     "guna"     "guru"     "ajar"     "mana"       "sampai"
```

### Acknowledgement
_Ported from:_ [csharp-indonesia.com](http://www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html)


### Related Article
[katadasaR : Stemming Bahasa Indonesia dengan R - nurandi.net](https://nurandi.net/r/katadasar-stemming-bahasa-indonesia-dengan-r/)

---

```r
sessionInfo()

# R version 4.1.2 (2021-11-01)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 22000)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
# [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.1252    
# system code page: 65001
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] katadasaR_0.1
# 
# loaded via a namespace (and not attached):
#  [1] rstudioapi_0.13   magrittr_2.0.2    usethis_2.1.5     devtools_2.4.3    pkgload_1.2.4    
#  [6] R6_2.5.1          rlang_1.0.1       fastmap_1.1.0     tools_4.1.2       pkgbuild_1.3.1   
# [11] sessioninfo_1.2.2 cli_3.1.1         withr_2.4.3       ellipsis_0.3.2    remotes_2.4.2    
# [16] rprojroot_2.0.2   lifecycle_1.0.1   crayon_1.4.2      brio_1.1.3        processx_3.5.2   
# [21] purrr_0.3.4       callr_3.7.0       fs_1.5.2          ps_1.6.0          testthat_3.1.2   
# [26] memoise_2.0.1     glue_1.6.1        cachem_1.0.6      compiler_4.1.2    desc_1.4.0       
# [31] prettyunits_1.1.1
```



