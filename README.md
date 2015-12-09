# katadasaR
Provides a function to retrieve word stem (a.k.a. word stemming) for Bahasa Indonesia using Nazief and Andriani's algorithm. It consists of set of features to remove prefixes, suffixes or both, but still unable for infixes removal. This package is ported from C sharp code provided by [csharp-indonesia](http://www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html). Credit goes to original author(s).

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

## output:
## [1] "makan"

words <- c("jakarta", "seminar", "penggunaan", "menggurui", "pelajaran", "dimana")
sapply(words, katadasaR)

## output
##    jakarta    seminar penggunaan  menggurui  pelajaran     dimana 
##  "jakarta"  "seminar"     "guna"     "guru"     "ajar"     "mana" 
```

### Acknowledgement
_Ported from:_ [csharp-indonesia.com](www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html)




