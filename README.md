# katadasaR
**An R Package of Word Stemming for Bahasa Indonesia Using Nazief &amp; Adriani's Algorithm**

### How to Use
This package is currenly under development. Not ready to be installed to R library even with `devtools::install_github()`. However, you still able to run and test all functions using `devtools::load_all()`.

```r
setwd("path\\to\\folder\\katadasaR")
library(devtools)
load_all()

words <- c("jakarta", "seminar", "penggunaan", "menggurui", "pelajaran", "dimana")
sapply(words, katadasaR)

## output
##    jakarta    seminar penggunaan  menggurui  pelajaran     dimana 
##  "jakarta"  "seminar"     "guna"     "guru"     "ajar"     "mana" 
```

### Acknowledgement
_Ported from:_ [csharp-indonesia.com](www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html)




